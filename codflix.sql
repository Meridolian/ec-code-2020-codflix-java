-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: codflix
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episode` (
  `id` int NOT NULL,
  `media_id` int NOT NULL,
  `season_number` int NOT NULL,
  `episode_number` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `trailer_url` varchar(150) NOT NULL,
  `duration` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (1,6,1,1,'L\'hiver vient','https://www.youtube.com/embed/aAF12LNAeNI',3540),(2,6,1,2,'La route royale','https://www.youtube.com/embed/aAF12LNAeNI',3120),(3,6,1,3,'Lord Snow','https://www.youtube.com/embed/aAF12LNAeNI',3300),(4,6,1,4,'Infirmes, bâtards et choses brisées','https://www.youtube.com/embed/aAF12LNAeNI',3180),(5,6,1,5,'Le loup et le lion','https://www.youtube.com/embed/aAF12LNAeNI',3120),(6,6,1,6,'Une couronne d\'or','https://www.youtube.com/embed/aAF12LNAeNI',3000),(7,6,1,7,'Gagner ou mourir','https://www.youtube.com/embed/aAF12LNAeNI',3300),(8,6,1,8,'Frapper d\'estoc','https://www.youtube.com/embed/aAF12LNAeNI',3300),(9,6,1,9,'Baelor','https://www.youtube.com/embed/aAF12LNAeNI',3240),(10,6,1,10,'De feu et de sang','https://www.youtube.com/embed/aAF12LNAeNI',3000),(11,6,2,1,'Le nord se souvient','https://www.youtube.com/embed/SBELCQ4xPJU',3000),(12,6,2,2,'Les contrées nocturnes','https://www.youtube.com/embed/SBELCQ4xPJU',3060),(13,6,2,3,'Ce qui est mort ne saurait mourir','https://www.youtube.com/embed/SBELCQ4xPJU',3000),(14,6,2,4,'La cité de Qarth','https://www.youtube.com/embed/SBELCQ4xPJU',2880),(15,6,2,5,'Le fantôme d\'Harrenhal','https://www.youtube.com/embed/SBELCQ4xPJU',3060),(16,6,2,6,'Les dieux anciens et nouveaux','https://www.youtube.com/embed/SBELCQ4xPJU',3060),(17,6,2,7,'Un homme sans honneur','https://www.youtube.com/embed/SBELCQ4xPJU',3120),(18,6,2,8,'Le prince de Winterfell','https://www.youtube.com/embed/SBELCQ4xPJU',3060),(19,6,2,9,'La Néra','https://www.youtube.com/embed/SBELCQ4xPJU',3120),(20,6,2,10,'Valar Morghulis','https://www.youtube.com/embed/SBELCQ4xPJU',3600);
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Action'),(2,'Horreur'),(3,'Science-Fiction'),(4,'Fantasy'),(5,'Thriller');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `media_id` int NOT NULL,
  `start_date` datetime NOT NULL,
  `finish_date` datetime DEFAULT NULL,
  `watch_duration` int NOT NULL DEFAULT '0' COMMENT 'in seconds',
  PRIMARY KEY (`id`),
  KEY `history_user_id_fk_media_id` (`user_id`),
  KEY `history_media_id_fk_media_id` (`media_id`),
  CONSTRAINT `history_media_id_fk_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `history_user_id_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `genre_id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `release_date` date NOT NULL,
  `summary` longtext NOT NULL,
  `trailer_url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_genre_id_fk_genre_id` (`genre_id`) USING BTREE,
  CONSTRAINT `media_genre_id_b1257088_fk_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (2,4,'Le Seigneur des anneaux : La Communauté de l\'anneau','film','available','2001-12-19','Un jeune et timide `Hobbit\', Frodon Sacquet, hérite d\'un anneau magique. Bien loin d\'être une simple babiole, il s\'agit d\'un \ninstrument de pouvoir absolu qui permettrait à Sauron, le `Seigneur des ténèbres\', de régner sur la `Terre du Milieu\' et de réduire en esclavage ses peuples. \nFrodon doit parvenir jusqu\'à la `Crevasse du Destin\' pour détruire l\'anneau.','https://www.youtube.com/embed/_e8QGuG50ro'),(3,4,'Le Seigneur des anneaux : Les Deux Tours','film','available','2002-12-10','Après la mort de Boromir et la disparition de Gandalf, la `Communauté\' s\'est scindée en trois. Perdus dans les collines \nd\'`Emyn Muil\', Frodon et Sam découvrent qu\'ils sont suivis par Gollum, une créature versatile corrompue par l\'anneau magique. Gollum promet de conduire \nles `Hobbits\' jusqu\'à la `Porte Noire\' du `Mordor\'. A travers la `Terre du Milieu\', Aragorn, Legolas et Gimli font route vers le `Rohan\', le royaume assiégé \nde Theoden.','https://www.youtube.com/embed/LbfMDwc4azU'),(4,4,'Le Seigneur des anneaux : Le Retour du Roi','film','available','2003-12-17','Les armées de Sauron ont attaqué `Minas Tirith\', la capitale de `Gondor\'. Jamais ce royaume autrefois puissant n\'a eu autant \nbesoin de son roi. Cependant, Aragorn trouvera-t-il en lui la volonté d\'accomplir sa destinée ? Tandis que Gandalf s\'efforce de soutenir les forces brisées \nde Gondor, Théoden exhorte les guerriers de Rohan à se joindre au combat. Cependant, malgré leur courage et leur loyauté, les forces des Hommes ne sont pas \nde taille à lutter contre les innombrables légions d\'ennemis.','https://www.youtube.com/embed/r5X-hFf6Bwo'),(5,3,'Interstellar','film','available','2014-11-05','Dans un futur \nproche, la Terre est de moins en moins accueillante pour l\'humanité qui connaît une grave crise alimentaire. Le film raconte les aventures d\'un groupe \nd\'explorateurs qui utilise une faille récemment découverte dans l\'espace-temps afin de repousser les limites humaines et partir à la conquête des distances \nastronomiques dans un voyage interstellaire.','https://www.youtube.com/watch?v=jWyRrUhLEaw'),(6,4,'Game of Thrones','série','available','2011-04-17','Dans le royaume des Sept \nCouronnes les familles s\'unissent et s\'affrontent afin de garder ou reconquérir le Trône de fer','https://www.youtube.com/embed/aAF12LNAeNI');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `password` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'coding@gmail.com','123456'),(2,'codflix@gmail.com','codflix'),(3,'test@gmail.com','test');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-25 20:36:46
