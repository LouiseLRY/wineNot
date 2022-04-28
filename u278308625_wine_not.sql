-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 28 avr. 2022 à 15:54
-- Version du serveur : 10.5.13-MariaDB-cll-lve
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `u278308625_wine_not`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220328114607', '2022-03-28 13:46:58', 330),
('DoctrineMigrations\\Version20220328115133', '2022-03-28 13:51:44', 337),
('DoctrineMigrations\\Version20220329123210', '2022-03-29 14:32:23', 149),
('DoctrineMigrations\\Version20220329165530', '2022-03-29 18:55:40', 546),
('DoctrineMigrations\\Version20220329171840', '2022-03-29 19:18:52', 118),
('DoctrineMigrations\\Version20220329173006', '2022-03-29 19:30:09', 62),
('DoctrineMigrations\\Version20220329173148', '2022-03-29 19:31:51', 237),
('DoctrineMigrations\\Version20220329173618', '2022-03-29 19:36:21', 125);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rank`
--

CREATE TABLE `rank` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rank`
--

INSERT INTO `rank` (`id`, `name`, `description`) VALUES
(1, 'Néophyte', 'J\'aime le vin et je veux en découvrir ses particularités.'),
(2, 'Amateur', 'J\'ai de légères bases d\'œnologie et apprécie la dégustation du vin.'),
(3, 'Expert', 'Je suis professionnel ou amateur avec de grandes connaissances en vin et recherche la complexité et la rareté.');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `rank_id`, `name`, `email`, `password`, `roles`) VALUES
(1, 2, 'Louise', 'louise.leray@live.fr', '$2y$13$XydSG29il7Bolmyv2mgPDOdghV2oGATxSvEGUn95FO975CrPjKEqC', '[]');

-- --------------------------------------------------------

--
-- Structure de la table `wine`
--

CREATE TABLE `wine` (
  `id` int(11) NOT NULL,
  `appellation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domaine` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `price` double NOT NULL,
  `end_keep` int(11) DEFAULT NULL,
  `place` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wine`
--

INSERT INTO `wine` (`id`, `appellation`, `domaine`, `year`, `price`, `end_keep`, `place`, `quantity`, `type`, `user_id`) VALUES
(2, 'Côtes du Rhône', 'Mas de Boislauzon', 2017, 13, NULL, NULL, 0, 'Rouge', 1),
(3, 'Lalande de Pommerol', 'Château Boujut', 2016, 16, NULL, NULL, 0, 'Rouge', 1),
(4, 'Gigondas Hors Appellation', 'Cuvée de la Tuilière', 2019, 9.5, 2025, 'C2', 2, 'Rouge', 1),
(5, 'St Emilion Grand Cru', 'L\'or', 2016, 27, 2031, 'C2', 1, 'Rouge', 1),
(6, 'Châteauneuf-du-Pape', 'Chaussy Laget', 2020, 25, 2026, 'C2', 1, 'Rouge', 1),
(7, 'Haut-Médoc', 'La fon du berger', 2015, 15, 2025, 'C2', 2, 'Rouge', 1),
(8, 'Cornas', 'Elie Bancel', 2019, 20, 2028, 'C1', 2, 'Rouge', 1),
(9, 'Crozes Hermitage', 'Sais pas', 2020, 17, 2024, 'C3', 2, 'Rouge', 1),
(10, 'Côte Rôtie', 'Chapoutier Quatuor', 2018, 65.5, 2028, 'Caisse', 1, 'Rouge', 1),
(11, 'Côte Rôtie', 'Chapoutier', 1996, 54, NULL, 'Caisse', 1, 'Rouge', 1),
(12, 'St-Nicolas-de-Bourgueil', 'Domaine Olivier', 1996, 0, NULL, 'Caisse', 1, 'Rouge', 1),
(13, 'Saint-Estèphe', 'Château Haut-Marbuzet', 1996, 50, NULL, 'Caisse', 2, 'Rouge', 1),
(14, 'Chassagne-Montrachet', 'Fernand et Laurent Pillot', 1996, 0, NULL, 'Caisse', 1, 'Rouge', 1),
(15, 'IGP Vaucluse', 'Ets Jeoffrey Suchard', 2020, 3.65, NULL, NULL, 0, 'Rouge', 1),
(16, 'Chablis', 'Jean Paul et Benoît Droin', 2020, 18.9, NULL, 'C1', 0, 'Blanc', 1),
(17, 'Puligny-Montrachet', 'Domaine Leflaive', 1996, 188, NULL, 'Caisse', 1, 'Blanc', 1),
(20, 'Champagne Brut', 'Pascal Redon', 0, 16.5, NULL, NULL, 0, 'Bulles', 1),
(21, 'Belles du Sud', 'Château Ciceron', 2020, 9.9, NULL, NULL, 4, 'Rosé', 1),
(22, 'Côtes du Rhône', 'UDVCR', 2020, 3, NULL, NULL, 0, 'Rouge', 1),
(23, 'Gris Pays d\'oc', 'Les vins du littoral', 2020, 3, NULL, NULL, 1, 'Rosé', 1),
(24, 'Amalaya', 'Argentine', 2019, 13.95, NULL, NULL, 0, 'Blanc', 1),
(25, 'Bourgogne Aligoté', 'Olivier Gard', 2021, 14.5, NULL, NULL, 0, 'Blanc', 1),
(26, 'Puech Haut', 'Argali', 2020, 14.5, NULL, NULL, 1, 'Rosé', 1),
(27, 'Quintessence', 'Château Pesquié', 2019, 20, NULL, NULL, 1, 'Rouge', 1),
(28, 'Brézème', 'Château de la Molière', 2019, 13, NULL, NULL, 0, 'Rouge', 1),
(29, 'Syrah', 'Yves Cuilleron', 2020, 10.5, NULL, NULL, 0, 'Rouge', 1),
(30, 'Stellaire', 'Arnaud de Villeneuve', 2021, 9.5, NULL, NULL, 0, 'Rosé', 1),
(31, 'Filou et Loustic', 'LDRV', 2020, 7, NULL, NULL, 1, 'Rouge', 1),
(32, 'Mourvèdre', 'Mas d\'Agamas', 2020, 10.5, NULL, NULL, 1, 'Rouge', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8D93D6497616678F` (`rank_id`);

--
-- Index pour la table `wine`
--
ALTER TABLE `wine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_560C6468A76ED395` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rank`
--
ALTER TABLE `rank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `wine`
--
ALTER TABLE `wine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D6497616678F` FOREIGN KEY (`rank_id`) REFERENCES `rank` (`id`);

--
-- Contraintes pour la table `wine`
--
ALTER TABLE `wine`
  ADD CONSTRAINT `FK_560C6468A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
