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
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
            this.pass.AutoSize = false;
            this.pass.Size = new Size(this.pass.Size.Width, 34);

        }

        private void label2_Click(object sender, EventArgs e)
        {
            Application.Exit(); 
        }

        private void closeButton_MouseEnter(object sender, EventArgs e)
        {
            closeButton.ForeColor = Color.Red;
        }

        private void closeButton_MouseLeave(object sender, EventArgs e)
        {
            closeButton.ForeColor = Color.Black;
        }
        Point lastPoint;
        private void panel1_MouseMove(object sender, MouseEventArgs e)
        {
            if(e.Button == MouseButtons.Left)
            {
                this.Left += e.X - lastPoint.X;
                this.Top += e.Y - lastPoint.Y;

            }
        }

        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            lastPoint = new Point(e.X, e.Y);
        }

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            String loginUser = user.Text; 
            String passUser  = pass.Text;   
            
            DB  db = new DB(); 

            DataTable table = new DataTable();

            MySqlDataAdapter adapter = new MySqlDataAdapter();

            MySqlCommand command = new MySqlCommand("SELECT * FROM `users` WHERE `login` = @uL AND `pass` = @uP" ,db.getConnection());

            command.Parameters.Add("@uL", MySqlDbType.VarChar).Value = loginUser;
            command.Parameters.Add("@uP", MySqlDbType.VarChar).Value = passUser;
            adapter.SelectCommand = command;
            adapter.Fill(table);

            if (table.Rows.Count > 0)

            {
                MessageBox.Show("Добро пожаловать!"); 
                this.Hide();
                MainForm main = new MainForm();
                main.Show();    
            }    
            else

                MessageBox.Show("Неправильный логин или пароль! Повторите попытку");

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

        private void Registr_Click(object sender, EventArgs e)
        {
       
        }

        private void Registr_Click_1(object sender, EventArgs e)
        {
            this.Hide();
            Регистрация regist = new Регистрация();
            regist.Show();
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {

        }
    }
    }

