using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BdBagautdinovAidar
{
    public partial class Регистрация : Form
    {
        public Регистрация()
        {
            InitializeComponent();
            this.pass.AutoSize = false;
            this.pass.Size = new Size(this.pass.Size.Width, 34);
            userName.ForeColor = Color.Gray;
            userName.Text = "Введите имя";
        }

        private void closeButton_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        Point lastPoint;
        private void panel1_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                this.Left += e.X - lastPoint.X;
                this.Top += e.Y - lastPoint.Y;

            }
        }

        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            lastPoint = new Point(e.X, e.Y);
        }

        private void userName_Enter(object sender, EventArgs e)
        {
            if (userName.Text == "Введите имя")
            {
                userName.Text = "";
                userName.ForeColor = Color.Black;
            }
        }

        private void userName_Leave(object sender, EventArgs e)
        {
            if (userName.Text == "")
            {
                userName.Text = "Введите имя";
                userName.ForeColor = Color.Gray;
            }
        }

        private void Email_Leave(object sender, EventArgs e)
        {
            if (Email.Text == "")
            {
                Email.Text = "Введите отчество";
                Email.ForeColor = Color.Gray;
            }
        }

        private void Email_Enter(object sender, EventArgs e)
        {
            if (Email.Text == "Введите отчество")
            {
                Email.Text = "";
                Email.ForeColor = Color.Black;
            }
        }

        private void user_Leave(object sender, EventArgs e)
        {
            if (user.Text == "")
            {
                user.Text = "Введите логин";
                user.ForeColor = Color.Gray;
            }
        }

        private void user_Enter(object sender, EventArgs e)
        {
            if (user.Text == "Введите логин")
            {
                user.Text = "";
                user.ForeColor = Color.Black;
            }
        }

        private void pass_Leave(object sender, EventArgs e)
        {
            if (pass.Text == "")
            {
                pass.Text = "Введите пароль";
                pass.ForeColor = Color.Gray;
            }
        }

        private void pass_Enter(object sender, EventArgs e)
        {
            if (pass.Text == "Введите пароль")
            {
                pass.Text = "";
                pass.ForeColor = Color.Black;
            }
        }

        private void buttonRegistr_Click(object sender, EventArgs e)
        {
            if(userName.Text == "Введите имя")
            {
                MessageBox.Show("Вы забыли ввести имя!");
                return;
            }

            if (user.Text == "Введите логин")
            {
                MessageBox.Show("Вы забыли ввести логин!");
                return;
            }

            if (pass.Text == "Введите пароль")
            {
                MessageBox.Show("Вы забыли ввести пароль!");
                return;
            }

            if (Email.Text == "Введите отчество")
            {
                MessageBox.Show("Вы забыли ввести отчество!");
                return;
            }

            if (check())
                return;
            DB db = new DB();
            MySqlCommand command = new MySqlCommand("INSERT INTO `users` (`login`, `pass`, `name`, `lastname`) VALUES (@login, @pass, @name, @lastname);", db.getConnection());

            command.Parameters.Add("@login", MySqlDbType.VarChar).Value = user.Text;
            command.Parameters.Add("@pass", MySqlDbType.VarChar).Value = pass.Text;
            command.Parameters.Add("@name", MySqlDbType.VarChar).Value = userName.Text;
            command.Parameters.Add("@lastname", MySqlDbType.VarChar).Value = Email.Text;

            db.openConnection();
            if (command.ExecuteNonQuery() == 1)
            {
                MessageBox.Show("Аккаунт создан!");
                this.Hide();
                LoginForm log = new LoginForm();
                log.Show();
            }

            else
                MessageBox.Show("Аккаунт не создан!");
            db.closeConnection();
        }
        public Boolean check ()
        {

            DB db = new DB();

            DataTable table = new DataTable();

            MySqlDataAdapter adapter = new MySqlDataAdapter();

            MySqlCommand command = new MySqlCommand("SELECT * FROM `users` WHERE `login` = @uL", db.getConnection());

            command.Parameters.Add("@uL", MySqlDbType.VarChar).Value = user.Text;
           
            adapter.SelectCommand = command;
            adapter.Fill(table);

            if (table.Rows.Count > 0)
            {
                MessageBox.Show("Такой логин уже есть, введите другой!");
                return true;
            }


            else

                return false;
        }

        private void Registr_Click(object sender, EventArgs e)
        {
            this.Hide();
            LoginForm login = new LoginForm();
            login.Show();
        }
    }
}
