-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 02, 2023 at 10:15 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pazumai`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone_no` varchar(12) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `name` text NOT NULL,
  `msg` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `email`, `phone_no`, `subject`, `date`, `name`, `msg`) VALUES
(1, 'abc@gmail.com', '876541976', 'Other', '2023-10-05 12:33:15', 'abbd', 'test2'),
(2, 'jothi@abc.com', '987654321', 'New request', '2023-10-05 15:37:05', 'jothi', 'test1');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `sno` int(11) NOT NULL,
  `category` text NOT NULL,
  `img_loc` varchar(200) NOT NULL,
  `product_name` text NOT NULL,
  `price` float NOT NULL,
  `quantity` varchar(10) NOT NULL,
  `properties` varchar(100) NOT NULL,
  `details` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`sno`, `category`, `img_loc`, `product_name`, `price`, `quantity`, `properties`, `details`) VALUES
(1, 'Oil Products', 'gingelly_oil.jpg', 'Gingelly Oil (Nalla Ennai)', 370, '1 Ltr', 'Purest form of Oil', 'ABCD'),
(2, 'Oil Products', 'groundnut_oil.jpg', 'Groundnut Oil(Kadalai Ennai)', 260, '1 Ltr', '[pure, organic, Fresh]', 'ABCD'),
(3, 'Oil Products', 'coconut_oil.jpg', 'Coconut Oil (Nalla Ennai)', 240, '1 Ltr', '[pure, organic, Fresh]', 'ABCD'),
(4, 'Nuts', 'california_almonds.jpg', 'California Almonds', 88, '100 Gms', '[organic, Fresh]', 'ABCD'),
(5, 'Nuts', 'countryside_alm.jpg', 'Countryside Almonds', 80, '100 Gms', '[organic, Fresh]', 'ABCD'),
(6, 'Nuts', 'pista.jpg', 'Plain Pista', 220, '100 Gms', '[organic, Fresh]', 'ABCD'),
(7, 'Nuts', 'cashew.jpg', 'Cashew', 85, '100 Gms', '[organic, Fresh]', 'ABCD'),
(8, 'Nuts', 'kiwi.jpg', 'Kiwi', 57, '100 Gms', '[organic, Fresh]', 'ABCD'),
(9, 'Nuts', 'dry_fig.jpg', 'Dry Fig', 140, '100 Gms', '[organic, Fresh]', 'ABCD'),
(10, 'Nuts', 'raisin_black.jpg', 'Raisin(Black)', 110, '250 Gms', '[organic, Fresh]', 'ABCD'),
(11, 'Nuts', 'yellow_grapes.jpg', 'Dry Grapes(Yellow)', 75, '100 Gms', '[organic, Fresh]', 'ABCD'),
(12, 'Nuts', 'dates.jpg', 'Dates', 110, '500 Gms', '[organic, Fresh]', 'ABCD'),
(13, 'Nuts', 'walnut.jpg', 'Walnut', 140, '100 Gms', '[organic, Fresh]', 'ABCD'),
(14, 'Dairy Products', 'ghee.jpg', 'Ghee', 400, '500 Gms', '[Fresh, Organic, Tasty]', 'ABCD'),
(15, 'Dairy Products', 'butter.jpg', 'Butter', 175, '250 Gms', '[Fresh, Organic, Tasty]', 'ABCD'),
(16, 'Dairy Products', 'paneer.jpg', 'Paneer', 220, '500 Gms', '[Fresh, Organic, Tasty]', 'ABCD'),
(17, 'Honey', 'farm_honey.jpg', 'Natural Farm Honey', 300, '750 Gms', '[Fresh, Organic]', 'ABCD'),
(18, 'Honey', 'hill_honey.jpg', 'Natural Hills Honey', 250, '250 Gms', '[Fresh, Organic]', 'ABCD');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
