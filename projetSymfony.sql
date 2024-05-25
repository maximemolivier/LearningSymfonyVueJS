-- phpMyAdmin SQL Dump
-- version 5.2.0-dev+20210926.4834c5fe7d
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 02, 2023 at 04:46 PM
-- Server version: 8.0.29-0ubuntu0.20.04.3
-- PHP Version: 8.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projetSymfony`
--

-- --------------------------------------------------------

--
-- Table structure for table `base`
--

CREATE TABLE `base` (
  `id` int NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `base`
--

INSERT INTO `base` (`id`, `nom`) VALUES
(1, 'Base Tomate'),
(2, 'Base Crème Fraîche');

-- --------------------------------------------------------

--
-- Table structure for table `boisson`
--

CREATE TABLE `boisson` (
  `id` int NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` date DEFAULT NULL COMMENT '(DC2Type:date_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boisson`
--

INSERT INTO `boisson` (`id`, `nom`, `prix`, `image`, `updated_at`) VALUES
(1, 'Coca-cola', 100, 'coca-64678cfb12719475681979.jpeg', '2023-05-19'),
(2, 'Ice-tea', 100, 'icetea-64678d589c488909513022.jpeg', '2023-05-19'),
(3, 'Eau', 0, 'eau-64678d649e273580781056.jpeg', '2023-05-19'),
(4, 'Orangina', 100, 'orangina-64678d7024ea4581978814.jpeg', '2023-05-19'),
(5, 'Bière', 0, 'biere-64678d7d8a612807736362.jpeg', '2023-05-19');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230411130711', '2023-04-19 12:56:45', 374),
('DoctrineMigrations\\Version20230416141653', '2023-04-19 12:56:46', 22),
('DoctrineMigrations\\Version20230420143807', '2023-04-20 14:38:23', 173),
('DoctrineMigrations\\Version20230519144959', '2023-05-19 14:50:18', 488);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`id`, `nom`) VALUES
(1, 'Jambon'),
(2, 'Champignons'),
(3, 'Mozarella'),
(4, 'Tomate'),
(5, 'Basilic'),
(6, 'Oeuf'),
(7, 'Gorgonzola'),
(8, 'Chèvre'),
(9, 'Parmesan'),
(10, 'Lardons'),
(11, 'Oignons'),
(12, 'Poivrons'),
(13, 'Aubergines'),
(14, 'Ananas'),
(15, 'Miel'),
(16, 'Anchois'),
(17, 'Câpres');

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `id` int NOT NULL,
  `base_id` int DEFAULT NULL,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` date DEFAULT NULL COMMENT '(DC2Type:date_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`id`, `base_id`, `nom`, `prix`, `image`, `updated_at`) VALUES
(3, 1, 'Reine', 1000, 'reine-6467853944f4c849379546.jpg', '2023-05-19'),
(4, 1, 'Margherita', 1200, 'margherita-6467850070e0a793354189.jpeg', '2023-05-19'),
(6, 1, '4 Fromages', 1050, '4fromages-6467894c57b4e607188187.jpeg', '2023-05-19'),
(7, 2, 'Carbonara', 1100, 'carbonara-646789e59af4e156930575.webp', '2023-05-19'),
(8, 1, 'Végétarienne', 900, 'vegetarienne-647904813ad67113648432.jpeg', '2023-05-19'),
(9, 2, 'Chèvre-Miel', 1300, 'chevr-miel-6479048b3b54b560711174.jpeg', '2023-05-19');

-- --------------------------------------------------------

--
-- Table structure for table `pizza_ingredient`
--

CREATE TABLE `pizza_ingredient` (
  `pizza_id` int NOT NULL,
  `ingredient_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pizza_ingredient`
--

INSERT INTO `pizza_ingredient` (`pizza_id`, `ingredient_id`) VALUES
(3, 1),
(3, 2),
(3, 3),
(4, 3),
(4, 4),
(4, 5),
(6, 3),
(6, 7),
(6, 8),
(6, 9),
(7, 3),
(7, 10),
(7, 11),
(8, 2),
(8, 3),
(8, 12),
(8, 13),
(9, 3),
(9, 8),
(9, 15);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int NOT NULL,
  `username` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `username`, `roles`, `password`) VALUES
(1, 'admin', '[]', '$2y$13$FcsuAM64So/vyOn3LOuUiufyoFpDxHu8wBExxDz9XIlkW0el7VCHy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `base`
--
ALTER TABLE `base`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boisson`
--
ALTER TABLE `boisson`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CFDD826F6967DF41` (`base_id`);

--
-- Indexes for table `pizza_ingredient`
--
ALTER TABLE `pizza_ingredient`
  ADD PRIMARY KEY (`pizza_id`,`ingredient_id`),
  ADD KEY `IDX_6FF6C03FD41D1D42` (`pizza_id`),
  ADD KEY `IDX_6FF6C03F933FE08C` (`ingredient_id`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D1C63B3F85E0677` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `base`
--
ALTER TABLE `base`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `boisson`
--
ALTER TABLE `boisson`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `FK_CFDD826F6967DF41` FOREIGN KEY (`base_id`) REFERENCES `base` (`id`);

--
-- Constraints for table `pizza_ingredient`
--
ALTER TABLE `pizza_ingredient`
  ADD CONSTRAINT `FK_6FF6C03F933FE08C` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6FF6C03FD41D1D42` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
