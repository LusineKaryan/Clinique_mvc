-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 15 fév. 2021 à 16:02
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `clinique_mvc`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

DROP TABLE IF EXISTS `animal`;
CREATE TABLE IF NOT EXISTS `animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `DateNaissance` date DEFAULT NULL,
  `DateDeces` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `body` text,
  `Propriétaire_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Animal_Propriétaire_idx` (`Propriétaire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `animal`
--

INSERT INTO `animal` (`id`, `nom`, `DateNaissance`, `DateDeces`, `image`, `body`, `Propriétaire_id`) VALUES
(1, 'Drax', '2020-05-12', NULL, 'labrador.jpg', NULL, 2),
(2, 'Vasya', '2020-06-02', NULL, 'perse.jpg', NULL, 1),
(3, 'Lilou', '2020-10-05', NULL, 'chaton.jpg', NULL, 1),
(4, 'Tobbi', '2020-08-20', NULL, 'chien.jpg', '', 1),
(5, 'Kati', '2020-12-19', NULL, 'chat.jpg', NULL, 2),
(6, 'Troille', '2020-01-15', NULL, 'Chow-chow.jpg', 'Avec sa crinière qui évoque un lion et son expression un peu renfrognée, Troille est un chien aux caractéristiques physiques notables. Sa grosse tête, sa langue bleue et son pelage très dense ne laissent pas indifférent. Le Chow Chow n’est pas le plus tendre des chiens. Non pas qu’il soit agressif, loin de là, mais ce canidé chinois aux 2 variétés (poil long et poil court) ne manifeste que très rarement son attachement à son maître. Pourtant, il est réel. Le Chow Chow est fidèle et sincère, mais dispose d’un caractère difficile et d’un fort tempérament. Il n’est pas à mettre dans les mains de néophyte.', 1),
(7, 'Hatiko', '2019-11-08', NULL, '7.jpg', 'Le husky de Sibérie est un chien de travail de taille moyenne. Le corps est modérément compact, ses proportions et sa forme dénotent un équilibre entre les qualités recherchées pour un chien de traîneau : la puissance, la rapidité et l’endurance. Le husky de Sibérie, en bonne condition, est doté d’une musculature ferme et bien développée sans poids superflu. La queue en brosse bien fournie évoque son hérédité nordique, elle est portée au-dessus du dos en forme de faucille.\r\n\r\nLes oreilles de grandeur moyenne sont de forme triangulaire, rapprochées et attachées haut sur la tête. Elles sont garnies d’une bonne fourrure. L\'extrémité légèrement arrondie pointe vers le haut. Les yeux sont en forme d\'amande, moyennement espacés et disposés très légèrement en oblique. Ils peuvent être de couleur marron ou bleue.\r\n\r\nLe poil est double et de longueur moyenne : il ne doit pas être long au point de cacher la silhouette du chien. Le sous-poil est dense et doux. Toutes les couleurs de robe sont admises. Les diverses sortes de marques sur la tête donnent au husky de Sibérie des masques typiques que l\'on ne trouve pas dans d\'autres races', 2);

-- --------------------------------------------------------

--
-- Structure de la table `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `Animal_id` int(11) NOT NULL,
  `Race_chat_id` int(11) NOT NULL,
  PRIMARY KEY (`Animal_id`,`Race_chat_id`),
  KEY `fk_Chat_Race_chat1_idx` (`Race_chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `chat`
--

INSERT INTO `chat` (`Animal_id`, `Race_chat_id`) VALUES
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `chien`
--

DROP TABLE IF EXISTS `chien`;
CREATE TABLE IF NOT EXISTS `chien` (
  `taille` decimal(5,2) DEFAULT NULL,
  `poids` decimal(5,2) DEFAULT NULL,
  `Race_chien_id` int(11) NOT NULL,
  `Animal_id` int(11) NOT NULL,
  PRIMARY KEY (`Race_chien_id`,`Animal_id`),
  KEY `fk_Chien_Race_chien1_idx` (`Race_chien_id`),
  KEY `fk_Chien_Animal1_idx` (`Animal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `chien`
--

INSERT INTO `chien` (`taille`, `poids`, `Race_chien_id`, `Animal_id`) VALUES
('52.00', '25.00', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment` text CHARACTER SET utf8 NOT NULL,
  `post_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `seen` tinyint(11) NOT NULL DEFAULT '0',
  `signals` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `comment`, `post_id`, `date`, `seen`, `signals`) VALUES
(93, 14, 'Pas mal !', 40, '2018-02-22 07:20:01', 1, 0),
(94, 14, 'Bof', 11, '2018-02-22 07:20:13', 0, 0),
(97, 15, 'Perfect', 40, '2021-02-09 10:21:08', 0, 0),
(98, 8, 'Comme c\'est mignon!', 2, '2021-02-15 15:08:08', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `dossier`
--

DROP TABLE IF EXISTS `dossier`;
CREATE TABLE IF NOT EXISTS `dossier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `antecedents` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `effectuer`
--

DROP TABLE IF EXISTS `effectuer`;
CREATE TABLE IF NOT EXISTS `effectuer` (
  `Garde_id` int(11) NOT NULL,
  `Veterinaire_id` int(11) NOT NULL,
  PRIMARY KEY (`Garde_id`,`Veterinaire_id`),
  KEY `fk_Garde_has_Veterinaire_Veterinaire1_idx` (`Veterinaire_id`),
  KEY `fk_Garde_has_Veterinaire_Garde1_idx` (`Garde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `garde`
--

DROP TABLE IF EXISTS `garde`;
CREATE TABLE IF NOT EXISTS `garde` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `heureDebut` datetime DEFAULT NULL,
  `heureFin` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `horaire`
--

DROP TABLE IF EXISTS `horaire`;
CREATE TABLE IF NOT EXISTS `horaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jour` date DEFAULT NULL,
  `heureDebut` datetime DEFAULT NULL,
  `heureFin` datetime DEFAULT NULL,
  `Veterinaire_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Horaire_Veterinaire1_idx` (`Veterinaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `dosage` decimal(10,0) DEFAULT NULL,
  `indications` mediumtext,
  `effetsSecondaires` mediumtext,
  `laboratoire` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `body` longtext NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'post.png',
  `createdDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `image`, `createdDate`) VALUES
(11, 'Chapitre 1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Urna duis convallis convallis tellus. Lacus viverra vitae congue eu consequat ac. Volutpat ac tincidunt vitae semper. Fringilla ut morbi tincidunt augue interdum. Velit aliquet sagittis id consectetur purus ut faucibus pulvinar elementum. Nibh mauris cursus mattis molestie. Dictum non consectetur a erat nam at lectus urna. Ultricies mi eget mauris pharetra et ultrices neque ornare. Vel orci porta non pulvinar neque laoreet suspendisse. Arcu felis bibendum ut tristique et. Odio facilisis mauris sit amet massa vitae tortor condimentum. Ac turpis egestas integer eget aliquet nibh praesent. Viverra vitae congue eu consequat ac felis donec. Sit amet purus gravida quis. Pellentesque sit amet porttitor eget dolor morbi non arcu risus. Massa id neque aliquam vestibulum morbi. Cras adipiscing enim eu turpis egestas pretium. Ac felis donec et odio pellentesque diam volutpat commodo. Integer vitae justo eget magna fermentum iaculis eu non. Mi proin sed libero enim sed faucibus turpis in. Augue neque gravida in fermentum et sollicitudin ac orci. Malesuada fames ac turpis egestas sed tempus urna et pharetra. Posuere urna nec tincidunt praesent semper feugiat nibh. Dolor sit amet consectetur adipiscing elit duis. Turpis nunc eget lorem dolor sed viverra ipsum. Volutpat ac tincidunt vitae semper quis lectus nulla. Gravida quis blandit turpis cursus in hac habitasse platea. Nisl nunc mi ipsum faucibus vitae aliquet nec ullamcorper sit. Nec dui nunc mattis enim. Nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc. Libero enim sed faucibus turpis. Senectus et netus et malesuada. Dolor sed viverra ipsum nunc aliquet bibendum. Fringilla urna porttitor rhoncus dolor purus. Cursus sit amet dictum sit amet justo donec enim diam. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper. Libero enim sed faucibus turpis in eu. Laoreet suspendisse interdum consectetur libero id faucibus nisl. Vel pharetra vel turpis nunc eget lorem. Vitae sapien pellentesque habitant morbi tristique. Tempus iaculis urna id volutpat. Mattis ullamcorper velit sed ullamcorper. Sit amet volutpat consequat mauris nunc congue nisi. Diam quis enim lobortis scelerisque fermentum. Tincidunt dui ut ornare lectus sit amet est. Consectetur adipiscing elit pellentesque habitant morbi. Est velit egestas dui id ornare arcu odio ut sem. Aliquam sem fringilla ut morbi. Orci porta non pulvinar neque laoreet suspendisse interdum consectetur. Mus mauris vitae ultricies leo integer malesuada. Dictum non consectetur a erat. Ac ut consequat semper viverra nam libero justo laoreet. Cras fermentum odio eu feugiat pretium nibh. Amet nisl suscipit adipiscing bibendum est ultricies integer. Egestas congue quisque egestas diam in arcu cursus. Sapien eget mi proin sed. Tortor id aliquet lectus proin nibh nisl condimentum. Sed viverra ipsum nunc aliquet bibendum enim facilisis. Curabitur vitae nunc sed velit dignissim sodales. Nunc eget lorem dolor sed viverra ipsum nunc aliquet. Molestie ac feugiat sed lectus vestibulum. Ut enim blandit volutpat maecenas volutpat blandit aliquam. Facilisi etiam dignissim diam quis enim lobortis. Purus non enim praesent elementum facilisis. Pharetra massa massa ultricies mi quis. Habitant morbi tristique senectus et netus. Dolor purus non enim praesent elementum facilisis leo vel fringilla. Ullamcorper eget nulla facilisi etiam dignissim. Est sit amet facilisis magna. Tellus orci ac auctor augue mauris augue neque gravida in. Cursus mattis molestie a iaculis at erat pellentesque adipiscing commodo. Sed velit dignissim sodales ut eu. Egestas purus viverra accumsan in nisl. Et ligula ullamcorper malesuada proin libero.</p>', 'jordan-mcqueen-4441.jpg', '2018-02-03 16:08:55'),
(24, 'Chapitre 2', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Venenatis urna cursus eget nunc scelerisque viverra mauris. Tortor vitae purus faucibus ornare suspendisse sed nisi. Varius vel pharetra vel turpis. Nullam non nisi est sit amet facilisis magna etiam. Leo vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Porta non pulvinar neque laoreet suspendisse interdum. Tincidunt nunc pulvinar sapien et ligula. Arcu dui vivamus arcu felis bibendum ut tristique. Vitae tortor condimentum lacinia quis vel eros. Tortor vitae purus faucibus ornare suspendisse. In tellus integer feugiat scelerisque varius morbi enim nunc.</p>\r\n<p>Lorem ipsum dolor sit amet consectetur. Purus sit amet volutpat consequat mauris nunc. Non pulvinar neque laoreet suspendisse interdum consectetur libero id. Convallis convallis tellus id interdum velit laoreet id donec ultrices. In hac habitasse platea dictumst vestibulum rhoncus est pellentesque. Pellentesque adipiscing commodo elit at imperdiet dui. Orci ac auctor augue mauris augue neque gravida in. Morbi blandit cursus risus at ultrices mi tempus imperdiet nulla. Lorem mollis aliquam ut porttitor leo a diam sollicitudin tempor. Nulla posuere sollicitudin aliquam ultrices sagittis orci. Dictum varius duis at consectetur lorem donec massa sapien faucibus. Duis at tellus at urna condimentum mattis. Convallis convallis tellus id interdum. Magna fermentum iaculis eu non. Porttitor eget dolor morbi non arcu risus quis. Sit amet mauris commodo quis imperdiet massa tincidunt. Risus quis varius quam quisque. Habitant morbi tristique senectus et netus. Vel pretium lectus quam id. Mi proin sed libero enim sed.</p>\r\n<p>Felis imperdiet proin fermentum leo vel orci porta. Tristique nulla aliquet enim tortor. Egestas fringilla phasellus faucibus scelerisque eleifend donec. Dolor sit amet consectetur adipiscing. Sit amet dictum sit amet justo donec. Duis tristique sollicitudin nibh sit amet commodo nulla. Tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi. Ut etiam sit amet nisl purus in. Amet consectetur adipiscing elit pellentesque habitant morbi tristique. Amet consectetur adipiscing elit duis tristique sollicitudin. Amet risus nullam eget felis eget nunc lobortis mattis. Rhoncus aenean vel elit scelerisque. Maecenas ultricies mi eget mauris.</p>\r\n<p>Arcu cursus euismod quis viverra nibh cras pulvinar. Sed cras ornare arcu dui vivamus arcu. Semper auctor neque vitae tempus quam pellentesque nec nam aliquam. Est velit egestas dui id ornare arcu. Eget est lorem ipsum dolor sit. Molestie at elementum eu facilisis sed odio morbi quis commodo. Amet est placerat in egestas erat. Dictum non consectetur a erat nam at lectus urna. Nascetur ridiculus mus mauris vitae ultricies leo integer malesuada. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Habitant morbi tristique senectus et netus et malesuada fames ac. At tellus at urna condimentum mattis. Iaculis eu non diam phasellus vestibulum lorem sed risus ultricies. Tincidunt arcu non sodales neque sodales. Diam maecenas ultricies mi eget mauris pharetra et ultrices neque. Mi ipsum faucibus vitae aliquet nec ullamcorper sit amet risus. Sed libero enim sed faucibus turpis in eu. A scelerisque purus semper eget duis at tellus at. Posuere ac ut consequat semper viverra nam. Sit amet massa vitae tortor condimentum lacinia quis.</p>\r\n<p>Nunc mattis enim ut tellus elementum sagittis vitae et. Facilisi cras fermentum odio eu. In eu mi bibendum neque. Potenti nullam ac tortor vitae purus faucibus ornare suspendisse. Bibendum arcu vitae elementum curabitur vitae nunc sed velit. Viverra ipsum nunc aliquet bibendum enim facilisis. Duis at tellus at urna condimentum. Malesuada fames ac turpis egestas integer eget aliquet nibh. Viverra nam libero justo laoreet sit amet cursus. Aliquet sagittis id consectetur purus. Enim nunc faucibus a pellentesque sit amet. In aliquam sem fringilla ut morbi tincidunt.</p>', 'louis-pellissier-319.jpg', '2018-02-03 18:33:05'),
(40, 'Chapitre 3', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc sed id semper risus in hendrerit gravida. Nisl rhoncus mattis rhoncus urna neque viverra. Faucibus interdum posuere lorem ipsum dolor sit amet. Mattis ullamcorper velit sed ullamcorper morbi. Senectus et netus et malesuada fames. Vulputate odio ut enim blandit volutpat maecenas volutpat. Malesuada fames ac turpis egestas integer eget aliquet nibh praesent. Non arcu risus quis varius. Diam vulputate ut pharetra sit amet aliquam id diam. Nibh tortor id aliquet lectus proin nibh nisl condimentum. Sit amet cursus sit amet dictum sit amet.</p>\r\n<p><img class=\"\" src=\"static/source/petite%20image.jpg\" alt=\"\" width=\"245\" height=\"232\" /></p>\r\n<p>Egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla. Fermentum iaculis eu non diam. Ultrices sagittis orci a scelerisque purus semper. Ac turpis egestas sed tempus urna. Dui accumsan sit amet nulla facilisi. Aliquam malesuada bibendum arcu vitae elementum curabitur vitae nunc. Varius sit amet mattis vulputate enim nulla aliquet porttitor. Ullamcorper dignissim cras tincidunt lobortis feugiat. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare. Nisl nunc mi ipsum faucibus vitae aliquet nec ullamcorper sit. Condimentum vitae sapien pellentesque habitant morbi tristique. Cras fermentum odio eu feugiat pretium nibh ipsum consequat nisl. Leo a diam sollicitudin tempor id eu nisl nunc mi. Neque volutpat ac tincidunt vitae semper quis lectus nulla.</p>\r\n<p>Quis blandit turpis cursus in hac habitasse platea dictumst quisque. Tincidunt vitae semper quis lectus nulla at volutpat. Sed sed risus pretium quam vulputate dignissim suspendisse in est. Duis at tellus at urna condimentum mattis. Volutpat lacus laoreet non curabitur gravida arcu ac tortor. Sed odio morbi quis commodo. In vitae turpis massa sed elementum tempus egestas. Dui ut ornare lectus sit amet. In pellentesque massa placerat duis ultricies. Accumsan lacus vel facilisis volutpat est velit egestas dui. Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Cursus vitae congue mauris rhoncus aenean vel. Lacus luctus accumsan tortor posuere.</p>', 'trevor.jpg', '2018-02-07 13:41:04');

-- --------------------------------------------------------

--
-- Structure de la table `prescrire`
--

DROP TABLE IF EXISTS `prescrire`;
CREATE TABLE IF NOT EXISTS `prescrire` (
  `posologie` decimal(10,0) NOT NULL,
  `Visite_id` int(11) NOT NULL,
  `Medicament_id` int(11) NOT NULL,
  PRIMARY KEY (`Visite_id`,`Medicament_id`),
  KEY `fk_Prescrire_Visite1_idx` (`Visite_id`),
  KEY `fk_Prescrire_Medicament1_idx` (`Medicament_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `proprietaire`
--

DROP TABLE IF EXISTS `proprietaire`;
CREATE TABLE IF NOT EXISTS `proprietaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `rue` varchar(45) DEFAULT NULL,
  `codepostale` int(11) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `telephoneMobile` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `proprietaire`
--

INSERT INTO `proprietaire` (`id`, `nom`, `prenom`, `rue`, `codepostale`, `ville`, `telephone`, `telephoneMobile`) VALUES
(1, 'Leblanc', 'Laurent', 'Pasteur', 94000, 'Creteil', NULL, NULL),
(2, 'Macron', 'Emmanuel', 'Elysée', 75001, 'Paris', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `race_chat`
--

DROP TABLE IF EXISTS `race_chat`;
CREATE TABLE IF NOT EXISTS `race_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `race_chat`
--

INSERT INTO `race_chat` (`id`, `nom`) VALUES
(1, 'Persian'),
(2, 'Siamois');

-- --------------------------------------------------------

--
-- Structure de la table `race_chien`
--

DROP TABLE IF EXISTS `race_chien`;
CREATE TABLE IF NOT EXISTS `race_chien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `race_chien`
--

INSERT INTO `race_chien` (`id`, `nom`) VALUES
(1, 'Labrador'),
(2, 'Husky');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(120) NOT NULL,
  `password` char(60) NOT NULL,
  `admin` int(11) DEFAULT NULL,
  `pseudo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `admin`, `pseudo`) VALUES
(8, 'test@test.com', '21e57080434c1cb6c2fb4753c4f8a28f', 0, 'Romain'),
(14, 'tom@gmail.com', '21e57080434c1cb6c2fb4753c4f8a28f', NULL, 'Tom'),
(15, 'lusine@yandex.ru', '3f83faa62af63b42bee9250d9b0eb86e', 0, 'KL');

-- --------------------------------------------------------

--
-- Structure de la table `veterinaire`
--

DROP TABLE IF EXISTS `veterinaire`;
CREATE TABLE IF NOT EXISTS `veterinaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `telephoneMobile` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

DROP TABLE IF EXISTS `visite`;
CREATE TABLE IF NOT EXISTS `visite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateVisite` date DEFAULT NULL,
  `heureVisite` datetime DEFAULT NULL,
  `raison` tinytext,
  `Dossier_id` int(11) NOT NULL,
  `Animal_id` int(11) NOT NULL,
  `Veterinaire_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Visite_Dossier1_idx` (`Dossier_id`),
  KEY `fk_Visite_Animal1_idx` (`Animal_id`),
  KEY `fk_Visite_Veterinaire1_idx` (`Veterinaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `votes`
--

DROP TABLE IF EXISTS `votes`;
CREATE TABLE IF NOT EXISTS `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `user_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `post_id` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `fk_Animal_Propriétaire` FOREIGN KEY (`Propriétaire_id`) REFERENCES `proprietaire` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `fk_Chat_Animal1` FOREIGN KEY (`Animal_id`) REFERENCES `animal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Chat_Race_chat1` FOREIGN KEY (`Race_chat_id`) REFERENCES `race_chat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `chien`
--
ALTER TABLE `chien`
  ADD CONSTRAINT `fk_Chien_Animal1` FOREIGN KEY (`Animal_id`) REFERENCES `animal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Chien_Race_chien1` FOREIGN KEY (`Race_chien_id`) REFERENCES `race_chien` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `effectuer`
--
ALTER TABLE `effectuer`
  ADD CONSTRAINT `fk_Garde_has_Veterinaire_Garde1` FOREIGN KEY (`Garde_id`) REFERENCES `garde` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Garde_has_Veterinaire_Veterinaire1` FOREIGN KEY (`Veterinaire_id`) REFERENCES `veterinaire` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `horaire`
--
ALTER TABLE `horaire`
  ADD CONSTRAINT `fk_Horaire_Veterinaire1` FOREIGN KEY (`Veterinaire_id`) REFERENCES `veterinaire` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `prescrire`
--
ALTER TABLE `prescrire`
  ADD CONSTRAINT `fk_Prescrire_Medicament1` FOREIGN KEY (`Medicament_id`) REFERENCES `medicament` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Prescrire_Visite1` FOREIGN KEY (`Visite_id`) REFERENCES `visite` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `visite`
--
ALTER TABLE `visite`
  ADD CONSTRAINT `fk_Visite_Animal1` FOREIGN KEY (`Animal_id`) REFERENCES `animal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Visite_Dossier1` FOREIGN KEY (`Dossier_id`) REFERENCES `dossier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Visite_Veterinaire1` FOREIGN KEY (`Veterinaire_id`) REFERENCES `veterinaire` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
