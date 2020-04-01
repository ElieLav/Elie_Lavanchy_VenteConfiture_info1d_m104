-- Database: lavanchy_elie_venteconfiture_info1d_m104
-- Détection si une autre base de donnée du même nom existe

DROP DATABASE if exists lavanchy_elie_venteconfiture_info1d_m104;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS lavanchy_elie_venteconfiture_info1d_m104;

-- Utilisation de cette base de donnée

USE lavanchy_elie_venteconfiture_info1d_m104;
-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 01 Avril 2020 à 22:01
-- Version du serveur :  5.6.20-log
-- Version de PHP :  5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `lavanchy_elie_venteconfiture_info1d_m104`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_adresse`
--

CREATE TABLE IF NOT EXISTS `t_adresse` (
`id_adresse` int(11) NOT NULL,
  `RueAdresse` varchar(256) DEFAULT NULL,
  `NpaAdresse` int(11) DEFAULT NULL,
  `VilleAdresse` varchar(256) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `t_adresse`
--

INSERT INTO `t_adresse` (`id_adresse`, `RueAdresse`, `NpaAdresse`, `VilleAdresse`) VALUES
(1, 'testupdate2', 3, 'testupdate3'),
(2, 'Route du closalet ', NULL, NULL),
(3, 'test', 1806, NULL),
(5, NULL, NULL, 'St-Legier'),
(6, 'Chemin de Milavy 1b', 1806, 'St-Legier'),
(7, NULL, 1001, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `t_aliments`
--

CREATE TABLE IF NOT EXISTS `t_aliments` (
`id_aliments` int(11) NOT NULL,
  `NomFruitsAli` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_client`
--

CREATE TABLE IF NOT EXISTS `t_client` (
`id_client` int(11) NOT NULL,
  `NomClient` varchar(100) DEFAULT NULL,
  `PrenomClient` varchar(100) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `t_client`
--

INSERT INTO `t_client` (`id_client`, `NomClient`, `PrenomClient`) VALUES
(1, 'Lavanchy', 'Elie'),
(3, 'testupdate1', 'testupdate2'),
(5, NULL, 'Elie'),
(6, 'Lavanchy', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `t_client_a_adresse`
--

CREATE TABLE IF NOT EXISTS `t_client_a_adresse` (
  `id_client_a_adresse` int(11) NOT NULL,
  `fk_client` int(11) NOT NULL,
  `fk_adresse` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_client_a_telephone`
--

CREATE TABLE IF NOT EXISTS `t_client_a_telephone` (
`id_client_a_telephone` int(11) NOT NULL,
  `fk_Client` int(11) NOT NULL,
  `fk_Telephone` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_stock`
--

CREATE TABLE IF NOT EXISTS `t_stock` (
`id_stock` int(11) NOT NULL,
  `QuantiteStock` int(11) NOT NULL,
  `AlimentsStock` int(11) DEFAULT NULL,
  `PrixAchatsStock` float DEFAULT NULL,
  `PrixVenteStock` float DEFAULT NULL,
  `DateStock` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isEmptyStock` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_stock_a_aliments`
--

CREATE TABLE IF NOT EXISTS `t_stock_a_aliments` (
`id_stock_a_aliments` int(11) NOT NULL,
  `fk_Aliments` int(11) NOT NULL,
  `fk_Stock` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_stock_a_vente`
--

CREATE TABLE IF NOT EXISTS `t_stock_a_vente` (
`id_stock_a_vente` int(11) NOT NULL,
  `fk_Stock` int(11) NOT NULL,
  `fk_Vente` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_telephone`
--

CREATE TABLE IF NOT EXISTS `t_telephone` (
`id_telephone` int(11) NOT NULL,
  `NumeroTelephone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_vente`
--

CREATE TABLE IF NOT EXISTS `t_vente` (
`id_vente` int(11) NOT NULL,
  `ClientVente` int(11) NOT NULL,
  `PrixTotalVente` float NOT NULL,
  `MontantEncaisseVente` float NOT NULL,
  `MontantRenduVente` float NOT NULL,
  `NombrePotsVente` int(11) NOT NULL,
  `PrixUnitaireVente` float NOT NULL,
  `PrixTotalLigneVente` float NOT NULL,
  `DonVente` float DEFAULT NULL,
  `DateVente` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_vente_a_client`
--

CREATE TABLE IF NOT EXISTS `t_vente_a_client` (
`id_vente_a_client` int(11) NOT NULL,
  `fk_Vente` int(11) NOT NULL,
  `fk_Client` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `t_adresse`
--
ALTER TABLE `t_adresse`
 ADD PRIMARY KEY (`id_adresse`);

--
-- Index pour la table `t_aliments`
--
ALTER TABLE `t_aliments`
 ADD PRIMARY KEY (`id_aliments`);

--
-- Index pour la table `t_client`
--
ALTER TABLE `t_client`
 ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `t_client_a_adresse`
--
ALTER TABLE `t_client_a_adresse`
 ADD PRIMARY KEY (`id_client_a_adresse`), ADD UNIQUE KEY `fk_adresse` (`fk_adresse`), ADD KEY `fk_client` (`fk_client`);

--
-- Index pour la table `t_client_a_telephone`
--
ALTER TABLE `t_client_a_telephone`
 ADD PRIMARY KEY (`id_client_a_telephone`), ADD KEY `fk_Client` (`fk_Client`), ADD KEY `fk_Telephone` (`fk_Telephone`);

--
-- Index pour la table `t_stock`
--
ALTER TABLE `t_stock`
 ADD PRIMARY KEY (`id_stock`);

--
-- Index pour la table `t_stock_a_aliments`
--
ALTER TABLE `t_stock_a_aliments`
 ADD PRIMARY KEY (`id_stock_a_aliments`), ADD KEY `fk_Stock` (`fk_Stock`), ADD KEY `fk_Aliments` (`fk_Aliments`);

--
-- Index pour la table `t_stock_a_vente`
--
ALTER TABLE `t_stock_a_vente`
 ADD PRIMARY KEY (`id_stock_a_vente`), ADD KEY `id_stock_a_vente` (`id_stock_a_vente`), ADD KEY `fk_Vente` (`fk_Vente`), ADD KEY `fk_Stock` (`fk_Stock`);

--
-- Index pour la table `t_telephone`
--
ALTER TABLE `t_telephone`
 ADD PRIMARY KEY (`id_telephone`);

--
-- Index pour la table `t_vente`
--
ALTER TABLE `t_vente`
 ADD PRIMARY KEY (`id_vente`);

--
-- Index pour la table `t_vente_a_client`
--
ALTER TABLE `t_vente_a_client`
 ADD PRIMARY KEY (`id_vente_a_client`), ADD KEY `fk_Vente` (`fk_Vente`), ADD KEY `fk_Client` (`fk_Client`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `t_adresse`
--
ALTER TABLE `t_adresse`
MODIFY `id_adresse` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `t_aliments`
--
ALTER TABLE `t_aliments`
MODIFY `id_aliments` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_client`
--
ALTER TABLE `t_client`
MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `t_client_a_telephone`
--
ALTER TABLE `t_client_a_telephone`
MODIFY `id_client_a_telephone` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_stock`
--
ALTER TABLE `t_stock`
MODIFY `id_stock` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_stock_a_aliments`
--
ALTER TABLE `t_stock_a_aliments`
MODIFY `id_stock_a_aliments` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_stock_a_vente`
--
ALTER TABLE `t_stock_a_vente`
MODIFY `id_stock_a_vente` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_telephone`
--
ALTER TABLE `t_telephone`
MODIFY `id_telephone` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_vente`
--
ALTER TABLE `t_vente`
MODIFY `id_vente` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_vente_a_client`
--
ALTER TABLE `t_vente_a_client`
MODIFY `id_vente_a_client` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `t_client_a_adresse`
--
ALTER TABLE `t_client_a_adresse`
ADD CONSTRAINT `t_client_a_adresse_ibfk_1` FOREIGN KEY (`fk_client`) REFERENCES `t_client` (`id_client`),
ADD CONSTRAINT `t_client_a_adresse_ibfk_2` FOREIGN KEY (`fk_adresse`) REFERENCES `t_adresse` (`id_adresse`);

--
-- Contraintes pour la table `t_client_a_telephone`
--
ALTER TABLE `t_client_a_telephone`
ADD CONSTRAINT `t_client_a_telephone_ibfk_1` FOREIGN KEY (`fk_Client`) REFERENCES `t_client` (`id_client`),
ADD CONSTRAINT `t_client_a_telephone_ibfk_2` FOREIGN KEY (`fk_Telephone`) REFERENCES `t_telephone` (`id_telephone`);

--
-- Contraintes pour la table `t_stock_a_aliments`
--
ALTER TABLE `t_stock_a_aliments`
ADD CONSTRAINT `t_stock_a_aliments_ibfk_1` FOREIGN KEY (`fk_Aliments`) REFERENCES `t_aliments` (`id_aliments`),
ADD CONSTRAINT `t_stock_a_aliments_ibfk_2` FOREIGN KEY (`fk_Stock`) REFERENCES `t_stock` (`id_stock`);

--
-- Contraintes pour la table `t_stock_a_vente`
--
ALTER TABLE `t_stock_a_vente`
ADD CONSTRAINT `t_stock_a_vente_ibfk_1` FOREIGN KEY (`fk_Stock`) REFERENCES `t_stock` (`id_stock`),
ADD CONSTRAINT `t_stock_a_vente_ibfk_2` FOREIGN KEY (`fk_Vente`) REFERENCES `t_vente` (`id_vente`);

--
-- Contraintes pour la table `t_vente_a_client`
--
ALTER TABLE `t_vente_a_client`
ADD CONSTRAINT `t_vente_a_client_ibfk_1` FOREIGN KEY (`fk_Vente`) REFERENCES `t_vente` (`id_vente`),
ADD CONSTRAINT `t_vente_a_client_ibfk_2` FOREIGN KEY (`fk_Client`) REFERENCES `t_client` (`id_client`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
