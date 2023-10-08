-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2023 at 12:19 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `musica`
--

-- --------------------------------------------------------

--
-- Table structure for table `albuns`
--

CREATE TABLE `albuns` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `artista_id` int(11) NOT NULL,
  `data_lancamento` date DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `albuns`
--

INSERT INTO `albuns` (`id`, `nome`, `artista_id`, `data_lancamento`, `descricao`) VALUES
(1, 'Concentrado', 1, '1982-10-25', 'Álbum de estúdio da banda GNR.'),
(2, 'Brothers in Arms', 2, '1985-05-13', 'Álbum icônico da banda Dire Straits.'),
(3, 'Making Movies', 2, '1980-10-17', 'Álbum de estúdio da banda Dire Straits.'),
(5, 'Reckless 30th Anniversary', 4, '2014-11-10', 'Edição comemorativa de 30 anos do álbum Reckless de Bryan Adams.'),
(6, 'Abbey Road', 11, '1969-09-26', 'Álbum de estúdio da banda The Beatles.');

-- --------------------------------------------------------

--
-- Table structure for table `artistas`
--

CREATE TABLE `artistas` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `tipo_artista` enum('Grupo','Artista Solo') NOT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artistas`
--

INSERT INTO `artistas` (`id`, `nome`, `tipo_artista`, `genero`, `descricao`) VALUES
(1, 'GNR', 'Grupo', 'Rock', 'Os GNR são uma banda de rock portuguesa.'),
(2, 'Dire Straits', 'Grupo', 'Rock', 'Banda de rock britânica.'),
(4, 'Bryan Adams', 'Artista Solo', 'Rock', 'Cantor e compositor canadense.'),
(11, 'The Beatles', 'Grupo', 'Rock', 'Banda de rock britânica.');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `albuns_id` int(11) DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `lyrics` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `title`, `albuns_id`, `duration`, `lyrics`) VALUES
(1, 'So Far Away', 2, '05:12:00', 'Here I am again in this mean old town and you...'),
(2, 'Money for Nothing', 2, '08:26:00', 'Now look at them yo-yos that...'),
(3, 'One Night Love Affair', 5, '04:32:00', 'You\'re the silent type and you caught my eye...'),
(4, 'Shes Only Happy When Shes Dancin', 5, '03:13:00', 'Monday mornin-its time to get up...'),
(5, 'One Night Love', 5, '04:33:00', 'You are the silent type...'),
(6, 'Run To You', 5, '03:53:00', 'She says her love for me could never...'),
(7, 'Heaven', 5, '04:03:00', 'Oh!! Thinking about all our younger...'),
(8, 'Somebody', 5, '04:43:00', 'I bin lookin for someone...'),
(9, 'Summer of 69', 5, '03:36:00', 'I got my first real six-string...'),
(10, 'Kids Wanna Rock', 5, '02:36:00', 'Turn on the radio and the static is gone...'),
(11, 'It\'s Only Love', 5, '03:15:00', 'When the feelin is ended...'),
(12, 'Long Gone', 5, '03:58:00', 'I remember when I was young...'),
(14, 'Walk of Life', 2, '04:12:00', 'Here comes Johnny singing oldies, goldies\r\n\"Be-Bop-A-Lula, \" \"Baby What I Say\"\r\nHere comes Johnny singing, \"I Gotta Woman\"\r\nDown in the tunnels, trying to make it pay\r\nHe got the action, he got the motion\r\nYeah, the boy can play\r\nDedication, devotion\r\nTurning all the night time into the day\r\nHe do the song about the sweet lovin\' woman\r\nHe do the song about the knife\r\nHe do the walk, do the walk of life\r\nYeah, he do the walk of life\r\nHere comes Johnny, gonna tell you the story\r\nHand me down my walkin\' shoes\r\nHere comes Johnny with the power and the glory\r\nBackbeat the talkin\' blues\r\nHe got the action, he got the motion\r\nYeah, the boy can play\r\nDedication, devotion\r\nTurning all the night time into the day\r\nThe song about the sweet lovin\' woman\r\nHe do the song about the knife\r\nThen he do the walk, he do the walk of life\r\nYeah, he do the walk of life\r\nHere comes Johnny singing oldies, goldies\r\n\"Be-Bop-A-Lula, \" \"Baby What I Say\"\r\nHere comes Johnny singing, \"I Gotta Woman\"\r\nDown in the tunnels, trying to make it pay\r\nHe got the action, he got the motion\r\nYeah, the boy can play\r\nDedication, devotion\r\nTurning all the night time into the day\r\nAnd after all the violence and double talk\r\nThere\'s just a song in all the trouble and the strife\r\nYou do the walk, yeah, you do the walk of life\r\nHmm, you do the walk of life');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albuns`
--
ALTER TABLE `albuns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artista_id` (`artista_id`);

--
-- Indexes for table `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `albuns_id` (`albuns_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albuns`
--
ALTER TABLE `albuns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `artistas`
--
ALTER TABLE `artistas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `albuns`
--
ALTER TABLE `albuns`
  ADD CONSTRAINT `albuns_ibfk_1` FOREIGN KEY (`artista_id`) REFERENCES `artistas` (`id`);

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`albuns_id`) REFERENCES `albuns` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
