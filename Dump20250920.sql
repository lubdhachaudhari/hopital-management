-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_db2
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `AppointmentID` int NOT NULL AUTO_INCREMENT,
  `PatientID` int NOT NULL,
  `DoctorID` int NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Mode` enum('Offline','Online') DEFAULT 'Offline',
  PRIMARY KEY (`AppointmentID`),
  KEY `fk_appointment_patient` (`PatientID`),
  KEY `fk_appointment_doctor` (`DoctorID`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON DELETE CASCADE,
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`) ON DELETE CASCADE,
  CONSTRAINT `fk_appointment_doctor` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`),
  CONSTRAINT `fk_appointment_patient` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,1,1,'2025-09-17','10:00:00','Confirmed','Offline'),(2,2,2,'2025-09-17','11:00:00','Confirmed','Online'),(3,3,3,'2025-09-17','12:00:00','Pending','Offline'),(4,4,4,'2025-09-17','13:00:00','Confirmed','Offline'),(5,5,5,'2025-09-18','09:30:00','Pending','Online'),(6,6,6,'2025-09-18','10:30:00','Confirmed','Offline'),(7,7,7,'2025-09-18','11:30:00','Confirmed','Offline'),(8,8,8,'2025-09-18','12:30:00','Pending','Online'),(9,9,9,'2025-09-19','10:00:00','Confirmed','Offline'),(10,10,10,'2025-09-19','11:00:00','Confirmed','Online'),(11,11,1,'2025-09-19','12:00:00','Pending','Offline'),(12,12,2,'2025-09-19','13:00:00','Confirmed','Offline'),(13,13,3,'2025-09-20','09:00:00','Pending','Online'),(14,14,4,'2025-09-20','10:00:00','Confirmed','Offline'),(15,15,5,'2025-09-20','11:00:00','Confirmed','Offline'),(16,16,6,'2025-09-20','12:00:00','Pending','Online'),(17,17,7,'2025-09-21','10:30:00','Confirmed','Offline'),(18,18,8,'2025-09-21','11:30:00','Confirmed','Offline'),(19,19,9,'2025-09-21','12:30:00','Pending','Online'),(20,20,10,'2025-09-21','13:30:00','Confirmed','Offline');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `DoctorID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Specialization` varchar(100) DEFAULT NULL,
  `Degree` varchar(100) DEFAULT NULL,
  `Experience` int DEFAULT NULL,
  `Contact` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Availability` varchar(100) DEFAULT NULL,
  `Fees` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Dr. Arjun Mehta','Cardiology','MBBS, MD',10,'9876543210','arjun.mehta@hospital.com','Mon-Fri 9AM-5PM',800.00),(2,'Dr. Priya Sharma','Dermatology','MBBS, MD',8,'9876543211','priya.sharma@hospital.com','Mon-Sat 10AM-4PM',600.00),(3,'Dr. Rohan Iyer','Orthopedics','MBBS, MS',12,'9876543212','rohan.iyer@hospital.com','Tue-Fri 11AM-6PM',700.00),(4,'Dr. Kavita Desai','Pediatrics','MBBS, DCH',6,'9876543213','kavita.desai@hospital.com','Mon-Sat 9AM-2PM',500.00),(5,'Dr. Amit Joshi','General Medicine','MBBS',15,'9876543214','amit.joshi@hospital.com','Mon-Fri 9AM-3PM',400.00),(6,'Dr. Sneha Kapoor','Gynecology','MBBS, MD',9,'9876543215','sneha.kapoor@hospital.com','Mon-Sat 10AM-5PM',750.00),(7,'Dr. Varun Sethi','Neurology','MBBS, DM',11,'9876543216','varun.sethi@hospital.com','Wed-Sat 1PM-6PM',950.00),(8,'Dr. Meera Nair','Ophthalmology','MBBS, MS',5,'9876543217','meera.nair@hospital.com','Mon-Fri 9AM-1PM',550.00),(9,'Dr. Rajat Khanna','Psychiatry','MBBS, MD',7,'9876543218','rajat.khanna@hospital.com','Tue-Sat 10AM-4PM',650.00),(10,'Dr. Sunita Reddy','ENT','MBBS, MS',8,'9876543219','sunita.reddy@hospital.com','Mon-Wed 9AM-3PM',600.00),(11,'Dr. Vivek Saxena','Pulmonology','MBBS, MD',10,'9876543220','vivek.saxena@hospital.com','Mon-Fri 11AM-4PM',700.00),(12,'Dr. Alka Bhatia','Oncology','MBBS, DM',14,'9876543221','alka.bhatia@hospital.com','Mon-Thu 12PM-5PM',1200.00),(13,'Dr. Kiran Malhotra','Endocrinology','MBBS, MD',9,'9876543222','kiran.malhotra@hospital.com','Tue-Fri 9AM-12PM',850.00),(14,'Dr. Aditya Sen','Urology','MBBS, MS',7,'9876543223','aditya.sen@hospital.com','Mon-Fri 10AM-3PM',600.00),(15,'Dr. Neha Patil','Rheumatology','MBBS, MD',6,'9876543224','neha.patil@hospital.com','Tue-Sat 2PM-6PM',650.00),(16,'Dr. Suresh Pawar','Gastroenterology','MBBS, DM',13,'9876543225','suresh.pawar@hospital.com','Mon-Wed 9AM-2PM',1100.00),(17,'Dr. Tanya Kulkarni','Hematology','MBBS, MD',5,'9876543226','tanya.kulkarni@hospital.com','Mon-Fri 11AM-5PM',500.00),(18,'Dr. Manish Jadhav','Plastic Surgery','MBBS, MS',11,'9876543227','manish.jadhav@hospital.com','Wed-Sat 1PM-6PM',900.00),(19,'Dr. Shruti Menon','Nephrology','MBBS, DM',8,'9876543228','shruti.menon@hospital.com','Mon-Fri 9AM-12PM',750.00),(20,'Dr. Anil Rao','Dentistry','BDS, MDS',10,'9876543229','anil.rao@hospital.com','Mon-Sat 10AM-5PM',400.00);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalhistory`
--

DROP TABLE IF EXISTS `medicalhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalhistory` (
  `HistoryID` int NOT NULL AUTO_INCREMENT,
  `PatientID` int NOT NULL,
  `Diagnosis` varchar(255) DEFAULT NULL,
  `Treatment` varchar(255) DEFAULT NULL,
  `Notes` text,
  `Date` date NOT NULL,
  PRIMARY KEY (`HistoryID`),
  KEY `fk_medicalhistory_patient` (`PatientID`),
  CONSTRAINT `fk_medicalhistory_patient` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`),
  CONSTRAINT `medicalhistory_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalhistory`
--

LOCK TABLES `medicalhistory` WRITE;
/*!40000 ALTER TABLE `medicalhistory` DISABLE KEYS */;
INSERT INTO `medicalhistory` VALUES (1,1,'Hypertension','Lifestyle modification','Patient advised to reduce salt intake','2025-09-01'),(2,2,'Dermatitis','Topical cream','Check again after 2 weeks','2025-09-02'),(3,3,'Fracture','Cast applied','Follow-up in 1 month','2025-09-03'),(4,4,'Asthma','Inhaler prescribed','Monitor peak flow daily','2025-09-04'),(5,5,'Diabetes','Metformin 500mg','Dietary counseling done','2025-09-05'),(6,6,'PCOD','Hormonal therapy','Routine ultrasound','2025-09-06'),(7,7,'Migraine','Pain relievers','Maintain headache diary','2025-09-07'),(8,8,'Eye infection','Antibiotic drops','Avoid touching eyes','2025-09-08'),(9,9,'Anxiety disorder','Counseling','Start CBT sessions','2025-09-09'),(10,10,'Allergic rhinitis','Antihistamines','Environmental control','2025-09-10'),(11,11,'Bronchitis','Antibiotics','Increase fluid intake','2025-09-11'),(12,12,'Breast lump','Ultrasound scheduled','Monitor for changes','2025-09-12'),(13,13,'Thyroid disorder','Levothyroxine','Regular TSH test','2025-09-13'),(14,14,'Kidney stones','Increased hydration','Consider surgery','2025-09-14'),(15,15,'Joint pain','NSAIDs','Physical therapy','2025-09-15'),(16,16,'Gastric ulcer','PPIs','Avoid spicy food','2025-09-16'),(17,17,'Anemia','Iron supplements','Dietary advice given','2025-09-17'),(18,18,'Blood disorder','Hematology consult','Further tests required','2025-09-18'),(19,19,'Kidney disease','Dialysis planned','Monitor creatinine','2025-09-19'),(20,20,'Dental caries','Filling done','Oral hygiene advised','2025-09-20');
/*!40000 ALTER TABLE `medicalhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `PatientID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Gender` enum('M','F','Other') DEFAULT NULL,
  `Contact` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `BloodGroup` varchar(10) DEFAULT NULL,
  `EmergencyContact` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`PatientID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Amit Sharma','1990-05-15','M','9812345671','amit.sharma@mail.com','Delhi','O+','9876500011'),(2,'Priya Verma','1992-08-20','F','9812345672','priya.verma@mail.com','Mumbai','A+','9876500012'),(3,'Rahul Gupta','1985-12-05','M','9812345673','rahul.gupta@mail.com','Bangalore','B+','9876500013'),(4,'Sneha Iyer','1993-07-09','F','9812345674','sneha.iyer@mail.com','Hyderabad','AB+','9876500014'),(5,'Karan Mehta','1991-03-12','M','9812345675','karan.mehta@mail.com','Chennai','O-','9876500015'),(6,'Anjali Singh','1994-11-02','F','9812345676','anjali.singh@mail.com','Pune','A-','9876500016'),(7,'Ravi Patel','1988-01-30','M','9812345677','ravi.patel@mail.com','Ahmedabad','B-','9876500017'),(8,'Meera Joshi','1995-09-25','F','9812345678','meera.joshi@mail.com','Kolkata','O+','9876500018'),(9,'Arjun Nair','1987-06-17','M','9812345679','arjun.nair@mail.com','Jaipur','A+','9876500019'),(10,'Divya Kapoor','1993-10-10','F','9812345680','divya.kapoor@mail.com','Lucknow','AB-','9876500020'),(11,'Vikas Reddy','1989-02-11','M','9812345681','vikas.reddy@mail.com','Delhi','B+','9876500021'),(12,'Shreya Bansal','1996-04-22','F','9812345682','shreya.bansal@mail.com','Mumbai','O+','9876500022'),(13,'Manish Kulkarni','1990-08-08','M','9812345683','manish.kulkarni@mail.com','Bangalore','A+','9876500023'),(14,'Pooja Chauhan','1995-12-13','F','9812345684','pooja.chauhan@mail.com','Hyderabad','B+','9876500024'),(15,'Siddharth Desai','1986-05-06','M','9812345685','siddharth.desai@mail.com','Chennai','O-','9876500025'),(16,'Gaurav Jadhav','1989-01-25','M','9812345686','gaurav.jadhav@mail.com','Mumbai','O+','9876500026'),(17,'Isha Menon','1994-07-19','F','9812345687','isha.menon@mail.com','Bangalore','AB-','9876500027'),(18,'Karan Sethi','1990-04-04','M','9812345688','karan.sethi@mail.com','Hyderabad','B+','9876500028'),(19,'Megha Rao','1996-03-20','F','9812345689','megha.rao@mail.com','Chennai','O+','9876500029'),(20,'Rohan Khanna','1992-09-29','M','9812345690','rohan.khanna@mail.com','Delhi','A+','9876500030');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','doctor','patient') NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin One','admin1@hospital.com','adminpass1','admin'),(2,'Admin Two','admin2@hospital.com','adminpass2','admin'),(3,'Dr. Amit Sharma','amit.sharma@hospital.com','docpass1','doctor'),(4,'Dr. Priya Verma','priya.verma@hospital.com','docpass2','doctor'),(5,'Dr. Rahul Gupta','rahul.gupta@hospital.com','docpass3','doctor'),(6,'Dr. Sneha Iyer','sneha.iyer@hospital.com','docpass4','doctor'),(7,'Dr. Karan Mehta','karan.mehta@hospital.com','docpass5','doctor'),(8,'Ravi Patel','ravi.patel@mail.com','patientpass1','patient'),(9,'Meera Joshi','meera.joshi@mail.com','patientpass2','patient'),(10,'Arjun Nair','arjun.nair@mail.com','patientpass3','patient'),(11,'Divya Kapoor','divya.kapoor@mail.com','patientpass4','patient'),(12,'Vikas Reddy','vikas.reddy@mail.com','patientpass5','patient');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-20 23:54:35
