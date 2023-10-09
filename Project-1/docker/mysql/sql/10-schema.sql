SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Table structure for table `offices`
--

CREATE TABLE `offices` (
   `id` int(10) UNSIGNED NOT NULL,
   `city` varchar(64) NOT NULL DEFAULT '',
   `phone` varchar(64) NOT NULL DEFAULT '',
   `address_line_1` varchar(255) NOT NULL DEFAULT '',
   `address_line_2` varchar(255) NOT NULL DEFAULT '',
   `state` varchar(64) NOT NULL DEFAULT '',
   `country` varchar(32) NOT NULL DEFAULT '',
   `postal_code` varchar(16) NOT NULL DEFAULT '',
   `territory` varchar(16) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offices`
--

INSERT INTO `offices` (`id`, `city`, `phone`, `address_line_1`, `address_line_2`, `state`, `country`, `postal_code`, `territory`) VALUES
(1, 'San Francisco', '+1 000 000 0001', '100 Market Street', 'Suite 300', 'CA', 'USA', '94080', 'USA'),
(2, 'Boston', '+1 000 000 0002', '1550 Court Place', 'Suite 102', 'MA', 'USA', '02107', 'USA'),
(3, 'NYC', '+1 000 000 0003', '523 East 53rd Street', 'apt. 5A', 'NY', 'USA', '10022', 'USA'),
(4, 'Paris', '+33 00 000 0001', '43 Rue Jouffroy D\'abbans', '', '', 'France', '75017', 'EMEA'),
(5, 'Tokyo', '+81 00 000 0001', '4-1 Kioicho', '', 'Chiyoda-Ku', 'Japan', '102-8578', 'Japan'),
(6, 'Sydney', '+61 0 0000 0001', '5-11 Wentworth Avenue', 'Floor #2', '', 'Australia', 'NSW 2010', 'APAC'),
(7, 'London', '+44 00 0000 0001', '25 Old Broad Street', 'Level 7', '', 'UK', 'EC2N 1HN', 'EMEA');


-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_office` int(10) UNSIGNED NOT NULL,
  `reports_to` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(64) NOT NULL DEFAULT '',
  `last_name` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `job_title` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `id_office`, `reports_to`, `first_name`, `last_name`, `email`, `job_title`) VALUES
(1002, 1, NULL, 'Diane', 'Murphy', 'dmurphy@example.com', 'President'),
(1056, 1, 1002, 'Mary', 'Patterson', 'mpatterso@example.com', 'VP Sales'),
(1076, 1, 1002, 'Jeff', 'Firrelli', 'jfirrelli@example.com', 'VP Marketing'),
(1088, 6, 1056, 'William', 'Patterson', 'wpatterson@example.com', 'Sales Manager (APAC)'),
(1102, 4, 1056, 'Gerard', 'Bondur', 'gbondur@example.com', 'Sale Manager (EMEA)'),
(1143, 1, 1056, 'Anthony', 'Bow', 'abow@example.com', 'Sales Manager (NA)'),
(1165, 1, 1143, 'Leslie', 'Jennings', 'ljennings@example.com', 'Sales Rep'),
(1166, 1, 1143, 'Leslie', 'Thompson', 'lthompson@example.com', 'Sales Rep'),
(1188, 2, 1143, 'Julie', 'Firrelli', 'jfirrelli@example.com', 'Sales Rep'),
(1216, 2, 1143, 'Steve', 'Patterson', 'spatterson@example.com', 'Sales Rep'),
(1286, 3, 1143, 'Foon Yue', 'Tseng', 'ftseng@example.com', 'Sales Rep'),
(1323, 3, 1143, 'George', 'Vanauf', 'gvanauf@example.com', 'Sales Rep'),
(1337, 4, 1102, 'Loui', 'Bondur', 'lbondur@example.com', 'Sales Rep'),
(1370, 4, 1102, 'Gerard', 'Hernandez', 'ghernande@example.com', 'Sales Rep'),
(1401, 4, 1102, 'Pamela', 'Castillo', 'pcastillo@example.com', 'Sales Rep'),
(1501, 7, 1102, 'Larry', 'Bott', 'lbott@example.com', 'Sales Rep'),
(1504, 7, 1102, 'Barry', 'Jones', 'bjones@example.com', 'Sales Rep'),
(1611, 6, 1088, 'Andy', 'Fixter', 'afixter@example.com', 'Sales Rep'),
(1612, 6, 1088, 'Peter', 'Marsh', 'pmarsh@example.com', 'Sales Rep'),
(1619, 6, 1088, 'Tom', 'King', 'tking@example.com', 'Sales Rep'),
(1621, 5, 1056, 'Mami', 'Nishi', 'mnishi@example.com', 'Sales Rep'),
(1625, 5, 1621, 'Yoshimi', 'Kato', 'ykato@example.com', 'Sales Rep'),
(1702, 4, 1102, 'Martin', 'Gerard', 'mgerard@example.com', 'Sales Rep');

-- --------------------------------------------------------

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_leader` (`reports_to`),
  ADD KEY `employee_office` (`id_office`);

--
-- Indexes for table `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1703;

--
-- AUTO_INCREMENT for table `offices`
--
ALTER TABLE `offices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employee_leader` FOREIGN KEY (`reports_to`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_office` FOREIGN KEY (`id_office`) REFERENCES `offices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;