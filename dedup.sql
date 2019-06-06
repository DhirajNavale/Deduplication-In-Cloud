-- MySQL dump 10.13  Distrib 5.1.30, for Win32 (ia32)
--
-- Host: localhost    Database: dedup
-- ------------------------------------------------------
-- Server version	5.1.30-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Contact` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Admin Dedup','admin@gmail.com','Admin1234','8657976088');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup`
--

DROP TABLE IF EXISTS `backup`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `backup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Sharepath` varchar(70) NOT NULL,
  `Tag` varchar(1000) NOT NULL,
  `File_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `backup`
--

LOCK TABLES `backup` WRITE;
/*!40000 ALTER TABLE `backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadtime`
--

DROP TABLE IF EXISTS `downloadtime`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `downloadtime` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Filelength` int(15) unsigned NOT NULL,
  `Time` int(15) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `downloadtime`
--

LOCK TABLES `downloadtime` WRITE;
/*!40000 ALTER TABLE `downloadtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dupblocks`
--

DROP TABLE IF EXISTS `dupblocks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `dupblocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blockname` varchar(70) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `dupblocks`
--

LOCK TABLES `dupblocks` WRITE;
/*!40000 ALTER TABLE `dupblocks` DISABLE KEYS */;
INSERT INTO `dupblocks` VALUES (1,'C:/Deduplication_storage/Share/DEMO2.txt.partA'),(2,'C:/Deduplication_storage/Share/DEMO2.txt.partB'),(3,'C:/Deduplication_storage/Share/DEMO2.txt.partC'),(4,'C:/Deduplication_storage/Share/DEMO2.txt.partD'),(5,'C:/Deduplication_storage/Share/DEMO2.txt.partE'),(6,'C:/Deduplication_storage/Share/DEMO2.txt.partF'),(7,'C:/Deduplication_storage/Share/DEMO2.txt.partG'),(8,'C:/Deduplication_storage/Share/DEMO2.txt.partH'),(9,'C:/Deduplication_storage/Share/DEMO2.txt.partI'),(10,'C:/Deduplication_storage/Share/DEMO2.txt.partJ'),(11,'C:/Deduplication_storage/Share/DEMO2.txt.partK'),(12,'C:/Deduplication_storage/Share/DEMO2.txt.partL'),(13,'C:/Deduplication_storage/Share/DEMO2.txt.partM'),(14,'C:/Deduplication_storage/Share/DEMO2.txt.partN'),(15,'C:/Deduplication_storage/Share/DEMO2.txt.partO'),(16,'C:/Deduplication_storage/Share/DEMO2.txt.partP'),(17,'C:/Deduplication_storage/Share/DEMO2.txt.partQ'),(18,'C:/Deduplication_storage/Share/DEMO2.txt.partR'),(19,'C:/Deduplication_storage/Share/DEMO2.txt.partS'),(20,'C:/Deduplication_storage/Share/DEMO2.txt.partT'),(21,'C:/Deduplication_storage/Share/DEMO2.txt.partU'),(22,'C:/Deduplication_storage/Share/DEMO2.txt.partV'),(23,'C:/Deduplication_storage/Share/DEMO3.txt.partA'),(24,'C:/Deduplication_storage/Share/DEMO3.txt.partB'),(25,'C:/Deduplication_storage/Share/DEMO3.txt.partC'),(26,'C:/Deduplication_storage/Share/DEMO3.txt.partD'),(27,'C:/Deduplication_storage/Share/DEMO3.txt.partE'),(28,'C:/Deduplication_storage/Share/DEMO3.txt.partF');
/*!40000 ALTER TABLE `dupblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dupfiles`
--

DROP TABLE IF EXISTS `dupfiles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `dupfiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Filename` varchar(70) NOT NULL,
  `Username` varchar(70) NOT NULL,
  `Tag` varchar(1000) NOT NULL,
  `groupid` varchar(45) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `dupfiles`
--

LOCK TABLES `dupfiles` WRITE;
/*!40000 ALTER TABLE `dupfiles` DISABLE KEYS */;
INSERT INTO `dupfiles` VALUES (2,'b11.txt','sonalimitkari05@gmail.com','503f318e3bb986585d9d16764f02c13491b58781','2'),(3,'b12.txt','rudra@gmail.com','a2fb5b2d7bb317438a86b68a16a674cbbe440522','2'),(4,'b12.txt','sonalimitkari05@gmail.com','503f318e3bb986585d9d16764f02c13491b58781','2'),(5,'skip.txt','sonalimitkari05@gmail.com','6e4a17872838fac66950853643d070681ae24221','2'),(6,'cd.txt','saudu313@gmail.com','1a83688a8b238365fe408b3fbb386f5d1c8beea8','1'),(7,'ef.txt','d.navle95@gmail.com','435fe7db4e748dac6fabddd69fe66dba521b5f35','1'),(8,'cdac 23rd - Copy.pdf','saudu313@gmail.com','aeb4407368918912d2e9275bb061b295a54b7a12','1'),(9,'cdac 23rd - Copy.pdf','d.navle95@gmail.com','4e2f79731b253e2d58d9839e3c4ad5ce1b71ca79','1'),(10,'Final_Latex - Copy.pdf','d.navle95@gmail.com','62e02f1838856b96f85b2bb9fd514c493363b927','1');
/*!40000 ALTER TABLE `dupfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filepath` varchar(500) NOT NULL,
  `filelength` int(10) unsigned NOT NULL,
  `hashvalue` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (4,'F:\\Deduplication_storage\\Frag.txt',3936,'ee46915be8203e86c1787ca8385750c10b78732e8dc7708371b9cd9a20c95238'),(5,'F:\\Deduplication_storage\\fg.txt',3936,'ee46915be8203e86c1787ca8385750c10b78732e8dc7708371b9cd9a20c95238'),(6,'F:\\Deduplication_storage\\req.txt',208,'3e8cb1a499563b753fa1439ac223f72240be427c5ae0379c473e114946295c9a'),(7,'F:\\Deduplication_storage\\rq.txt',208,'3e8cb1a499563b753fa1439ac223f72240be427c5ae0379c473e114946295c9a'),(8,'F:\\Deduplication_storage\\java projects.txt',14613,'4129b331b56445970ad8f9fe3140a66dfdca1331da14ca8337acd6311d8ae59d'),(9,'F:\\Deduplication_storage\\Filesplit.txt',8238,'5d59989ee33bfb29eca42ead00dbc351d992a3ac3f2c87d190d67bc9b04b9d1e'),(10,'F:\\Deduplication_storage\\Frag.txt',3954,'603d379889878b437c712ddd355cb3ead42bedd6e0e4cd7fdb89399602dbd762');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_storage`
--

DROP TABLE IF EXISTS `file_storage`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `file_storage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Username` varchar(70) NOT NULL,
  `Filename` varchar(70) NOT NULL,
  `Filepath` varchar(100) NOT NULL,
  `Tag` varchar(1000) NOT NULL,
  `Proof` varchar(1000) NOT NULL,
  `Fileid` varchar(100) NOT NULL,
  `groupid` varchar(45) DEFAULT NULL,
  `owner` varchar(455) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `file_storage`
--

LOCK TABLES `file_storage` WRITE;
/*!40000 ALTER TABLE `file_storage` DISABLE KEYS */;
INSERT INTO `file_storage` VALUES (1,'sonalimitkari05@gmail.com','b1.txt','C:/Deduplication_storage/Share','dc8932dbe8e20b4941de9278daead7e439389c81f2eb8b03a1892d752c2f537b','503f318e3bb986585d9d16764f02c13491b58781','20bcd15a-3917-4f06-bc1e-0ef0d212ded3','1',NULL),(2,'rudra@gmail.com','b11.txt','C:/Deduplication_storage/Share','dc8932dbe8e20b4941de9278daead7e439389c81f2eb8b03a1892d752c2f537b','a2fb5b2d7bb317438a86b68a16a674cbbe440522','20bcd15a-3917-4f06-bc1e-0ef0d212ded3','1',NULL),(3,'sonalimitkari05@gmail.com','skipgram1.txt','C:/Deduplication_storage/Share','c75c843f1265e4aced5c23d74f3567eef4ba196e2fa4d302dae303bb596e8e5e','6e4a17872838fac66950853643d070681ae24221','18261199-50c0-4d75-a051-ecac69a04681','1',NULL),(4,'sonalimitkari05@gmail.com','aaaa.PNG','C:/Deduplication_storage/Share','852d1eba60911e083125cf7c0efb083ce9546559e679d0f3d6b467b808e8eeb0','3ed66853787cc5131649e38e072b65eae46f5f31','0a6ad71a-cbbb-4fd3-9fa1-2b876cb09280','1',NULL),(5,'saudu313@gmail.com','ab.txt','C:/Deduplication_storage/Share','88d4266fd4e6338d13b845fcf289579d209c897823b9217da3e161936f031589','1a83688a8b238365fe408b3fbb386f5d1c8beea8','73ee7a7b-ee84-4f7d-9a99-58a7a210db34','1',NULL),(6,'d.navle95@gmail.com','cd.txt','C:/Deduplication_storage/Share','88d4266fd4e6338d13b845fcf289579d209c897823b9217da3e161936f031589','435fe7db4e748dac6fabddd69fe66dba521b5f35','73ee7a7b-ee84-4f7d-9a99-58a7a210db34','1',NULL),(8,'d.navle95@gmail.com','abcd.txt','C:/Deduplication_storage/Share','fb8e20fc2e4c3f248c60c39bd652f3c1347298bb977b8b4d5903b85055620603','142a062ce382434585b7cefcbfd45fbbd15495e7','126de5af-0926-49de-89af-95375d5ce7c0','1',NULL),(9,'saudu313@gmail.com','cdac 23rd.pdf','C:/Deduplication_storage/Share','74029253b58f48fadcc3428b78419660839d76ea72c6ff8d04fbb47d4a78870d','aeb4407368918912d2e9275bb061b295a54b7a12','38b5311c-0707-4b19-adac-a374aa15a13b','1',NULL),(11,'d.navle95@gmail.com','Final_Latex.pdf','C:/Deduplication_storage/Share','571dd75d07770aa850cf63059b5f665fd71c83c89efa9d4bb8082811d50fb735','62e02f1838856b96f85b2bb9fd514c493363b927','5ef3c633-afc4-4a91-bbcc-09d25259e892','1',NULL);
/*!40000 ALTER TABLE `file_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtable`
--

DROP TABLE IF EXISTS `hashtable`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `hashtable` (
  `Sharepath` varchar(100) NOT NULL,
  `Tag` varchar(1000) NOT NULL,
  `File_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `hashtable`
--

LOCK TABLES `hashtable` WRITE;
/*!40000 ALTER TABLE `hashtable` DISABLE KEYS */;
INSERT INTO `hashtable` VALUES ('C:/Deduplication_storage/Tpadata/DEMO1.txt.partA','4793fd03ea3b6e7cf9ee5fd224978a7c45e7d03e167e4afa4345e15b580b0b1f','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partB','084b96493f7d1a0979295d04d2c01dea591a485352e818d4945ea09a1ab21ce2','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partC','770d4197e3f9b941ffec06d5d8582ad73e0edbc2a3102c55877d19dc0b2d5e9f','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partD','bc8879caba4828dfeea2b8efbebb641cfa366023b2581cde7bbf254798ddd886','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partE','c00d8e481929ced19cd4555038c80502600e31dc45b6d3ec0bf9633c2be543e3','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partF','12f370fa27ff836152f6b3e8257146854573f390b8888e9186789bb7444dc885','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partG','8042f66b70e076b7f2e0d5ec9ea97d7f52cb8402398483a2d87d3197c758f9e4','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partH','d2d43442c80c6b1f4bc23cca11f56af5e058c31c07af93a803000d053adf27c6','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partI','3019c5803201bbe4e33f27629fdea575935c7b489ab579b889db30f55e50feec','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partJ','2ef53f2b280bc549ba8215c69092b7b1b3f1c2fbb0c714b118d7db54cf581a88','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partK','890a24022e2883eff0cb48fdd503771f43558f3482aa4979f2981871330e0e71','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partL','7348b5b99880e89a510be60a4048385b62ea721e41d47723b29e6f9096ab5764','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partM','5b2fc8574c079c9fba0998401120ef4e6d8422f55d2287cb6e75deb9b6a111e5','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partN','f200972dff1a021285641766e67a476452fe2ece4458c3022370abad0c4aea01','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partO','214411eb03f3d6f2f726c2fa902ea5b488443e0faf3a4340d8c5d0176c233d11','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partP','2a52af5437abe195f9ea05c40aa8a891e848e1081e4cabdf4e30dfbab26c3c1a','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partQ','7c4157a85759146b466bfbaaa03f83bdac1fe39434af7a14ce254e3f7e0abc3d','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partR','a0f6d6c4276ec694ac9f39675fd304399bf47ba8fea6c594ad877a587ee10f42','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partS','1b14f08f8e8329edc6cc6dd433404eb8848f28699cfe5cf1b89bc1fb9570cfd3','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partT','876e869ff3a62bf9932299a5be6a06a12c0b61b6299800de4a46db734f00f373','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partU','078f0c20dd5f7c04134701373bf148a24d223095c8f635774097f9be65b71ecf','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partV','03e1435f2282fbe775ab90cbd45c80171c1889816496591aeff0b879bb4eec54','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partW','50e84c486297f56694ec216bd5f3fbd2b28da3eab929fb1e28f3d45da586ae7f','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partX','5ebb845b9e3c6d2063f899a531bbbbec829fca93f5f0784968541a4ff73a0f14','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partY','95ae6986a55bb30b17b0226c03c990c2a3d8ba384dcd94c009b57066d82914a7','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO1.txt.partZ','61d3cf0ec8f47a507a74a0a9c269cece73b4aef7a5dd374ef48b61a12dd44e10','5fd39f48-e355-4bb4-b96e-952e11a12aaa'),('C:/Deduplication_storage/Tpadata/DEMO2.txt.partW','829c381057e2e030c618d7ee17106bbbb0f3b3cbdf3ec5c5fa707f7d85843982','4d38e167-8059-42fb-b80a-354d277e03a8'),('C:/Deduplication_storage/Tpadata/DEMO3.txt.partG','40c4869255c2b914b4fb3cdce43254b8b28e18fcec22c2f87fa6e448a55e579e','690fe3d8-ced8-4799-a1e2-d519db97cc20'),('C:/Deduplication_storage/Tpadata/DEMO3.txt.partH','267567081631d62afac5626c85037e86cd08f33e7b7642915da9f85d3844483c','690fe3d8-ced8-4799-a1e2-d519db97cc20'),('C:/Deduplication_storage/Tpadata/DEMO3.txt.partI','98ee4f8b4e610e9d21877992d9474f8f82b2d1fb6c97cd85136786695672950b','690fe3d8-ced8-4799-a1e2-d519db97cc20'),('C:/Deduplication_storage/Tpadata/Eagriculture Fertilizer 20160726 1240.sql.partA','0f1185176b85c2eb5ccbe8a19d84f9dd4e4e3ee07e9a20365696f034cd2d7412','703d9407-4118-420d-aff8-7e888396bccf'),('C:/Deduplication_storage/Tpadata/Eagriculture Fertilizer 20160726 1240.sql.partB','ec1bd5f4000449707cfb553520f7d51f9829f409f84d68793dac5d819cb58cd1','703d9407-4118-420d-aff8-7e888396bccf'),('C:/Deduplication_storage/Tpadata/Eagriculture Fertilizer 20160726 1240.sql.partC','eebb63e77e5fa752857e7853728f5569afd5691c13454ba02cb76b847f3de529','703d9407-4118-420d-aff8-7e888396bccf'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partA','5c8f4fa6cdbd73640ec1885cd613d65bc7057ae73d7f95ef7ded046d1a186204','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partB','ea7097fea0a7fbf749b047b49c317d16bde0fea402da8c3bbd626e0731dde865','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partC','3e76427df2a435c8724b67dc3b0f08a85df930edf0f0c08c37bc8664e1c89952','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partD','ba508cb11bd6a05e451e7967ca5bc5d45e6c456b69ff1dd6126486c2491ee202','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partE','8a3207d46693b746374598c3f15f962b66e0830c737c4cae44457a91c76b9d1a','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partF','377833d9864e19c126a0fd23e333e2e97aca3fa082f9e332dece4d98655e8fb5','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partG','1e832e392f00757c868f99a84daedcfae59851277cceea7547703ca0a3948526','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partH','b8fc1cab40dd1dbcbe0d076b358d2005b355b2ae88034215efcf8ca1066d1012','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partI','19337653874ce4e3e36c85c0ecf5393ebd6998a5d2c58cc97e77cff6f381a1ce','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partJ','261a0555cd59a79842586587f10f2389825b902744582e2f4b50147e0dbff68c','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partK','1dd4af2c2a95c570901ca5e9b45904a81a945c1490c375e252c5df71cfe89f3f','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partL','77c2e60a95e42b36e4f10462b09cd873ea5cbab44fdc8fe47f636db2230d2220','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partM','5b79e85466d5f93e3b6fba9f2e1ea796004e162ed5185b8b48d14dc2d46ca470','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partN','ff04d39fcc88d09108d7a0bf71fe42523cc7e5fe3b6bfffbc1c6d8a8336b8704','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partO','81304df8fe353716bc898bb5e9cf9e83b89d57cf78cb1d00392cd9439b0668c1','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partP','a309686b56a5bb014bc9a915941bfb75b3d4fa354cfd5a6c70c09c8889a6fc50','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partQ','b0c8d6bbd6984b4af3ef1ea885faec7b0b331342dddf3bbb6df438c6e05b0cb6','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partR','30c9536b965d49520976dbec7a34c23ef4a64ec13ddd3a19d58c69fab35a10be','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partS','1b34cf1dc65ebb5a89f38d58ac3a8f3d03f6731a003be0c5442f3ca9257674ff','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partT','deb3c9a9cf2fd0c84eeaa80f6dd6fdb21d6f7147c342da703af52e0eb8c541d8','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partU','cee38246777b760fbf8e39f25110114784dc1399056af5e865c440f582420c45','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partV','96f99aeabf22ebd656df42a183230a1684dcc04a16eb1b4b9e35db42c742b13d','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partW','5aef25328d2f0a6afa06ff551b354bfea84ddc729e0b7b7591f3f5619fd26489','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partX','367324536483ae7772cb5d02e31505e931f72bf48ff178b4faa72293019f1c8b','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partY','87525fda5436488e725ffda61a491919a797559fde18ba2fe0173e5716858ba2','ac4a3a6c-6626-4fc1-ae35-f71efea76582'),('C:/Deduplication_storage/Tpadata/New Project 20160921 1643.sql.partZ','432f163a9df69ad093fe03a1f3375a605d5cd6f6d5179a74d04fa09f08cecefa','ac4a3a6c-6626-4fc1-ae35-f71efea76582');
/*!40000 ALTER TABLE `hashtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrityresult`
--

DROP TABLE IF EXISTS `integrityresult`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `integrityresult` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NoOfShare` int(10) unsigned NOT NULL,
  `time` int(15) unsigned NOT NULL,
  `tamperedfiles` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `integrityresult`
--

LOCK TABLES `integrityresult` WRITE;
/*!40000 ALTER TABLE `integrityresult` DISABLE KEYS */;
INSERT INTO `integrityresult` VALUES (1,22,868,0),(2,26,1130,0),(3,26,1520,0),(4,26,757,1),(5,26,522,1);
/*!40000 ALTER TABLE `integrityresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share`
--

DROP TABLE IF EXISTS `share`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `share` (
  `Tag` varchar(100) NOT NULL,
  `Node_no` int(10) unsigned NOT NULL,
  `Sharename` varchar(70) NOT NULL,
  `Hashvalue` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `share`
--

LOCK TABLES `share` WRITE;
/*!40000 ALTER TABLE `share` DISABLE KEYS */;
INSERT INTO `share` VALUES ('5fd39f48-e355-4bb4-b96e-952e11a12aaa',1,'DEMO1.txt.partA','4793fd03ea3b6e7cf9ee5fd224978a7c45e7d03e167e4afa4345e15b580b0b1f'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',3,'DEMO1.txt.partB','084b96493f7d1a0979295d04d2c01dea591a485352e818d4945ea09a1ab21ce2'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',5,'DEMO1.txt.partC','770d4197e3f9b941ffec06d5d8582ad73e0edbc2a3102c55877d19dc0b2d5e9f'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',7,'DEMO1.txt.partD','bc8879caba4828dfeea2b8efbebb641cfa366023b2581cde7bbf254798ddd886'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',9,'DEMO1.txt.partE','c00d8e481929ced19cd4555038c80502600e31dc45b6d3ec0bf9633c2be543e3'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',11,'DEMO1.txt.partF','12f370fa27ff836152f6b3e8257146854573f390b8888e9186789bb7444dc885'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',13,'DEMO1.txt.partG','8042f66b70e076b7f2e0d5ec9ea97d7f52cb8402398483a2d87d3197c758f9e4'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',15,'DEMO1.txt.partH','d2d43442c80c6b1f4bc23cca11f56af5e058c31c07af93a803000d053adf27c6'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',17,'DEMO1.txt.partI','3019c5803201bbe4e33f27629fdea575935c7b489ab579b889db30f55e50feec'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',19,'DEMO1.txt.partJ','2ef53f2b280bc549ba8215c69092b7b1b3f1c2fbb0c714b118d7db54cf581a88'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',21,'DEMO1.txt.partK','890a24022e2883eff0cb48fdd503771f43558f3482aa4979f2981871330e0e71'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',23,'DEMO1.txt.partL','7348b5b99880e89a510be60a4048385b62ea721e41d47723b29e6f9096ab5764'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',25,'DEMO1.txt.partM','5b2fc8574c079c9fba0998401120ef4e6d8422f55d2287cb6e75deb9b6a111e5'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',27,'DEMO1.txt.partN','f200972dff1a021285641766e67a476452fe2ece4458c3022370abad0c4aea01'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',29,'DEMO1.txt.partO','214411eb03f3d6f2f726c2fa902ea5b488443e0faf3a4340d8c5d0176c233d11'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',2,'DEMO1.txt.partP','2a52af5437abe195f9ea05c40aa8a891e848e1081e4cabdf4e30dfbab26c3c1a'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',4,'DEMO1.txt.partQ','7c4157a85759146b466bfbaaa03f83bdac1fe39434af7a14ce254e3f7e0abc3d'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',6,'DEMO1.txt.partR','a0f6d6c4276ec694ac9f39675fd304399bf47ba8fea6c594ad877a587ee10f42'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',8,'DEMO1.txt.partS','1b14f08f8e8329edc6cc6dd433404eb8848f28699cfe5cf1b89bc1fb9570cfd3'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',10,'DEMO1.txt.partT','876e869ff3a62bf9932299a5be6a06a12c0b61b6299800de4a46db734f00f373'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',12,'DEMO1.txt.partU','078f0c20dd5f7c04134701373bf148a24d223095c8f635774097f9be65b71ecf'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',14,'DEMO1.txt.partV','03e1435f2282fbe775ab90cbd45c80171c1889816496591aeff0b879bb4eec54'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',16,'DEMO1.txt.partW','50e84c486297f56694ec216bd5f3fbd2b28da3eab929fb1e28f3d45da586ae7f'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',18,'DEMO1.txt.partX','5ebb845b9e3c6d2063f899a531bbbbec829fca93f5f0784968541a4ff73a0f14'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',20,'DEMO1.txt.partY','95ae6986a55bb30b17b0226c03c990c2a3d8ba384dcd94c009b57066d82914a7'),('5fd39f48-e355-4bb4-b96e-952e11a12aaa',22,'DEMO1.txt.partZ','61d3cf0ec8f47a507a74a0a9c269cece73b4aef7a5dd374ef48b61a12dd44e10'),('4d38e167-8059-42fb-b80a-354d277e03a8',1,'DEMO1.txt.partA','4793fd03ea3b6e7cf9ee5fd224978a7c45e7d03e167e4afa4345e15b580b0b1f'),('4d38e167-8059-42fb-b80a-354d277e03a8',3,'DEMO1.txt.partB','084b96493f7d1a0979295d04d2c01dea591a485352e818d4945ea09a1ab21ce2'),('4d38e167-8059-42fb-b80a-354d277e03a8',5,'DEMO1.txt.partC','770d4197e3f9b941ffec06d5d8582ad73e0edbc2a3102c55877d19dc0b2d5e9f'),('4d38e167-8059-42fb-b80a-354d277e03a8',7,'DEMO1.txt.partD','bc8879caba4828dfeea2b8efbebb641cfa366023b2581cde7bbf254798ddd886'),('4d38e167-8059-42fb-b80a-354d277e03a8',9,'DEMO1.txt.partE','c00d8e481929ced19cd4555038c80502600e31dc45b6d3ec0bf9633c2be543e3'),('4d38e167-8059-42fb-b80a-354d277e03a8',11,'DEMO1.txt.partF','12f370fa27ff836152f6b3e8257146854573f390b8888e9186789bb7444dc885'),('4d38e167-8059-42fb-b80a-354d277e03a8',13,'DEMO1.txt.partG','8042f66b70e076b7f2e0d5ec9ea97d7f52cb8402398483a2d87d3197c758f9e4'),('4d38e167-8059-42fb-b80a-354d277e03a8',15,'DEMO1.txt.partH','d2d43442c80c6b1f4bc23cca11f56af5e058c31c07af93a803000d053adf27c6'),('4d38e167-8059-42fb-b80a-354d277e03a8',17,'DEMO1.txt.partI','3019c5803201bbe4e33f27629fdea575935c7b489ab579b889db30f55e50feec'),('4d38e167-8059-42fb-b80a-354d277e03a8',19,'DEMO1.txt.partJ','2ef53f2b280bc549ba8215c69092b7b1b3f1c2fbb0c714b118d7db54cf581a88'),('4d38e167-8059-42fb-b80a-354d277e03a8',21,'DEMO1.txt.partK','890a24022e2883eff0cb48fdd503771f43558f3482aa4979f2981871330e0e71'),('4d38e167-8059-42fb-b80a-354d277e03a8',23,'DEMO1.txt.partL','7348b5b99880e89a510be60a4048385b62ea721e41d47723b29e6f9096ab5764'),('4d38e167-8059-42fb-b80a-354d277e03a8',25,'DEMO1.txt.partM','5b2fc8574c079c9fba0998401120ef4e6d8422f55d2287cb6e75deb9b6a111e5'),('4d38e167-8059-42fb-b80a-354d277e03a8',27,'DEMO1.txt.partN','f200972dff1a021285641766e67a476452fe2ece4458c3022370abad0c4aea01'),('4d38e167-8059-42fb-b80a-354d277e03a8',29,'DEMO1.txt.partO','214411eb03f3d6f2f726c2fa902ea5b488443e0faf3a4340d8c5d0176c233d11'),('4d38e167-8059-42fb-b80a-354d277e03a8',2,'DEMO1.txt.partP','2a52af5437abe195f9ea05c40aa8a891e848e1081e4cabdf4e30dfbab26c3c1a'),('4d38e167-8059-42fb-b80a-354d277e03a8',4,'DEMO1.txt.partQ','7c4157a85759146b466bfbaaa03f83bdac1fe39434af7a14ce254e3f7e0abc3d'),('4d38e167-8059-42fb-b80a-354d277e03a8',6,'DEMO1.txt.partR','a0f6d6c4276ec694ac9f39675fd304399bf47ba8fea6c594ad877a587ee10f42'),('4d38e167-8059-42fb-b80a-354d277e03a8',8,'DEMO1.txt.partS','1b14f08f8e8329edc6cc6dd433404eb8848f28699cfe5cf1b89bc1fb9570cfd3'),('4d38e167-8059-42fb-b80a-354d277e03a8',10,'DEMO1.txt.partT','876e869ff3a62bf9932299a5be6a06a12c0b61b6299800de4a46db734f00f373'),('4d38e167-8059-42fb-b80a-354d277e03a8',12,'DEMO1.txt.partU','078f0c20dd5f7c04134701373bf148a24d223095c8f635774097f9be65b71ecf'),('4d38e167-8059-42fb-b80a-354d277e03a8',14,'DEMO1.txt.partV','03e1435f2282fbe775ab90cbd45c80171c1889816496591aeff0b879bb4eec54'),('4d38e167-8059-42fb-b80a-354d277e03a8',1,'DEMO2.txt.partW','829c381057e2e030c618d7ee17106bbbb0f3b3cbdf3ec5c5fa707f7d85843982'),('690fe3d8-ced8-4799-a1e2-d519db97cc20',1,'DEMO1.txt.partA','4793fd03ea3b6e7cf9ee5fd224978a7c45e7d03e167e4afa4345e15b580b0b1f'),('690fe3d8-ced8-4799-a1e2-d519db97cc20',3,'DEMO1.txt.partB','084b96493f7d1a0979295d04d2c01dea591a485352e818d4945ea09a1ab21ce2'),('690fe3d8-ced8-4799-a1e2-d519db97cc20',5,'DEMO1.txt.partC','770d4197e3f9b941ffec06d5d8582ad73e0edbc2a3102c55877d19dc0b2d5e9f'),('690fe3d8-ced8-4799-a1e2-d519db97cc20',7,'DEMO1.txt.partD','bc8879caba4828dfeea2b8efbebb641cfa366023b2581cde7bbf254798ddd886'),('690fe3d8-ced8-4799-a1e2-d519db97cc20',9,'DEMO1.txt.partE','c00d8e481929ced19cd4555038c80502600e31dc45b6d3ec0bf9633c2be543e3'),('690fe3d8-ced8-4799-a1e2-d519db97cc20',11,'DEMO1.txt.partF','12f370fa27ff836152f6b3e8257146854573f390b8888e9186789bb7444dc885'),('690fe3d8-ced8-4799-a1e2-d519db97cc20',1,'DEMO3.txt.partG','40c4869255c2b914b4fb3cdce43254b8b28e18fcec22c2f87fa6e448a55e579e'),('690fe3d8-ced8-4799-a1e2-d519db97cc20',3,'DEMO3.txt.partH','267567081631d62afac5626c85037e86cd08f33e7b7642915da9f85d3844483c'),('690fe3d8-ced8-4799-a1e2-d519db97cc20',5,'DEMO3.txt.partI','98ee4f8b4e610e9d21877992d9474f8f82b2d1fb6c97cd85136786695672950b'),('703d9407-4118-420d-aff8-7e888396bccf',1,'Eagriculture Fertilizer 20160726 1240.sql.partA','0f1185176b85c2eb5ccbe8a19d84f9dd4e4e3ee07e9a20365696f034cd2d7412'),('703d9407-4118-420d-aff8-7e888396bccf',3,'Eagriculture Fertilizer 20160726 1240.sql.partB','ec1bd5f4000449707cfb553520f7d51f9829f409f84d68793dac5d819cb58cd1'),('703d9407-4118-420d-aff8-7e888396bccf',5,'Eagriculture Fertilizer 20160726 1240.sql.partC','eebb63e77e5fa752857e7853728f5569afd5691c13454ba02cb76b847f3de529'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',1,'New Project 20160921 1643.sql.partA','5c8f4fa6cdbd73640ec1885cd613d65bc7057ae73d7f95ef7ded046d1a186204'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',3,'New Project 20160921 1643.sql.partB','ea7097fea0a7fbf749b047b49c317d16bde0fea402da8c3bbd626e0731dde865'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',5,'New Project 20160921 1643.sql.partC','3e76427df2a435c8724b67dc3b0f08a85df930edf0f0c08c37bc8664e1c89952'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',7,'New Project 20160921 1643.sql.partD','ba508cb11bd6a05e451e7967ca5bc5d45e6c456b69ff1dd6126486c2491ee202'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',9,'New Project 20160921 1643.sql.partE','8a3207d46693b746374598c3f15f962b66e0830c737c4cae44457a91c76b9d1a'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',11,'New Project 20160921 1643.sql.partF','377833d9864e19c126a0fd23e333e2e97aca3fa082f9e332dece4d98655e8fb5'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',13,'New Project 20160921 1643.sql.partG','1e832e392f00757c868f99a84daedcfae59851277cceea7547703ca0a3948526'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',15,'New Project 20160921 1643.sql.partH','b8fc1cab40dd1dbcbe0d076b358d2005b355b2ae88034215efcf8ca1066d1012'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',17,'New Project 20160921 1643.sql.partI','19337653874ce4e3e36c85c0ecf5393ebd6998a5d2c58cc97e77cff6f381a1ce'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',19,'New Project 20160921 1643.sql.partJ','261a0555cd59a79842586587f10f2389825b902744582e2f4b50147e0dbff68c'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',21,'New Project 20160921 1643.sql.partK','1dd4af2c2a95c570901ca5e9b45904a81a945c1490c375e252c5df71cfe89f3f'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',23,'New Project 20160921 1643.sql.partL','77c2e60a95e42b36e4f10462b09cd873ea5cbab44fdc8fe47f636db2230d2220'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',25,'New Project 20160921 1643.sql.partM','5b79e85466d5f93e3b6fba9f2e1ea796004e162ed5185b8b48d14dc2d46ca470'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',27,'New Project 20160921 1643.sql.partN','ff04d39fcc88d09108d7a0bf71fe42523cc7e5fe3b6bfffbc1c6d8a8336b8704'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',29,'New Project 20160921 1643.sql.partO','81304df8fe353716bc898bb5e9cf9e83b89d57cf78cb1d00392cd9439b0668c1'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',2,'New Project 20160921 1643.sql.partP','a309686b56a5bb014bc9a915941bfb75b3d4fa354cfd5a6c70c09c8889a6fc50'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',4,'New Project 20160921 1643.sql.partQ','b0c8d6bbd6984b4af3ef1ea885faec7b0b331342dddf3bbb6df438c6e05b0cb6'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',6,'New Project 20160921 1643.sql.partR','30c9536b965d49520976dbec7a34c23ef4a64ec13ddd3a19d58c69fab35a10be'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',8,'New Project 20160921 1643.sql.partS','1b34cf1dc65ebb5a89f38d58ac3a8f3d03f6731a003be0c5442f3ca9257674ff'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',10,'New Project 20160921 1643.sql.partT','deb3c9a9cf2fd0c84eeaa80f6dd6fdb21d6f7147c342da703af52e0eb8c541d8'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',12,'New Project 20160921 1643.sql.partU','cee38246777b760fbf8e39f25110114784dc1399056af5e865c440f582420c45'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',14,'New Project 20160921 1643.sql.partV','96f99aeabf22ebd656df42a183230a1684dcc04a16eb1b4b9e35db42c742b13d'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',16,'New Project 20160921 1643.sql.partW','5aef25328d2f0a6afa06ff551b354bfea84ddc729e0b7b7591f3f5619fd26489'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',18,'New Project 20160921 1643.sql.partX','367324536483ae7772cb5d02e31505e931f72bf48ff178b4faa72293019f1c8b'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',20,'New Project 20160921 1643.sql.partY','87525fda5436488e725ffda61a491919a797559fde18ba2fe0173e5716858ba2'),('ac4a3a6c-6626-4fc1-ae35-f71efea76582',22,'New Project 20160921 1643.sql.partZ','432f163a9df69ad093fe03a1f3375a605d5cd6f6d5179a74d04fa09f08cecefa');
/*!40000 ALTER TABLE `share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpa`
--

DROP TABLE IF EXISTS `tpa`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tpa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Contact` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tpa`
--

LOCK TABLES `tpa` WRITE;
/*!40000 ALTER TABLE `tpa` DISABLE KEYS */;
INSERT INTO `tpa` VALUES (2,'TPA','tpa@gmail.com ','Tpa123','8657976088');
/*!40000 ALTER TABLE `tpa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadingtime`
--

DROP TABLE IF EXISTS `uploadingtime`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `uploadingtime` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Filelength` int(15) unsigned NOT NULL,
  `Time` int(15) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `uploadingtime`
--

LOCK TABLES `uploadingtime` WRITE;
/*!40000 ALTER TABLE `uploadingtime` DISABLE KEYS */;
INSERT INTO `uploadingtime` VALUES (1,25990,3501),(2,22712,4299),(3,9111,1415),(4,2575,897),(5,26583,3989);
/*!40000 ALTER TABLE `uploadingtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Contact` varchar(45) NOT NULL,
  `groupname` varchar(45) NOT NULL,
  `groupid` varchar(45) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'sonali mitkari','sonalimitkari05@gmail.com','Sonali123','9890554312','Tiger','2'),(2,'Rudransh','rudra@gmail.com','Rudra123','9867542312','tiger','2'),(3,'manish','manu8520@gmail.com','Manoj@7588','9405277077','G1','1'),(4,'saudagar','saudu313@gmail.com','12345678SBas','9864554254','g1','1'),(5,'Dhiraj','d.navle95@gmail.com','Dhiraj123','9766340686','g1','1');
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

-- Dump completed on 2019-06-06 10:35:15
