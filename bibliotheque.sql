-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 03 fév. 2022 à 02:43
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bibliotheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `nom` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `nom`) VALUES
(1, 'Horreur'),
(2, 'Fun'),
(3, 'Sport'),
(4, 'Dev Perso'),
(5, 'Biographie');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `id` int(11) NOT NULL,
  `titre` text NOT NULL,
  `id_auteur` int(11) NOT NULL,
  `id_genre` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`id`, `titre`, `id_auteur`, `id_genre`) VALUES
(1, 'My first story', 3, 1),
(2, 'I was playing', 10, 3),
(3, 'Am I free ?', 10, 1),
(4, 'Let\'s gooo', 5, 5),
(5, 'What is NFT', 5, 4),
(6, 'Earn Money by wroking', 9, 2),
(7, 'Ez money', 9, 3),
(8, 'Money without working', 12, 1),
(9, 'On verra bien', 13, 5),
(10, 'Nekfeu !', 15, 2);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `id` int(11) NOT NULL,
  `prenom` tinytext NOT NULL,
  `nom` tinytext NOT NULL,
  `auteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id`, `prenom`, `nom`, `auteur`) VALUES
(1, 'Marcus', 'Harris', 0),
(2, 'Judy', 'Riley', 0),
(3, 'Joan', 'Sanders', 1),
(4, 'Nancy', 'Hale', 0),
(5, 'Carol', 'Conway', 1),
(6, 'Andrew', 'Ayala', 0),
(7, 'Christine', 'Delgado', 0),
(8, 'Christine', 'Stevens', 0),
(9, 'Robert', 'Howard', 1),
(10, 'ATester', 'Auteur', 1),
(11, 'ATester', 'Personne', 0),
(12, 'Rachel', 'Rivas', 1),
(13, 'Katherine', 'Webb', 1),
(14, 'Stacey', 'Jackson', 0),
(15, 'Elouan', 'Lerouxel', 1),
(16, 'Thomas', 'Robert', 0);

-- --------------------------------------------------------

--
-- Structure de la table `personne_livre`
--

CREATE TABLE `personne_livre` (
  `id_personne` int(11) NOT NULL,
  `id_livre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `personne_livre`
--

INSERT INTO `personne_livre` (`id_personne`, `id_livre`) VALUES
(11, 3),
(11, 10),
(6, 6),
(5, 10),
(5, 9),
(7, 8),
(8, 1),
(15, 7),
(3, 5),
(2, 6),
(13, 4),
(1, 6),
(4, 9),
(12, 2),
(9, 6),
(14, 10),
(14, 4),
(15, 7),
(2, 2),
(10, 7);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_auteur` (`id_auteur`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personne_livre`
--
ALTER TABLE `personne_livre`
  ADD KEY `foreign_personne` (`id_personne`),
  ADD KEY `foreign2_livre` (`id_livre`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `foreign_auteur` FOREIGN KEY (`id_auteur`) REFERENCES `personne` (`id`);

--
-- Contraintes pour la table `personne_livre`
--
ALTER TABLE `personne_livre`
  ADD CONSTRAINT `foreign2_livre` FOREIGN KEY (`id_livre`) REFERENCES `livre` (`id`),
  ADD CONSTRAINT `foreign_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
