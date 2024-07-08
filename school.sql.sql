-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Време на генериране:  7 юли 2024 в 18:08
-- Версия на сървъра: 10.4.27-MariaDB
-- Версия на PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данни: `school`
-- CREATE DATABASE school;
-- USE school;

-- --------------------------------------------------------

--
-- Структура на таблица `addresses`
--

CREATE TABLE `addresses` (
  `AddressID` int(11) NOT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `addresses`
--

INSERT INTO `addresses` (`AddressID`, `Street`, `City`, `State`, `ZipCode`) VALUES
(1, 'Main St', 'Sofia', 'Sofia', '1000'),
(2, 'Second St', 'Plovdiv', 'Plovdiv', '4000'),
(3, 'Third St', 'Varna', 'Varna', '9000'),
(4, 'Fourth St', 'Burgas', 'Burgas', '8000'),
(5, 'Fifth St', 'Ruse', 'Ruse', '7000'),
(6, 'Sixth St', 'Pleven', 'Pleven', '5800'),
(7, 'Seventh St', 'Stara Zagora', 'Stara Zagora', '6000'),
(8, 'Eighth St', 'Blagoevgrad', 'Blagoevgrad', '2700'),
(9, 'Ninth St', 'Pazardzhik', 'Pazardzhik', '4400'),
(10, 'Tenth St', 'Gabrovo', 'Gabrovo', '5300'),
(11, 'Main St', 'Sofia', 'Sofia', '1000'),
(12, 'Main St', 'Sofia', 'Sofia', '1000'),
(13, 'Main St', 'Sofia', 'Sofia', '1000'),
(14, 'Main St', 'Sofia', 'Sofia', '1000');

-- --------------------------------------------------------

--
-- Структура на таблица `classes`
--

CREATE TABLE `classes` (
  `ClassID` int(11) NOT NULL,
  `ClassName` varchar(50) DEFAULT NULL,
  `TeacherID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `classes`
--

INSERT INTO `classes` (`ClassID`, `ClassName`, `TeacherID`) VALUES
(1, '10A', 1),
(2, '10B', 2),
(3, '11A', 3),
(4, '11B', 4),
(5, '12A', 5),
(6, '12B', 6),
(7, '11C', 7),
(8, '10C', 8),
(9, '9A', 9),
(10, '9B', 10),
(11, '10A', 11),
(12, '10A', 12);

-- --------------------------------------------------------

--
-- Структура на таблица `courses`
--

CREATE TABLE `courses` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `courses`
--

INSERT INTO `courses` (`CourseID`, `CourseName`) VALUES
(1, 'Math 101'),
(2, 'Science 101'),
(3, 'History 101'),
(4, 'Geography 101'),
(5, 'Physics 101'),
(6, 'Chemistry 101'),
(7, 'Biology 101'),
(8, 'Literature 101'),
(9, 'Physical Education 101'),
(10, 'Music 101');

-- --------------------------------------------------------

--
-- Структура на таблица `studentcourses`
--

CREATE TABLE `studentcourses` (
  `StudentID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `studentcourses`
--

INSERT INTO `studentcourses` (`StudentID`, `CourseID`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 2),
(5, 3),
(5, 4),
(6, 1),
(6, 5),
(7, 2),
(7, 3),
(8, 1),
(8, 4),
(9, 2),
(9, 3),
(10, 4),
(10, 5),
(11, 1),
(11, 6),
(12, 2),
(12, 7),
(13, 3),
(13, 8),
(14, 4),
(14, 9),
(15, 5),
(15, 10),
(16, 2),
(16, 6),
(17, 3),
(17, 7),
(18, 4),
(18, 8),
(19, 5),
(19, 9),
(20, 1),
(20, 10);

-- --------------------------------------------------------

--
-- Структура на таблица `students`
--

CREATE TABLE `students` (
  `StudentID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `AddressID` int(11) DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `students`
--

INSERT INTO `students` (`StudentID`, `FirstName`, `LastName`, `AddressID`, `ClassID`, `DateOfBirth`) VALUES
(1, 'John', 'Smith', 1, 1, '2005-01-01'),
(2, 'Jane', 'Smith', 2, 2, '2006-02-02'),
(3, 'Alice', 'Johnson', 3, 3, '2005-03-03'),
(4, 'Bob', 'Brown', 4, 4, '2006-04-04'),
(5, 'Charlie', 'Davis', 5, 5, '2005-05-05'),
(6, 'David', 'White', 1, 1, '2006-06-06'),
(7, 'Emma', 'Harris', 2, 2, '2005-07-07'),
(8, 'Olivia', 'Martinez', 3, 3, '2006-08-08'),
(9, 'Sophia', 'Garcia', 4, 4, '2005-09-09'),
(10, 'Lucas', 'Clark', 5, 5, '2006-10-10'),
(11, 'Michael', 'Jordan', 6, 6, '2005-12-01'),
(12, 'Sarah', 'Connor', 7, 7, '2006-11-15'),
(13, 'Bruce', 'Wayne', 8, 8, '2005-10-30'),
(14, 'Clark', 'Kent', 9, 9, '2006-09-25'),
(15, 'Diana', 'Prince', 10, 10, '2005-08-20'),
(16, 'Peter', 'Parker', 6, 6, '2006-07-18'),
(17, 'Tony', 'Stark', 7, 7, '2005-06-17'),
(18, 'Natasha', 'Romanoff', 8, 8, '2006-05-16'),
(19, 'Steve', 'Rogers', 9, 9, '2005-04-15'),
(20, 'Thor', 'Odinson', 10, 10, '2006-03-14'),
(21, 'Liam', 'Taylor', 1, 1, '2005-02-12'),
(22, 'Emma', 'Wilson', 2, 2, '2006-03-23'),
(23, 'Olivia', 'Moore', 3, 3, '2005-04-14'),
(24, 'Noah', 'Jackson', 4, 4, '2006-05-25'),
(25, 'Ava', 'Martin', 5, 5, '2005-06-16'),
(26, 'Isabella', 'Lee', 6, 6, '2006-07-27'),
(27, 'Sophia', 'Perez', 7, 7, '2005-08-18'),
(28, 'Mason', 'Thompson', 8, 8, '2006-09-29'),
(29, 'Ethan', 'White', 9, 9, '2005-10-20'),
(30, 'Mia', 'Harris', 10, 10, '2006-11-01'),
(33, 'John', 'Doe', 1, 1, '2000-01-01');

-- --------------------------------------------------------

--
-- Структура на таблица `teachers`
--

CREATE TABLE `teachers` (
  `TeacherID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `AddressID` int(11) DEFAULT NULL,
  `Subject` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `teachers`
--

INSERT INTO `teachers` (`TeacherID`, `FirstName`, `LastName`, `AddressID`, `Subject`) VALUES
(1, 'Ivan', 'Ivanov', 1, 'Math'),
(2, 'Petar', 'Petrov', 2, 'Science'),
(3, 'Georgi', 'Georgiev', 3, 'History'),
(4, 'Maria', 'Marinova', 4, 'Geography'),
(5, 'Elena', 'Elena', 5, 'Physics'),
(6, 'Dimitar', 'Dimitrov', 6, 'Chemistry'),
(7, 'Nikolay', 'Nikolov', 7, 'Biology'),
(8, 'Vasil', 'Vasilev', 8, 'Literature'),
(9, 'Stefan', 'Stefanov', 9, 'Physical Education'),
(10, 'Viktoria', 'Viktorova', 10, 'Music'),
(11, 'Ivan', 'Ivanov', 12, 'Math'),
(12, 'Ivan', 'Ivanov', 14, 'Math');

--
-- Indexes for dumped tables
--

--
-- Индекси за таблица `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`AddressID`);

--
-- Индекси за таблица `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`ClassID`),
  ADD KEY `TeacherID` (`TeacherID`);

--
-- Индекси за таблица `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`CourseID`);

--
-- Индекси за таблица `studentcourses`
--
ALTER TABLE `studentcourses`
  ADD PRIMARY KEY (`StudentID`,`CourseID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Индекси за таблица `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `AddressID` (`AddressID`),
  ADD KEY `ClassID` (`ClassID`);

--
-- Индекси за таблица `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`TeacherID`),
  ADD KEY `AddressID` (`AddressID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `ClassID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `CourseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `TeacherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teachers` (`TeacherID`);

--
-- Ограничения за таблица `studentcourses`
--
ALTER TABLE `studentcourses`
  ADD CONSTRAINT `studentcourses_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  ADD CONSTRAINT `studentcourses_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`);

--
-- Ограничения за таблица `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`AddressID`) REFERENCES `addresses` (`AddressID`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`);

--
-- Ограничения за таблица `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`AddressID`) REFERENCES `addresses` (`AddressID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
