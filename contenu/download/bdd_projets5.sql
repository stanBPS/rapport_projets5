-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 13 jan. 2021 à 20:47
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdd_projets5`
--

-- --------------------------------------------------------

--
-- Structure de la table `capteur`
--

DROP TABLE IF EXISTS `capteur`;
CREATE TABLE IF NOT EXISTS `capteur` (
  `NomC` varchar(20) NOT NULL,
  `NomB` varchar(10) NOT NULL,
  `Etage` int(11) NOT NULL,
  `TypeC` varchar(20) NOT NULL,
  `Lieu` varchar(50) NOT NULL,
  `seuilMin` float NOT NULL,
  `seuilMax` float NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`NomC`),
  KEY `fk_typeC` (`TypeC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `capteur`
--

INSERT INTO `capteur` (`NomC`, `NomB`, `Etage`, `TypeC`, `Lieu`, `seuilMin`, `seuilMax`, `active`) VALUES
('capteur4', 'U1', 1, 'EAU', 'Couloir', 0, 10, 0);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `TypeC` varchar(20) NOT NULL,
  `SeuilMin` float NOT NULL,
  `SeuilMax` float NOT NULL,
  `unite` varchar(5) NOT NULL,
  PRIMARY KEY (`TypeC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`TypeC`, `SeuilMin`, `SeuilMax`, `unite`) VALUES
('AIRCOMPRIME', 0, 5, 'm^3/h'),
('EAU', 0, 10, 'm^3'),
('ELECTRICITE', 10, 500, 'kWh'),
('TEMPERATURE', 17, 22, '°C');

-- --------------------------------------------------------

--
-- Structure de la table `valeur`
--

DROP TABLE IF EXISTS `valeur`;
CREATE TABLE IF NOT EXISTS `valeur` (
  `IDValeur` int(11) NOT NULL AUTO_INCREMENT,
  `NomC` varchar(20) NOT NULL,
  `Valeur` float NOT NULL,
  `Date` datetime NOT NULL,
  PRIMARY KEY (`IDValeur`),
  KEY `fk_nomc` (`NomC`)
) ENGINE=InnoDB AUTO_INCREMENT=638 DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `capteur`
--
ALTER TABLE `capteur`
  ADD CONSTRAINT `fk_typeC` FOREIGN KEY (`TypeC`) REFERENCES `type` (`TypeC`);

--
-- Contraintes pour la table `valeur`
--
ALTER TABLE `valeur`
  ADD CONSTRAINT `fk_nomc` FOREIGN KEY (`NomC`) REFERENCES `capteur` (`NomC`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
