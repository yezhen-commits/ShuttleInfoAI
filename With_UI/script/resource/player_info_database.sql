-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: badminton_player_database
-- ------------------------------------------------------
-- Server version	8.4.8

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
-- Table structure for table `men_double`
--

DROP TABLE IF EXISTS `men_double`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `men_double` (
  `id` int NOT NULL,
  `player1_name` varchar(512) DEFAULT NULL,
  `player1_country` varchar(512) DEFAULT NULL,
  `player1_birth_date` varchar(512) DEFAULT NULL,
  `player1_height` double DEFAULT NULL,
  `player2_name` varchar(512) DEFAULT NULL,
  `player2_country` varchar(512) DEFAULT NULL,
  `player2_birth_date` varchar(512) DEFAULT NULL,
  `player2_height` double DEFAULT NULL,
  `highest_ranking` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `men_double`
--

LOCK TABLES `men_double` WRITE;
/*!40000 ALTER TABLE `men_double` DISABLE KEYS */;
INSERT INTO `men_double` VALUES (1,'Marcus Fernaldi Gideon','INA','09-03-1991',1.68,'Kevin Sanjaya Sukamuljo','INA','02-08-1995',1.7,1),(2,'Mohammad Ahsan','INA','07-09-1987',1.73,'Hendra Setiawan','INA','25-08-1984',1.81,1),(3,'Fajar Alfian','INA','07-03-1995',1.76,'Muhammad Rian Ardianto','INA','13-02-1996',1.74,1),(4,'Aaron Chia','MAS','24-02-1997',1.75,'Soh Wooi Yik','MAS','17-02-1998',1.85,2),(5,'Takuro Hoki','JPN','14-08-1995',1.66,'Yugo Kobayashi','JPN','10-07-1995',1.75,1),(6,'Satwiksairaj Rankireddy','IND','13-08-2000',1.84,'Chirag Shetty','IND','04-07-1997',1.86,1),(7,'Kim Astrup','DEN','06-03-1992',1.85,'Anders Skaarup Rasmussen','DEN','15-02-1989',1.89,1),(8,'Liang Weikeng','CHN','30-11-2000',1.76,'Wang Chang','CHN','07-05-2001',1.81,1),(9,'Liu Yuchen','CHN','25-07-1995',1.93,'Ou Xuanyi','CHN','23-01-1994',1.89,2),(10,'Li Junhui','CHN','10-05-1995',1.95,'Liu Yuchen','CHN','25-07-1995',1.93,1),(11,'Lee Yang','TPE','12-08-1995',1.77,'Wang Chi-Lin','TPE','18-01-1995',1.88,2),(12,'Kang Min-hyuk','KOR','17-02-1999',1.83,'Seo Seung-jae','KOR','04-09-1997',1.82,2),(13,'Choi Sol-gyu','KOR','05-08-1995',1.81,'Seo Seung-jae','KOR','04-09-1997',1.82,8),(14,'Hiroyuki Endo','JPN','16-12-1986',1.72,'Yuta Watanabe','JPN','13-06-1997',1.67,4),(15,'Takeshi Kamura','JPN','14-02-1990',1.69,'Keigo Sonoda','JPN','20-02-1990',1.69,2),(16,'Goh V Shem','MAS','06-04-1989',1.79,'Tan Wee Kiong','MAS','21-05-1989',1.78,1),(17,'Ong Yew Sin','MAS','30-01-1995',1.75,'Teo Ee Yi','MAS','04-04-1993',1.73,5),(18,'Mathias Boe','DEN','11-07-1980',1.85,'Carsten Mogensen','DEN','24-07-1983',1.87,1),(19,'Mads Conrad-Petersen','DEN','12-01-1988',1.88,'Mads Pieler Kolding','DEN','27-01-1988',2.05,4),(20,'Vladimir Ivanov','RUS','03-07-1987',1.97,'Ivan Sozonov','RUS','06-07-1989',1.84,7),(21,'Marcus Ellis','ENG','14-09-1989',1.8,'Chris Langridge','ENG','02-05-1985',1.88,9),(22,'Ben Lane','ENG','13-07-1997',1.83,'Sean Vendy','ENG','18-05-1996',1.79,13),(23,'He Jiting','CHN','19-02-1998',1.78,'Tan Qiang','CHN','16-09-1998',1.78,10),(24,'Ren Xiangyu','CHN','23-10-1998',1.78,'Tan Qiang','CHN','16-09-1998',1.78,15),(25,'He Jiting','CHN','19-02-1998',1.78,'Ren Xiangyu','CHN','23-10-1998',1.8,4),(26,'Pramudya Kusumawardana','INA','13-12-2000',1.73,'Yeremia Erich Yoche Yacob Rambitan','INA','15-10-1999',1.78,11),(27,'Leo Rolly Carnando','INA','29-07-2001',1.71,'Daniel Marthin','INA','31-07-2001',1.82,9),(28,'Muhammad Shohibul Fikri','INA','16-11-1999',1.76,'Bagas Maulana','INA','20-07-1998',1.82,8),(29,'Mark Lamsfuss','GER','19-04-1994',1.8,'Marvin Seidel','GER','09-11-1995',1.88,15),(30,'Christo Popov','FRA','08-03-2002',1.79,'Toma Junior Popov','FRA','29-09-1998',1.96,16),(31,'Lucas Corvee','FRA','09-06-1993',1.8,'Ronan Labar','FRA','03-05-1989',1.85,29),(32,'Alexander Dunn','SCO','13-09-1998',1.85,'Adam Hall','SCO','12-02-1996',1.81,21),(33,'Lu Ching-Yao','TPE','07-06-1993',1.9,'Yang Po-Han','TPE','13-03-1994',1.72,10),(34,'Lee Jhe-Huei','TPE','20-03-1994',1.79,'Yang Po-Hsuan','TPE','23-08-1996',1.86,7),(35,'Liao Min-Chun','TPE','27-01-1988',1.86,'Su Ching-Heng','TPE','10-11-1992',1.73,10),(36,'Supak Jomkoh','THA','04-09-1996',1.75,'Kittinupong Kedren','THA','19-07-1996',1.83,16),(37,'Bodin Isara','THA','12-12-1990',1.78,'Maneepong Jongjit','THA','21-03-1991',1.76,7),(38,'Goh Sze Fei','MAS','18-08-1997',1.71,'Nur Izzuddin','MAS','11-11-1997',1.75,1),(39,'Man Wei Chong','MAS','05-09-1999',1.78,'Tee Kai Wun','MAS','17-04-2000',1.8,15),(40,'Akira Koga','JPN','08-03-1994',1.7,'Taichi Saito','JPN','21-04-1993',1.72,15),(41,'Han Chengkai','CHN','29-01-1998',1.84,'Zhou Haodong','CHN','20-02-1998',1.81,5),(42,'Terry Hee','SGP','06-07-1995',1.75,'Loh Kean Hean','SGP','12-03-1995',1.73,32),(43,'Ko Sung-hyun','KOR','21-05-1987',1.82,'Shin Baek-cheol','KOR','19-10-1989',1.85,1),(44,'Kim Gi-jung','KOR','14-08-1990',1.81,'Kim Sa-rang','KOR','22-08-1989',1.81,2),(45,'Jelle Maas','NED','18-02-1991',1.8,'Robin Tabeling','NED','24-04-1994',1.91,30),(46,'Jason Ho-Shue','CAN','29-08-1998',1.76,'Nyl Yakura','CAN','14-02-1993',1.71,31),(47,'Phillip Chew','USA','16-05-1994',1.78,'Ryan Chew','USA','12-08-1996',1.73,31),(48,'Vinson Chiu','USA','08-08-1998',1.76,'Joshua Yuan','USA','25-07-2003',1.78,41),(49,'Takuto Inoue','JPN','26-02-1995',1.72,'Yuki Kaneko','JPN','22-07-1994',1.78,7),(50,'Berry Angriawan','INA','03-10-1991',1.73,'Hardianto','INA','28-02-1993',1.75,14);
/*!40000 ALTER TABLE `men_double` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `men_single`
--

DROP TABLE IF EXISTS `men_single`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `men_single` (
  `id` int NOT NULL,
  `name` varchar(512) DEFAULT NULL,
  `country` varchar(512) DEFAULT NULL,
  `birth_date` varchar(512) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `highest_ranking` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `men_single`
--

LOCK TABLES `men_single` WRITE;
/*!40000 ALTER TABLE `men_single` DISABLE KEYS */;
INSERT INTO `men_single` VALUES (1,'Viktor Axelsen','DEN','04-01-1994',1.94,1),(2,'Kento Momota','JPN','01-09-1994',1.75,1),(3,'Shi Yuqi','CHN','28-02-1996',1.84,1),(4,'Lee Zii Jia','MAS','29-03-1998',1.86,2),(5,'Anthony Sinisuka Ginting','INA','20-10-1996',1.71,2),(6,'Jonatan Christie','INA','15-09-1997',1.79,2),(7,'Chou Tien Chen','TPE','08-01-1990',1.8,2),(8,'Anders Antonsen','DEN','27-04-1997',1.83,2),(9,'Loh Kean Yew','SGP','26-06-1997',1.75,3),(10,'Kunlavut Vitidsarn','THA','11-05-2001',1.73,1),(11,'Lakshya Sen','IND','16-08-2001',1.79,6),(12,'Kidambi Srikanth','IND','07-02-1993',1.76,1),(13,'HS Prannoy','IND','17-07-1992',1.78,6),(14,'Chen Long','CHN','18-01-1989',1.87,1),(15,'Lin Dan','CHN','14-10-1983',1.78,1),(16,'Lee Chong Wei','MAS','21-10-1982',1.72,1),(17,'Kodai Naraoka','JPN','30-06-2001',1.73,2),(18,'Li Shifeng','CHN','09-01-2000',1.85,3),(19,'Weng Hongyang','CHN','18-06-1999',1.82,10),(20,'Ng Tze Yong','MAS','16-05-2000',1.8,14),(21,'Rasmus Gemke','DEN','11-01-1997',1.86,10),(22,'Kanta Tsuneyama','JPN','21-06-1996',1.73,10),(23,'Kenta Nishimoto','JPN','30-08-1994',1.8,9),(24,'Wang Tzu-wei','TPE','27-02-1995',1.78,9),(25,'Toma Junior Popov','FRA','29-09-1998',1.96,13),(26,'Christo Popov','FRA','08-03-2002',1.79,5),(27,'Brian Yang','CAN','25-11-2001',1.78,21),(28,'Kevin Cordon','GUA','28-11-1986',1.82,24),(29,'Kantaphon Wangcharoen','THA','18-09-1998',1.73,12),(30,'Liew Daren','MAS','06-08-1987',1.77,10),(31,'B. Sai Praneeth','IND','10-08-1992',1.75,10),(32,'Sameer Verma','IND','22-10-1994',1.76,11),(33,'Sourabh Verma','IND','30-12-1992',1.71,28),(34,'Jan O. Jorgensen','DEN','31-12-1987',1.85,2),(35,'Hans-Kristian Vittinghus','DEN','16-01-1986',1.8,8),(36,'Zhao Junpeng','CHN','02-02-1996',1.88,11),(37,'Lu Guangzu','CHN','19-10-1996',1.84,10),(38,'Son Wan-ho','KOR','17-05-1988',1.77,1),(39,'Heo Kwang-hee','KOR','11-08-1995',1.8,28),(40,'Jeon Hyeok-jin','KOR','13-06-1995',1.77,13),(41,'Nhat Nguyen','IRL','16-06-2000',1.83,25),(42,'Mark Caljouw','NED','11-10-1994',1.81,23),(43,'Brice Leverdez','FRA','09-04-1986',1.8,19),(44,'Ygor Coelho','BRA','24-11-1996',1.78,30),(45,'Misha Zilberman','ISR','30-01-1989',1.7,33),(46,'Pablo Abian','ESP','12-06-1985',1.77,20),(47,'Magnus Johannesen','DEN','02-02-2002',1.82,31),(48,'Chico Aura Dwi Wardoyo','INA','15-06-1998',1.83,15),(49,'Shesar Hiren Rhustavito','INA','03-03-1994',1.73,17),(50,'Tommy Sugiarto','INA','31-05-1988',1.75,3);
/*!40000 ALTER TABLE `men_single` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mixed_double`
--

DROP TABLE IF EXISTS `mixed_double`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mixed_double` (
  `id` int NOT NULL,
  `player1_name` varchar(512) DEFAULT NULL,
  `player1_country` varchar(512) DEFAULT NULL,
  `player1_birth_date` varchar(512) DEFAULT NULL,
  `player1_height` double DEFAULT NULL,
  `player2_name` varchar(512) DEFAULT NULL,
  `player2_country` varchar(512) DEFAULT NULL,
  `player2_birth_date` varchar(512) DEFAULT NULL,
  `player2_height` double DEFAULT NULL,
  `highest_ranking` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixed_double`
--

LOCK TABLES `mixed_double` WRITE;
/*!40000 ALTER TABLE `mixed_double` DISABLE KEYS */;
INSERT INTO `mixed_double` VALUES (1,'Zheng Siwei','CHN','26-02-1997',1.75,'Huang Yaqiong','CHN','28-02-1994',1.65,1),(2,'Wang Yilyu','CHN','18-07-1995',1.85,'Huang Dongping','CHN','20-01-1995',1.65,1),(3,'Dechapol Puavaranukroh','THA','20-05-1997',1.69,'Sapsiree Taerattanachai','THA','18-04-1992',1.69,1),(4,'Yuta Watanabe','JPN','13-06-1997',1.67,'Arisa Higashino','JPN','01-08-1996',1.6,1),(5,'Seo Seung-jae','KOR','04-09-1997',1.82,'Chae Yoo-jung','KOR','09-05-1995',1.63,2),(6,'Praveen Jordan','INA','26-04-1993',1.83,'Melati Daeva Oktavianti','INA','26-10-1994',1.68,4),(7,'Marcus Ellis','ENG','14-09-1989',1.8,'Lauren Smith','ENG','26-09-1991',1.71,7),(8,'Thom Gicquel','FRA','12-01-1999',1.85,'Delphine Delrue','FRA','14-12-1998',1.7,5),(9,'Feng Yanzhe','CHN','13-02-2001',1.95,'Huang Dongping','CHN','20-01-1995',1.65,1),(10,'Jiang Zhenbang','CHN','28-05-2001',1.8,'Wei Yaxin','CHN','18-04-2000',1.68,1),(11,'Tang Chun Man','HKG','20-03-1995',1.73,'Tse Ying Suet','HKG','09-11-1991',1.71,2),(12,'Mathias Christiansen','DEN','20-02-1994',1.88,'Alexandra Boje','DEN','06-12-1999',1.73,8),(13,'Goh Soon Huat','MAS','27-06-1990',1.77,'Shevon Jemie Lai','MAS','08-08-1993',1.65,3),(14,'Tan Kian Meng','MAS','01-06-1994',1.85,'Lai Pei Jing','MAS','08-08-1992',1.64,5),(15,'Chan Peng Soon','MAS','27-04-1988',1.75,'Goh Liu Ying','MAS','30-05-1989',1.66,3),(16,'Hafiz Faizal','INA','23-09-1994',1.74,'Gloria Emanuelle Widjaja','INA','28-12-1993',1.82,6),(17,'Rinov Rivaldy','INA','12-11-1999',1.75,'Pitha Haningtyas Mentari','INA','01-07-1999',1.65,9),(18,'Mark Lamsfuss','GER','19-04-1994',1.8,'Isabel Lohau','GER','17-03-1992',1.69,8),(19,'Kim Won-ho','KOR','02-06-1999',1.77,'Jeong Na-eun','KOR','27-06-2000',1.65,4),(20,'Chen Tang Jie','MAS','24-01-1998',1.78,'Toh Ee Wei','MAS','18-09-2000',1.63,3),(21,'Hiroki Midorikawa','JPN','17-05-2000',1.71,'Natsu Saito','JPN','09-06-2000',1.63,10),(22,'Yuki Kaneko','JPN','22-07-1994',1.78,'Misaki Matsutomo','JPN','08-02-1992',1.59,10),(23,'Robin Tabeling','NED','24-04-1994',1.91,'Selena Piek','NED','30-09-1991',1.73,10),(24,'Terry Hee','SGP','06-07-1995',1.75,'Jessica Tan','SGP','16-07-1993',1.64,13),(25,'Kyohei Yamashita','JPN','12-10-1998',1.72,'Naru Shinoya','JPN','18-03-1998',1.6,13),(26,'Rehan Naufal Kusharjanto','INA','28-02-2000',1.74,'Lisa Ayu Kusumawati','INA','15-01-2000',1.65,10),(27,'Dejan Ferdinansyah','INA','21-01-2000',1.8,'Gloria Emanuelle Widjaja','INA','28-12-1993',1.82,8),(28,'Supak Jomkoh','THA','04-09-1996',1.75,'Supissara Paewsampran','THA','18-11-1999',1.71,11),(29,'He Jiting','CHN','19-02-1998',1.78,'Du Yue','CHN','15-02-1998',1.65,11),(30,'Chris Adcock','ENG','08-05-1989',1.81,'Gabrielle Adcock','ENG','30-09-1990',1.66,4),(31,'Tontowi Ahmad','INA','18-07-1987',1.79,'Liliyana Natsir','INA','09-09-1985',1.62,1),(32,'Ko Sung-hyun','KOR','21-05-1987',1.82,'Eom Hye-won','KOR','09-09-1991',1.65,10),(33,'Mathias Christiansen','DEN','20-02-1994',1.88,'Christinna Pedersen','DEN','12-05-1986',1.78,4),(34,'Lee Chun Hei','HKG','08-02-1994',1.75,'Chau Hoi Wah','HKG','05-06-1986',1.65,6),(35,'Chang Tak Ching','HKG','22-02-1995',1.75,'Ng Wing Yung','HKG','17-05-1995',1.68,23),(36,'Ye Hong-wei','TPE','01-11-1999',1.83,'Lee Chia-hsin','TPE','14-05-1997',1.71,12),(37,'Yang Po-hsuan','TPE','23-08-1996',1.75,'Hu Ling-fang','TPE','04-06-1998',1.7,25),(38,'Vinson Chiu','USA','08-08-1998',1.76,'Jennie Gai','USA','25-02-2001',1.64,28),(39,'Ty Alexander Lindeman','CAN','15-08-1997',1.83,'Josephine Wu','CAN','20-01-1995',1.68,29),(40,'Joshua Hurlburt-Yu','CAN','28-12-1994',1.8,'Josephine Wu','CAN','20-01-1995',1.68,27),(41,'Nipitphon Phuangphuapet','THA','31-05-1991',1.76,'Savitree Amitrapai','THA','19-11-1988',1.64,13),(42,'Mikkel Mikkelsen','DEN','22-05-1992',1.83,'Rikke Soby Hansen','DEN','23-04-1995',1.71,28),(43,'Callum Hemming','ENG','27-06-1999',1.85,'Jessica Pugh','ENG','17-03-1997',1.65,35),(44,'Hoo Pang Ron','MAS','29-03-1998',1.75,'Cheah Yee See','MAS','18-11-1995',1.64,16),(45,'Guo Xinwa','CHN','10-06-1999',1.8,'Wei Yaxin','CHN','18-04-2000',1.68,25),(46,'Cheng Xing','CHN','07-05-2002',1.85,'Chen Fanghui','CHN','17-08-2000',1.68,20),(47,'Adam Hall','SCO','12-02-1996',1.81,'Julie MacPherson','SCO','17-11-1997',1.68,34),(48,'Mathias Thyrri','DEN','29-08-1997',1.85,'Amalie Magelund','DEN','13-05-2000',1.74,21),(49,'Gregory Mairs','ENG','07-11-1994',1.88,'Jenny Moore','ENG','31-08-1995',1.75,26),(50,'Jones Ralfy Jansen','GER','12-11-1992',1.8,'Linda Efler','GER','23-01-1995',1.78,35);
/*!40000 ALTER TABLE `mixed_double` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `women_double`
--

DROP TABLE IF EXISTS `women_double`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `women_double` (
  `id` int DEFAULT NULL,
  `player1_name` varchar(512) DEFAULT NULL,
  `player1_country` varchar(512) DEFAULT NULL,
  `player1_birth_date` varchar(512) DEFAULT NULL,
  `player1_height` double DEFAULT NULL,
  `player2_name` varchar(512) DEFAULT NULL,
  `player2_country` varchar(512) DEFAULT NULL,
  `player2_birth_date` varchar(512) DEFAULT NULL,
  `player2_height` double DEFAULT NULL,
  `highest_ranking` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `women_double`
--

LOCK TABLES `women_double` WRITE;
/*!40000 ALTER TABLE `women_double` DISABLE KEYS */;
INSERT INTO `women_double` VALUES (1,'Chen Qingchen','CHN','23-06-1997',1.64,'Jia Yifan','CHN','29-06-1997',1.7,1),(2,'Yuki Fukushima','JPN','06-05-1993',1.64,'Sayaka Hirota','JPN','01-08-1994',1.7,1),(3,'Mayu Matsumoto','JPN','01-08-1995',1.77,'Wakana Nagahara','JPN','09-01-1996',1.7,1),(4,'Lee So-hee','KOR','14-06-1994',1.71,'Shin Seung-chan','KOR','06-12-1994',1.73,2),(5,'Kim So-yeong','KOR','09-07-1992',1.73,'Kong Hee-yong','KOR','11-12-1996',1.66,1),(6,'Greysia Polii','INA','11-08-1987',1.64,'Apriyani Rahayu','INA','29-04-1998',1.63,2),(7,'Misaki Matsutomo','JPN','08-02-1992',1.59,'Ayaka Takahashi','JPN','19-04-1990',1.65,1),(8,'Jongkolphan Kititharakul','THA','01-03-1993',1.71,'Rawinda Prajongjai','THA','29-06-1993',1.64,5),(9,'Pearly Tan','MAS','14-03-2000',1.64,'Thinaah Muralitharan','MAS','03-01-1998',1.64,2),(10,'Apriyani Rahayu','INA','29-04-1998',1.63,'Siti Fadia Silva Ramadhanti','INA','16-11-2000',1.67,4),(11,'Nami Matsuyama','JPN','28-06-1998',1.66,'Chiharu Shida','JPN','29-04-1997',1.62,2),(12,'Gabriela Stoeva','BUL','15-07-1994',1.76,'Stefani Stoeva','BUL','23-09-1995',1.75,8),(13,'Maiken Fruergaard','DEN','11-05-1995',1.73,'Sara Thygesen','DEN','20-01-1991',1.71,9),(14,'Du Yue','CHN','15-02-1998',1.65,'Li Yinhui','CHN','11-03-1997',1.71,5),(15,'Zhang Shuxian','CHN','02-01-2000',1.68,'Zheng Yu','CHN','07-01-1996',1.73,2),(16,'Baek Ha-na','KOR','22-09-2000',1.64,'Lee So-hee','KOR','14-06-1994',1.71,1),(17,'Liu Shengshu','CHN','08-04-2004',1.74,'Tan Ning','CHN','03-04-2003',1.73,1),(18,'Treesa Jolly','IND','27-05-2003',1.76,'Gayatri Gopichand','IND','04-03-2003',1.62,9),(19,'Benyapa Aimsaard','THA','29-08-2002',1.75,'Nuntakarn Aimsaard','THA','23-05-1999',1.7,9),(20,'Rin Iwanaga','JPN','21-05-1999',1.66,'Kie Nakanishi','JPN','24-12-1995',1.7,4),(21,'Chloe Birch','ENG','16-09-1995',1.68,'Lauren Smith','ENG','26-09-1991',1.71,12),(22,'Ashwini Ponnappa','IND','18-09-1989',1.64,'N. Sikki Reddy','IND','18-08-1993',1.64,17),(23,'Setyana Mapasa','AUS','15-08-1995',1.68,'Gronya Somerville','AUS','10-05-1995',1.71,18),(24,'Rachel Honderich','CAN','21-04-1996',1.73,'Kristen Tsai','CAN','11-07-1995',1.73,15),(25,'Chow Mei Kuan','MAS','23-12-1994',1.65,'Lee Meng Yean','MAS','30-03-1994',1.63,10),(26,'Vivian Hoo','MAS','19-03-1990',1.65,'Yap Cheng Wen','MAS','04-01-1995',1.64,17),(27,'Puttita Supajirakul','THA','29-03-1996',1.83,'Sapsiree Taerattanachai','THA','18-04-1992',1.69,9),(28,'Selena Piek','NED','30-09-1991',1.73,'Cheryl Seinen','NED','04-08-1995',1.72,17),(29,'Linda Efler','GER','23-01-1995',1.78,'Isabel Lohau','GER','17-03-1992',1.69,21),(30,'Yeung Nga Ting','HKG','13-10-1998',1.66,'Yeung Pui Lam','HKG','26-10-2001',1.63,12),(31,'Shiho Tanaka','JPN','05-09-1992',1.64,'Koharu Yonemoto','JPN','07-12-1990',1.66,4),(32,'Ayako Sakuramoto','JPN','19-08-1995',1.65,'Yukiko Takahata','JPN','18-03-1998',1.66,10),(33,'Rena Miyaura','JPN','25-07-1995',1.65,'Ayako Sakuramoto','JPN','19-08-1995',1.65,11),(34,'Rui Hirokami','JPN','02-06-2002',1.67,'Yuna Kato','JPN','26-06-2002',1.66,18),(35,'Febriana Dwipuji Kusuma','INA','19-02-2001',1.63,'Amalia Cahaya Pratiwi','INA','14-10-2001',1.7,8),(36,'Jeong Na-eun','KOR','27-06-2000',1.67,'Kim Hye-jeong','KOR','03-01-1998',1.61,3),(37,'Hsu Ya-ching','TPE','30-07-1991',1.71,'Lin Wan-ching','TPE','01-11-1995',1.67,20),(38,'Lee Chia-hsin','TPE','14-05-1997',1.71,'Teng Chun-hsun','TPE','27-09-2000',1.68,21),(39,'Margot Lambert','FRA','15-03-1999',1.63,'Anne Tran','FRA','27-04-1996',1.66,13),(40,'Julie MacPherson','SCO','17-11-1997',1.68,'Ciara Torrance','SCO','01-09-1999',1.68,25),(41,'Anna Cheong','MAS','15-03-1998',1.64,'Teoh Mei Xing','MAS','06-03-1997',1.67,27),(42,'Kati-Kreet Marran','EST','13-07-1998',1.72,'Helina Ruutel','EST','11-08-1997',1.74,40),(43,'Debora Jille','NED','11-09-1999',1.76,'Cheryl Seinen','NED','04-08-1995',1.72,25),(44,'Vivian Hoo','MAS','19-03-1990',1.65,'Lim Chiew Sien','MAS','14-05-1994',1.72,15),(45,'Ashwini Ponnappa','IND','18-09-1989',1.64,'Tanisha Crasto','IND','05-05-2003',1.65,13),(46,'Ng Tsz Yau','HKG','24-04-1998',1.66,'Tsang Hiu Yan','HKG','29-06-2001',1.68,30),(47,'Li Wenmei','CHN','02-11-1999',1.78,'Zheng Yu','CHN','07-01-1996',1.73,10),(48,'Baek Ha-na','KOR','22-09-2000',1.64,'Lee Yu-lim','KOR','27-01-2000',1.66,12),(49,'Chang Ching-hui','TPE','17-05-1996',1.68,'Yang Ching-tun','TPE','17-11-1995',1.7,35),(50,'Dong Wenjing','CHN','05-08-1998',1.65,'Feng Xueying','CHN','19-12-1998',1.71,20);
/*!40000 ALTER TABLE `women_double` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `women_single`
--

DROP TABLE IF EXISTS `women_single`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `women_single` (
  `id` int DEFAULT NULL,
  `name` varchar(512) DEFAULT NULL,
  `country` varchar(512) DEFAULT NULL,
  `birth_date` varchar(512) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `highest_ranking` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `women_single`
--

LOCK TABLES `women_single` WRITE;
/*!40000 ALTER TABLE `women_single` DISABLE KEYS */;
INSERT INTO `women_single` VALUES (1,'Tai Tzu-ying','TPE','20-06-1994',1.63,1),(2,'An Se-young','KOR','05-02-2002',1.7,1),(3,'Akane Yamaguchi','JPN','06-06-1997',1.56,1),(4,'Chen Yufei','CHN','01-03-1998',1.71,1),(5,'Carolina Marin','ESP','15-06-1993',1.72,1),(6,'Ratchanok Intanon','THA','05-02-1995',1.68,1),(7,'Nozomi Okuhara','JPN','13-03-1995',1.56,1),(8,'Saina Nehwal','IND','17-03-1990',1.65,1),(9,'P. V. Sindhu','IND','05-07-1995',1.79,2),(10,'Sung Ji-hyun','KOR','29-07-1991',1.75,2),(11,'Wang Zhiyi','CHN','29-04-2000',1.71,2),(12,'Han Yue','CHN','18-11-1999',1.68,3),(13,'He Bingjiao','CHN','21-03-1997',1.69,5),(14,'Gregoria Mariska Tunjung','INA','11-08-1999',1.64,5),(15,'Pornpawee Chochuwong','THA','22-01-1998',1.7,6),(16,'Supanida Katethong','THA','26-10-1997',1.63,6),(17,'Putri Kusuma Wardani','INA','20-07-2002',1.72,6),(18,'Aya Ohori','JPN','02-10-1996',1.69,7),(19,'Michelle Li','CAN','03-11-1991',1.71,8),(20,'Beiwen Zhang','USA','12-07-1990',1.69,9),(21,'Busanan Ongbamrungphan','THA','22-03-1996',1.68,9),(22,'Kim Ga-eun','KOR','07-02-1998',1.72,9),(23,'Sayaka Takahashi','JPN','29-07-1992',1.68,10),(24,'Gao Fangjie','CHN','29-09-1998',1.78,10),(25,'Yeo Jia Min','SGP','01-02-1999',1.64,11),(26,'Mia Blichfeldt','DEN','19-08-1997',1.72,11),(27,'Zhang Yiman','CHN','15-01-1997',1.71,13),(28,'Kirsty Gilmour','SCO','21-09-1993',1.7,14),(29,'Line Kjaersfeldt','DEN','20-04-1994',1.74,16),(30,'Wen Chi Hsu','TPE','28-09-1997',1.65,16),(31,'Lalinrat Chaiwan','THA','21-02-2001',1.64,16),(32,'Line Christophersen','DEN','14-01-2000',1.7,17),(33,'Evgeniya Kosetskaya','RUS','16-12-1996',1.76,18),(34,'Pai Yu-po','TPE','18-04-1991',1.73,20),(35,'Saena Kawakami','JPN','03-12-1997',1.59,21),(36,'Yvonne Li','GER','30-05-1998',1.66,22),(37,'Soniia Cheah','MAS','19-06-1993',1.75,23),(38,'Goh Jin Wei','MAS','30-01-2000',1.58,24),(39,'Natsuki Nidaira','JPN','12-07-1998',1.6,24),(40,'Neslihan Yigit','TUR','26-02-1994',1.72,27),(41,'Fitriani','INA','27-12-1998',1.55,27),(42,'Iris Wang','USA','02-09-1994',1.62,30),(43,'Malvika Bansod','IND','15-09-2001',1.61,31),(44,'Aakarshi Kashyap','IND','24-08-2001',1.6,32),(45,'Clara Azurmendi','ESP','04-05-1998',1.77,32),(46,'Qi Xuefei','FRA','28-02-1992',1.7,32),(47,'Lianne Tan','BEL','20-11-1990',1.66,35),(48,'Kristin Kuuba','EST','15-02-1997',1.72,39),(49,'Lauren Lam','USA','15-01-2003',1.65,41),(50,'Ksenia Polikarpova','ISR','11-03-1990',1.72,43);
/*!40000 ALTER TABLE `women_single` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-01 22:26:07
