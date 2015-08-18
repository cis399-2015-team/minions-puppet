-- MySQL dump
--
-- Minions Coffee database

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,MYSQL323' */;

--
--
CREATE DATABASE IF NOT EXISTS minionsdatabase;
USE minionsdatabase;


--
-- Definition of table 'employees'
--
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `ssn` int(9) NOT NULL,
  `fname` varchar(50) default NULL,
  `lname` varchar(50) default NULL,
  `shiftid` int(1) default 0,
  PRIMARY KEY  (`ssn`),
  UNIQUE KEY `ssn` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping test data for table 'employees'
--
LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (994990291,'Louise','Harris',1);
INSERT INTO `employees` VALUES (701209276,'Rose','Powell',1);
INSERT INTO `employees` VALUES (085182815,'Bob','Bailey',2);
INSERT INTO `employees` VALUES (577888416,'Russell','Saunders',2);
INSERT INTO `employees` VALUES (098960630,'Charlene','Salazar',3);
INSERT INTO `employees` VALUES (271994215,'Toni','Steele',3);
INSERT INTO `employees` VALUES (236511685,'Nichole','Price',3);
INSERT INTO `employees` VALUES (141667018,'Tommie','Bush',2);
INSERT INTO `employees` VALUES (323673189,'Taylor','Simpson',1);
INSERT INTO `employees` VALUES (784784409,'Rufina','Belanger',1);
INSERT INTO `employees` VALUES (946593017,'Patrick','Adam',3);
INSERT INTO `employees` VALUES (501130661,'Noelia','Bautista',3);
INSERT INTO `employees` VALUES (410412522,'Leena','Grimm',2);
INSERT INTO `employees` VALUES (441692776,'Cecil','Chester',1);
INSERT INTO `employees` VALUES (377961719,'Kaley','Johansen',3);
INSERT INTO `employees` VALUES (757078818,'Nobuko','Lusk',2);
INSERT INTO `employees` VALUES (255509528,'Velvet','Han',1);
INSERT INTO `employees` VALUES (095539674,'Elna','Cowles',3);
INSERT INTO `employees` VALUES (208620651,'Jung','Fierro',2);
INSERT INTO `employees` VALUES (892356422,'Quentin','Haag',2);
INSERT INTO `employees` VALUES (117749799,'Johnathon','Burris',1);
INSERT INTO `employees` VALUES (109852901,'Emilia','Canty',1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Definition of table 'managers'
--
DROP TABLE IF EXISTS `managers`;
CREATE TABLE `managers` (
  `ssn` int(9) NOT NULL,
  `fname` varchar(50) default NULL,
  `lname` varchar(50) default NULL,
  `shiftid` int(1) default 0,
  PRIMARY KEY  (`ssn`),
  UNIQUE KEY `ssn` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping test data for table 'managers'
--
LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES (721320329,'Evelyn','Fox',1);
INSERT INTO `managers` VALUES (036326439,'Craig','Weaver',1);
INSERT INTO `managers` VALUES (447294810,'Ian','Cortez',1);
INSERT INTO `managers` VALUES (824999226,'Eddie','Fields',2);
INSERT INTO `managers` VALUES (709652950,'Miriam','Oliver',2);
INSERT INTO `managers` VALUES (685145737,'Jan','Johnson',2);
INSERT INTO `managers` VALUES (494617745,'Brenda','Tran',3);
INSERT INTO `managers` VALUES (421785611,'Margarita','Nguyen',3);
INSERT INTO `managers` VALUES (434168026,'Lee','Parks',3);
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Definition of table 'payroll'
--
DROP TABLE IF EXISTS `payroll`;
CREATE TABLE `payroll` (
  `ssn` int(9) NOT NULL,
  `monthsworked` int(5) default 0,
  `wage` float(5) default 9.95,
  PRIMARY KEY (`ssn`),
  UNIQUE KEY `ssn` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping test data for table 'payroll'
--
LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES (721320329,15,12.00);
INSERT INTO `payroll` VALUES (036326439,15,12.00);
INSERT INTO `payroll` VALUES (447294810,12,11.50);
INSERT INTO `payroll` VALUES (824999226,11,11.00);
INSERT INTO `payroll` VALUES (709652950,9,10.00);
INSERT INTO `payroll` VALUES (685145737,10,10.00);
INSERT INTO `payroll` VALUES (494617745,10,10.00);
INSERT INTO `payroll` VALUES (421785611,13,11.50);
INSERT INTO `payroll` VALUES (434168026,14,11.50);
INSERT INTO `payroll` VALUES (994990291,6,10.50);
INSERT INTO `payroll` VALUES (701209276,14,11.00);
INSERT INTO `payroll` VALUES (085182815,14,11.00);
INSERT INTO `payroll` VALUES (577888416,12,10.50);
INSERT INTO `payroll` VALUES (098960630,10,10.50);
INSERT INTO `payroll` VALUES (271994215,5,9.95);
INSERT INTO `payroll` VALUES (236511685,7,10.50);
INSERT INTO `payroll` VALUES (141667018,7,10.50);
INSERT INTO `payroll` VALUES (323673189,3,9.95);
INSERT INTO `payroll` VALUES (784784409,2,9.95);
INSERT INTO `payroll` VALUES (946593017,2,9.95);
INSERT INTO `payroll` VALUES (501130661,0,9.95);
INSERT INTO `payroll` VALUES (410412522,8,10.50);
INSERT INTO `payroll` VALUES (441692776,12,10.50);
INSERT INTO `payroll` VALUES (377961719,15,11.00);
INSERT INTO `payroll` VALUES (757078818,6,10.50);
INSERT INTO `payroll` VALUES (255509528,1,9.95);
INSERT INTO `payroll` VALUES (095539674,5,9.95);
INSERT INTO `payroll` VALUES (208620651,4,9.95);
INSERT INTO `payroll` VALUES (892356422,1,9.95);
INSERT INTO `payroll` VALUES (117749799,1,9.95);
INSERT INTO `payroll` VALUES (109852901,0,9.95);
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Definition of table 'allitems'
--
DROP TABLE IF EXISTS `allitems`;
CREATE TABLE `allitems` (
    `item_num` int(4) NOT NULL AUTO_INCREMENT,
    `item_name` varchar(50) default NULL,
    `description` text,
    PRIMARY KEY (`item_num`),
    UNIQUE KEY `item_num` (`item_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping test data for table 'allitems'
--
LOCK TABLES `allitems` WRITE;
/*!40000 ALTER TABLE `allitems` DISABLE KEYS */;
INSERT INTO `allitems` (item_name,description) VALUES ('French Roast', 'A Bold Flavored Bean');
INSERT INTO `allitems` (item_name,description) VALUES ('Medium Roast Blend', 'A Rich Flavored Coffee');
INSERT INTO `allitems` (item_name,description) VALUES ('Coffee Mug', 'White with black lettering');
INSERT INTO `allitems` (item_name,description) VALUES ('T Shirt', 'Tan with black lettering reading: Brewed Awakening');
INSERT INTO `allitems` (item_name,description) VALUES ('Italian Roast','Aromatic and Bold');
INSERT INTO `allitems` (item_name,description) VALUES ('Bright and Shining','More caffeine and a light taste');
INSERT INTO `allitems` (item_name,description) VALUES ('Daily Grind','Our house blend');
INSERT INTO `allitems` (item_name,description) VALUES ('Black Ops','Dark and Rich, if you like it black - this is it');
INSERT INTO `allitems` (item_name,description) VALUES ('Perky Peruvian','A blend of several Peruvian beans and roasts');
INSERT INTO `allitems` (item_name,description) VALUES ('Butter Roast','coated with oil and sugar - traditional Vietnamese roast');
INSERT INTO `allitems` (item_name,description) VALUES ('Vietnam Blend','A blend of several Vietnamese beans and roasts');
INSERT INTO `allitems` (item_name,description) VALUES ('Medium Blend','Robust and good hot or cold');
INSERT INTO `allitems` (item_name,description) VALUES ('Turkish Delight','A proper Turkish blend');
INSERT INTO `allitems` (item_name,description) VALUES ('Cups','Cups for Customer Use');
INSERT INTO `allitems` (item_name,description) VALUES ('Plates','Plates for Customer Use');
INSERT INTO `allitems` (item_name,description) VALUES ('Utensils','Utensils for Customer Use');
INSERT INTO `allitems` (item_name,description) VALUES ('Travel Mug', 'Green, Brown, White Travel Mug');
/*!40000 ALTER TABLE `allitems` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Definition of table 'roasts'
--
DROP TABLE IF EXISTS `roasts`;
CREATE TABLE `roasts` (
    `item_num` int(4) NOT NULL,
    `roast_name` varchar(50) default NULL,
    `roaster_name` varchar(50) default NULL,
    `roast_type` varchar(6) default NULL,
    `origin` varchar(50) default NULL,
    `description` text,
    PRIMARY KEY (`item_num`),
    UNIQUE KEY `item_num` (`item_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping test data for table 'roasts'
--
LOCK TABLES `roasts` WRITE;
/*!40000 ALTER TABLE `roasts` DISABLE KEYS */;
INSERT INTO `roasts` VALUES (1,'French Roast','Big City Roasters','dark', 'Columbia', 'A Bold Bean');
INSERT INTO `roasts` VALUES (2,'Medium Roast Blend','Big City Roasters','medium', 'Columbia', 'A Rich Flavored Coffee');
INSERT INTO `roasts` VALUES (5,'Italian Roast','Big City Roasters','medium', 'Columbia', 'Aromatic and Bold');
INSERT INTO `roasts` VALUES (6,'Bright and Shining','Brewed Awakening','light', 'Brazil', 'More caffeine and a light taste');
INSERT INTO `roasts` VALUES (7,'Daily Grind','Brewed Awakening','medium', 'Brazil', 'Our house blend');
INSERT INTO `roasts` VALUES (9,'Perky Peruvian','Brewed Awakening','dark', 'Peru', 'A blend of several Peruvian beans and roasts');
INSERT INTO `roasts` VALUES (10,'Butter Roast','Hot Pot','light', 'Vietnam', 'coated with oil and sugar - traditional Vietnamese roast');
INSERT INTO `roasts` VALUES (11,'Vietnam Blend','Hot Pot','medium', 'Vietnam', 'A blend of several Vietnamese beans and roasts');
INSERT INTO `roasts` VALUES (12,'Medium Blend','Cafe Ole','medium', 'Brazil', 'Robust and good hot or cold');
INSERT INTO `roasts` VALUES (13,'Turkish Delight','Cafe Ole','Light', 'Ethiopia', 'A proper Turkish blend');
/*!40000 ALTER TABLE `roasts` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Definition of table 'storeinv'
--
DROP TABLE IF EXISTS `storeinv`;
CREATE TABLE `storeinv` (
    `item_num` int(4) NOT NULL,
    `item_name` varchar(50) default NULL,
    `quantity` int(4) default 0,
    `price` int(4) default 0,
    PRIMARY KEY (`item_num`),
    UNIQUE KEY `item_num` (`item_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping test data for table 'storeinv'
--
LOCK TABLES `storeinv` WRITE;
/*!40000 ALTER TABLE `storeinv` DISABLE KEYS */;
INSERT INTO `storeinv` VALUES (1,'French Roast',60,7);
INSERT INTO `storeinv` VALUES (2,'Medium Roast Blend',60,7);
INSERT INTO `storeinv` VALUES (5,'Italian Roast',50,7);
INSERT INTO `storeinv` VALUES (6,'Bright and Shining',30,7);
INSERT INTO `storeinv` VALUES (7,'Daily Grind',20,7);
INSERT INTO `storeinv` VALUES (8,'Black Ops',35,7);
INSERT INTO `storeinv` VALUES (9,'Perky Peruvian',40,8);
INSERT INTO `storeinv` VALUES (10,'Butter Roast',15,10);
INSERT INTO `storeinv` VALUES (11,'Vietnam Blend',20,8);
INSERT INTO `storeinv` VALUES (12,'Medium Blend',13,6);
INSERT INTO `storeinv` VALUES (13,'Turkish Delight',20,9);
INSERT INTO `storeinv` VALUES (14,'Cups',200,NULL);
INSERT INTO `storeinv` VALUES (15,'Plates',200,NULL);
INSERT INTO `storeinv` VALUES (16,'Utensils',600,NULL);
/*!40000 ALTER TABLE `storeinv` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Definition of table 'onlineinv'
--
DROP TABLE IF EXISTS `onlineinv`;
CREATE TABLE `onlineinv` (
    `item_num` int(4) NOT NULL,
    `item_name` varchar(50) default NULL,
    `quantity` int(4) default 0,
    `price` int(4) default 0,
    PRIMARY KEY (`item_num`),
    UNIQUE KEY `item_num` (`item_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping test data for table 'onlineinv'
--
LOCK TABLES `onlineinv` WRITE;
/*!40000 ALTER TABLE `onlineinv` DISABLE KEYS */;
INSERT INTO `onlineinv` VALUES (1,'French Roast',20,7);
INSERT INTO `onlineinv` VALUES (2,'Medium Roast Blend',20,7);
INSERT INTO `onlineinv` VALUES (3,'Coffee Mug',20,5);
INSERT INTO `onlineinv` VALUES (4,'T Shirt',10,20);
INSERT INTO `onlineinv` VALUES (5,'Italian Roast',50,7);
INSERT INTO `onlineinv` VALUES (6,'Bright and Shining',30,7);
INSERT INTO `onlineinv` VALUES (7,'Daily Grind',20,7);
INSERT INTO `onlineinv` VALUES (8,'Black Ops',35,7);
INSERT INTO `onlineinv` VALUES (9,'Perky Peruvian',40,8);
INSERT INTO `onlineinv` VALUES (10,'Butter Roast',15,10);
INSERT INTO `onlineinv` VALUES (11,'Vietnam Blend',20,8);
INSERT INTO `onlineinv` VALUES (12,'Medium Blend',13,6);
INSERT INTO `onlineinv` VALUES (13,'Turkish Delight',20,9);
INSERT INTO `onlineinv` VALUES (17,'Travel Mug',20,12);
/*!40000 ALTER TABLE `onlineinv` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Definition of table 'customers'
--
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
    `customer_num` int(9) NOT NULL auto_increment,
    `fname` char(15) default NULL,
    `lname` char(15) default NULL,
    `address1` char(20) default NULL,
    `address2` char(20) default NULL,
    `city` char(15) default NULL,
    `state` char(2) default NULL,
    `zipcode` char(5) default NULL,
    PRIMARY KEY (`customer_num`),
    UNIQUE KEY `customer_num` (`customer_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping test data for table 'customers'
--
LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (fname,lname,address1,address2,city,state,zipcode) VALUES ('Carter','Cartson','9251 Amber Sky Pointe.','Apt #40','Wokodot','WA','89562');
INSERT INTO `customers` (fname,lname,address1,address2,city,state,zipcode) VALUES ('Barter','Bartson','9112 Blue Robin Grounds.','','Pontiac','VA','20101');
INSERT INTO `customers` (fname,lname,address1,address2,city,state,zipcode) VALUES ('Leonard','Smith','747 Noble Pathway','','Hitchapukasse','OR','97001');
INSERT INTO `customers` (fname,lname,address1,address2,city,state,zipcode) VALUES ('Elizabeth','Wells','140 Sleepy Run','','Woolmarket','UT','65485');
INSERT INTO `customers` (fname,lname,address1,address2,city,state,zipcode) VALUES ('Beulah','Burns','4705 Shady Turnabout','','Mud Castle','WA','98102');
INSERT INTO `customers` (fname,lname,address1,address2,city,state,zipcode) VALUES ('Katherine','Estrada','7100 Blue Forest Route','','Convent','WA','98101');
INSERT INTO `customers` (fname,lname,address1,address2,city,state,zipcode) VALUES ('Rosemarie','Harmon','2824 Hazy Diversion','','Old House','OR','97015');
INSERT INTO `customers` (fname,lname,address1,address2,city,state,zipcode) VALUES ('Leeroy','Jenkins','8346 Umber Range','','Squirrel','OR','97455');
INSERT INTO `customers` (fname,lname,address1,address2,city,state,zipcode) VALUES ('Ted','Casey','87 Broad Manor','','Portland','OR','97035');
INSERT INTO `customers` (fname,lname,address1,address2,city,state,zipcode) VALUES ('Violet','Peters','346 Sunny Isle','','Seattle','WA','98108');
INSERT INTO `customers` (fname,lname,address1,address2,city,state,zipcode) VALUES ('Hugh','Little','9107 Little Beacon Pike','','Beverly Hills','CA','90210');
INSERT INTO `customers` (fname,lname,address1,address2,city,state,zipcode) VALUES ('Calvin','Greer','659 Dewy Nectar Canyon','','Cheektowasa','CA','90004');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Definition of table 'orders'
--
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
    `order_num` int(9) NOT NULL auto_increment,
    `order_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `customer_num` int(9) NOT NULL,
    `ship_charge` float(5) default 0,
    `ship_date` DATE DEFAULT NULL,
    PRIMARY KEY (`order_num`),
    UNIQUE KEY `order_num` (`order_num`),
    KEY `customer_num` (`customer_num`),
    CONSTRAINT `customer_num` FOREIGN KEY (`customer_num`) REFERENCES `customers` (`customer_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping test data for table 'orders'
--
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
LOCK TABLES `orders` WRITE;
INSERT INTO `orders` (order_date,customer_num,ship_charge,ship_date) VALUES ('2014-5-1',1,5.95,'2014-5-10');
INSERT INTO `orders` (order_date,customer_num,ship_charge,ship_date) VALUES ('2014-6-12',2,5.95,'2014-6-16');
INSERT INTO `orders` (order_date,customer_num,ship_charge,ship_date) VALUES ('2014-6-20',3,5.95,'2014-6-25');
INSERT INTO `orders` (order_date,customer_num,ship_charge,ship_date) VALUES ('2014-7-3',4,5.95,'2014-7-6');
INSERT INTO `orders` (order_date,customer_num,ship_charge,ship_date) VALUES ('2014-7-4',5,5.95,'2014-7-6');
INSERT INTO `orders` (order_date,customer_num,ship_charge,ship_date) VALUES ('2014-8-18',6,5.95,'2014-8-22');
INSERT INTO `orders` (order_date,customer_num,ship_charge,ship_date) VALUES ('2014-8-18',7,5.95,'2014-8-22');
INSERT INTO `orders` (order_date,customer_num,ship_charge,ship_date) VALUES ('2014-9-19',8,5.95,'2014-9-23');
INSERT INTO `orders` (order_date,customer_num,ship_charge,ship_date) VALUES ('2014-10-3',9,5.95,'2014-10-7');
INSERT INTO `orders` (order_date,customer_num,ship_charge,ship_date) VALUES ('2014-11-8',10,5.95,'2014-11-12');
INSERT INTO `orders` (order_date,customer_num,ship_charge,ship_date) VALUES ('2014-12-1',11,5.95,'2014-12-5');
INSERT INTO `orders` (order_date,customer_num,ship_charge,ship_date) VALUES ('2014-12-1',12,5.95,'2014-12-10');
UNLOCK TABLES;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


-- That should be it

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;