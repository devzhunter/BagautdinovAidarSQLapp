-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 16, 2023 at 11:18 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baidar`
--

-- --------------------------------------------------------

--
-- Table structure for table `jurnalycheta`
--

CREATE TABLE `jurnalycheta` (
  `idYcheta` int(5) NOT NULL,
  `DataPriema` date NOT NULL,
  `idPacienta` int(5) NOT NULL,
  `idBoleznei` int(5) NOT NULL,
  `idVracha` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jurnalycheta`
--

INSERT INTO `jurnalycheta` (`idYcheta`, `DataPriema`, `idPacienta`, `idBoleznei`, `idVracha`) VALUES
(1, '2021-01-05', 1, 1, 3),
(2, '2021-02-15', 2, 2, 2),
(3, '2021-03-07', 3, 3, 1),
(4, '2021-04-18', 4, 4, 4),
(5, '2021-05-22', 5, 5, 2),
(6, '2021-06-10', 6, 6, 3),
(7, '2021-07-01', 7, 7, 1),
(8, '2021-08-12', 8, 8, 4),
(9, '2021-09-04', 9, 9, 3),
(10, '2021-10-02', 10, 10, 2),
(11, '2021-11-19', 11, 11, 1),
(12, '2021-12-08', 12, 12, 4),
(13, '2022-01-13', 13, 13, 2),
(14, '2022-02-07', 14, 14, 3),
(15, '2022-03-22', 15, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pacienti`
--

CREATE TABLE `pacienti` (
  `idPacienta` int(5) NOT NULL,
  `Familliya` varchar(30) NOT NULL,
  `Imya` varchar(30) NOT NULL,
  `Otchestvo` varchar(30) NOT NULL,
  `DataRojden` date NOT NULL,
  `Adres` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pacienti`
--

INSERT INTO `pacienti` (`idPacienta`, `Familliya`, `Imya`, `Otchestvo`, `DataRojden`, `Adres`) VALUES
(1, 'Иванов', 'Иван', 'Иванович', '1980-01-01', 'г.Москва, ул. Ленина, 10'),
(2, 'Петрова', 'Елена', 'Александровна', '1995-02-25', 'г.Санкт-Петербург, пр.Невский, 20'),
(3, 'Сидоров', 'Петр', 'Данилович', '1975-06-10', 'г.Екатеринбург, ул. Мира, 5'),
(4, 'Козлов', 'Сергей', 'Владимирович', '1982-07-15', 'г.Тюмень, пр. Мира, 8'),
(5, 'Миронова', 'Наталья', 'Петровна', '1990-08-20', 'г.Казань, ул. Кремлевская, 15'),
(6, 'Ильина', 'Анна', 'Николаевна', '1987-03-05', 'г.Сочи, ул. Весенняя, 1'),
(7, 'Крылов', 'Максим', 'Дмитриевич', '1998-11-30', 'г.Самара, ул. Гагарина, 23'),
(8, 'Андреев', 'Кирилл', 'Артемович', '1992-12-07', 'г.Омск, ул. Молодежная, 13'),
(9, 'Петухова', 'Оксана', 'Игоревна', '1985-04-18', 'г.Ставрополь, ул. Лермонтова, 7'),
(10, 'Лебедев', 'Алексей', 'Витальевич', '1991-05-22', 'г.Красноярск, ул. Советская, 16'),
(11, 'Трофимова', 'Мария', 'Владимировна', '1996-09-02', 'г.Пермь, ул. Пушкина, 25'),
(12, 'Жуков', 'Станислав', 'Андреевич', '1984-10-12', 'г.Новосибирск, ул. Строителей, 18'),
(13, 'Карпов', 'Игорь', 'Валерьевич', '1986-11-14', 'г.Волгоград, пр. Ленина, 14'),
(14, 'Белова', 'Тамара', 'Васильевна', '1978-12-27', 'г.Ростов-на-Дону, ул. Революции, 12'),
(15, 'Кудряшов', 'Артем', 'Андреевич', '1997-01-08', 'г.Ульяновск, пр. Октября, 22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `login` varchar(100) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `name` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `pass`, `name`, `lastname`) VALUES
(13, 'aidar', '123', 'Айдар', 'Амирович'),
(11, 'devzor', '123', 'Айдар', 'Амирович');

-- --------------------------------------------------------

--
-- Table structure for table `vidiboleznei`
--

CREATE TABLE `vidiboleznei` (
  `idBoleznei` int(5) NOT NULL,
  `nazvanie` varchar(30) NOT NULL,
  `simptomi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vidiboleznei`
--

INSERT INTO `vidiboleznei` (`idBoleznei`, `nazvanie`, `simptomi`) VALUES
(1, 'Грипп', 'Температура, головная боль, кашель, насморк'),
(2, 'Ангина', 'Боль в горле, температура, затрудненное глотание'),
(3, 'Бронхит', 'Кашель, слабость, головная боль, повышенная температура'),
(4, 'Пневмония', 'Кашель, боль в грудной клетке, слабость, повышенная температура'),
(5, 'Астма', 'Затрудненное дыхание, приступы задышки, чувство сдавления в груди'),
(6, 'Аллергия', 'Крапивница, зуд кожи, насморк, слезотечение'),
(7, 'Диабет', 'Частое мочеиспускание, жажда, сухость во рту'),
(8, 'Гастрит', 'Боль в желудке, отрыжка, изжога, тошнота'),
(9, 'Язва желудка', 'Боль в животе, тошнота, рвота, отрыжка'),
(10, 'Колит', 'Понос, запор, боли в животе'),
(11, 'Гепатит', 'Увеличение печени, желтуха, усталость'),
(12, 'Цистит', 'Частое мочеиспускание, боль при мочеиспускании'),
(13, 'Пиелонефрит', 'Ломота в пояснице, повышенная температура, боль при мочеиспускании'),
(14, 'Остеохондроз', 'Боль в спине, в шее, ограниченность движений'),
(15, 'Ревматоидный артрит', 'Отечность и болезненность суставов, ограниченность движений');

-- --------------------------------------------------------

--
-- Table structure for table `vrachi`
--

CREATE TABLE `vrachi` (
  `idVracha` int(5) NOT NULL,
  `Familliya` varchar(30) NOT NULL,
  `Imya` varchar(30) NOT NULL,
  `Otchestvo` varchar(30) NOT NULL,
  `Specialnost` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vrachi`
--

INSERT INTO `vrachi` (`idVracha`, `Familliya`, `Imya`, `Otchestvo`, `Specialnost`) VALUES
(1, 'Иванов', 'Иван', 'Иванович', 'Терапевт'),
(2, 'Петров', 'Сергей', 'Александрович', 'Хирург'),
(3, 'Сидоров', 'Дмитрий', 'Евгеньевич', 'Офтальмолог'),
(4, 'Козлова', 'Елена', 'Владимировна', 'Ревматолог'),
(5, 'Миронов', 'Андрей', 'Викторович', 'Невропатолог'),
(6, 'Ильина', 'Наталья', 'Александровна', 'Отоларинголог'),
(7, 'Крылов', 'Александр', 'Петрович', 'Кардиолог'),
(8, 'Андреева', 'Татьяна', 'Павловна', 'Дерматолог'),
(9, 'Петухов', 'Сергей', 'Витальевич', 'Стоматолог'),
(10, 'Лебедева', 'Ольга', 'Николаевна', 'Гинеколог'),
(11, 'Трофимов', 'Владимир', 'Викторович', 'Уролог'),
(12, 'Жукова', 'Маргарита', 'Сергеевна', 'Педиатр'),
(13, 'Карпова', 'Анастасия', 'Дмитриевна', 'Невролог'),
(14, 'Белов', 'Ярослав', 'Александрович', 'Хирург'),
(15, 'Кудряшова', 'Ирина', 'Олеговна', 'Гастроэнтеролог');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jurnalycheta`
--
ALTER TABLE `jurnalycheta`
  ADD PRIMARY KEY (`idYcheta`),
  ADD KEY `idPacienta` (`idPacienta`),
  ADD KEY `idBoleznei` (`idBoleznei`),
  ADD KEY `idVracha` (`idVracha`);

--
-- Indexes for table `pacienti`
--
ALTER TABLE `pacienti`
  ADD PRIMARY KEY (`idPacienta`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `vidiboleznei`
--
ALTER TABLE `vidiboleznei`
  ADD PRIMARY KEY (`idBoleznei`);

--
-- Indexes for table `vrachi`
--
ALTER TABLE `vrachi`
  ADD PRIMARY KEY (`idVracha`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jurnalycheta`
--
ALTER TABLE `jurnalycheta`
  MODIFY `idYcheta` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pacienti`
--
ALTER TABLE `pacienti`
  MODIFY `idPacienta` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vidiboleznei`
--
ALTER TABLE `vidiboleznei`
  MODIFY `idBoleznei` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `vrachi`
--
ALTER TABLE `vrachi`
  MODIFY `idVracha` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jurnalycheta`
--
ALTER TABLE `jurnalycheta`
  ADD CONSTRAINT `jurnalycheta_ibfk_1` FOREIGN KEY (`idPacienta`) REFERENCES `pacienti` (`idPacienta`),
  ADD CONSTRAINT `jurnalycheta_ibfk_2` FOREIGN KEY (`idVracha`) REFERENCES `vrachi` (`idVracha`),
  ADD CONSTRAINT `jurnalycheta_ibfk_3` FOREIGN KEY (`idBoleznei`) REFERENCES `vidiboleznei` (`idBoleznei`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
