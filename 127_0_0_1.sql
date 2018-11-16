-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2018 at 10:31 AM
-- Server version: 5.6.11
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cdcol`
--
CREATE DATABASE IF NOT EXISTS `cdcol` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;
USE `cdcol`;

-- --------------------------------------------------------

--
-- Table structure for table `cds`
--

CREATE TABLE IF NOT EXISTS `cds` (
  `titel` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `interpret` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `jahr` int(11) DEFAULT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `cds`
--

INSERT INTO `cds` (`titel`, `interpret`, `jahr`, `id`) VALUES
('Beauty', 'Ryuichi Sakamoto', 1990, 1),
('Goodbye Country (Hello Nightclub)', 'Groove Armada', 2001, 4),
('Glee', 'Bran Van 3000', 1997, 5);
--
-- Database: `data`
--
CREATE DATABASE IF NOT EXISTS `data` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `data`;
--
-- Database: `download`
--
CREATE DATABASE IF NOT EXISTS `download` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `download`;

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

CREATE TABLE IF NOT EXISTS `download` (
  `DownloadID` int(11) NOT NULL AUTO_INCREMENT,
  `FileName` varchar(255) NOT NULL,
  `FileType` varchar(255) NOT NULL,
  `FileSize` varchar(255) NOT NULL,
  `SimpleDescription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumberDownload` int(11) NOT NULL,
  PRIMARY KEY (`DownloadID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `download`
--

INSERT INTO `download` (`DownloadID`, `FileName`, `FileType`, `FileSize`, `SimpleDescription`, `NumberDownload`) VALUES
(2, '12', '12', '21', '22', 42);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `RealName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Birthday` date NOT NULL,
  `Sex` varchar(10) NOT NULL,
  `Location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Passport` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmployeeID`, `RealName`, `Birthday`, `Sex`, `Location`, `Passport`) VALUES
(1, 'hjh', '1222-05-01', 'hjk', 'jkjkhk', 'kl');
--
-- Database: `gk`
--
CREATE DATABASE IF NOT EXISTS `gk` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gk`;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `RealName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Birthday` date NOT NULL,
  `Sex` varchar(10) NOT NULL,
  `Location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Passport` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `MemberID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) NOT NULL,
  `Password` text NOT NULL,
  PRIMARY KEY (`MemberID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`MemberID`, `Username`, `Password`) VALUES
(1, 'nhi09', 'e1b7962da04977f4d6a3a67784990de6'),
(7, 'nhi', '07ab8abc3e261e0cb0fb0fc64f5dfe1e');

-- --------------------------------------------------------

--
-- Table structure for table `tour`
--

CREATE TABLE IF NOT EXISTS `tour` (
  `TourID` int(11) NOT NULL AUTO_INCREMENT,
  `Tourname` varchar(255) NOT NULL,
  `Price` int(11) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Duration` varchar(255) NOT NULL,
  PRIMARY KEY (`TourID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tour`
--

INSERT INTO `tour` (`TourID`, `Tourname`, `Price`, `Location`, `Duration`) VALUES
(1, 'hmm', 69000000, '16.0471659,108.1716865,13', '5 ngày');
--
-- Database: `parking`
--
CREATE DATABASE IF NOT EXISTS `parking` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `parking`;

-- --------------------------------------------------------

--
-- Table structure for table `listpark`
--

CREATE TABLE IF NOT EXISTS `listpark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` int(9) NOT NULL,
  `timeStart` time NOT NULL,
  `timeEnd` time NOT NULL,
  `location` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `place` (`place`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `listpark`
--

INSERT INTO `listpark` (`id`, `place`, `host`, `timeStart`, `timeEnd`, `location`, `price`) VALUES
(2, 'Đài tiếng nói', 1, '00:00:01', '00:00:00', '15.97560721677795,108.26256138339386', 2),
(3, 'Đà Nẵng', 1, '03:01:00', '00:00:00', '15.975648474682586,108.26041561618194', 2),
(4, 'Lỗi hộ anh cái', 1, '13:03:00', '00:00:00', '15.974835093105236,108.26158652575225', 69900),
(5, '', 1, '00:00:00', '00:00:00', '15.975153379265606,108.26213222995148', 11),
(6, 'Hải Châu, Đà Nẵng', 1, '00:00:00', '00:00:00', '16.02464842777378,108.2069778679886', 7567),
(7, 'Lỗi đi mày', 1, '03:02:00', '00:00:00', '16.060902975693644,108.22320306069832', 65656),
(8, 'hihihihih', 1, '04:00:00', '03:00:00', '16.059502988431024,108.23970150988316', 6633),
(10, 'Lỗi hộ anh cái', 1, '11:20:00', '10:20:00', '16.051826058510425,108.23926749815223', 20000),
(11, 'Trương Huỳnh Đức', 1, '08:20:00', '13:20:00', '16.05739970827004,108.23345589844394', 49999),
(12, 'Thị An, Ngũ Hành Sơn District, Vietnam', 0, '10:20:00', '14:20:00', '15.980335317532647,108.26301709175323', 2787),
(13, 'Cam Le, Da Nang 564310, Vietnam', 0, '03:20:00', '06:20:00', '15.99595285797322,108.22010923276957', 32),
(14, 'Bồ Mừng, Quang Nam Province 564310, Vietnam', 0, '23:50:00', '04:50:00', '15.968920366075562,108.25870872723976', 65),
(15, 'Ningjin County, Hequ Hebei 054000, PRC', 0, '04:35:00', '08:35:00', '37.6250697717551,114.77979714509866', 6849);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `OrderID` int(11) NOT NULL,
  `TimeIn` time NOT NULL,
  `TimeOut` time NOT NULL,
  `UserID` int(11) NOT NULL,
  `HostUserID` int(11) NOT NULL,
  ` MarineNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `TimeIn`, `TimeOut`, `UserID`, `HostUserID`, ` MarineNumber`) VALUES
(1, '02:00:00', '02:00:00', 71, 21, 'AB-XYZ');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) NOT NULL,
  `Password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `PhoneNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FullName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Balance` double NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `UserName`, `Password`, `Avatar`, `PhoneNumber`, `FullName`, `Balance`) VALUES
(1, 'trhduc', '3', '23', '0364507450', 'Trương Huỳnh Đức', 200);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma_bookmark`
--

CREATE TABLE IF NOT EXISTS `pma_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma_column_info`
--

CREATE TABLE IF NOT EXISTS `pma_column_info` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin' AUTO_INCREMENT=52 ;

--
-- Dumping data for table `pma_column_info`
--

INSERT INTO `pma_column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`) VALUES
(1, 'ttsv', 'admin_user', 'id', '', '', '_', ''),
(2, 'ttsv', 'admin_user', 'user_name', '', '', '_', ''),
(3, 'ttsv', 'admin_user', 'password', '', '', '_', ''),
(4, 'ttsv', 'dangky', 'diem', '', '', '_', ''),
(5, 'gk', 'user', 'MemberID', '', '', '_', ''),
(6, 'gk', 'user', 'Username', '', '', '_', ''),
(7, 'gk', 'user', 'Password', '', '', '_', ''),
(8, 'gk', 'tour', 'TourID', '', '', '_', ''),
(9, 'gk', 'tour', 'Tourname', '', '', '_', ''),
(10, 'gk', 'tour', 'Price', '', '', '_', ''),
(11, 'gk', 'tour', 'Location', '', '', '_', ''),
(12, 'gk', 'tour', 'Duration', '', '', '_', ''),
(13, 'ttsv', 'giangvien', 'maGV', '', '', '_', ''),
(14, 'ttsv', 'giangvien', 'hoten', '', '', '_', ''),
(15, 'ttsv', 'giangvien', 'hocham', '', '', '_', ''),
(16, 'ttsv', 'lophocphan', 'giangvien_id', '', '', '_', ''),
(17, 'download', 'download', 'DownloadID', '', '', '_', ''),
(18, 'download', 'download', 'FileName', '', '', '_', ''),
(19, 'download', 'download', 'FileType', '', '', '_', ''),
(20, 'download', 'download', 'FizeSize', '', '', '_', ''),
(21, 'download', 'download', 'SimpleDescription', '', '', '_', ''),
(22, 'download', 'download', 'NumberDownload', '', '', '_', ''),
(23, 'download', 'download', 'FileSize', '', '', '_', ''),
(24, 'tour', 'tour', 'ID', '', '', '_', ''),
(25, 'tour', 'tour', 'LocationName', '', '', '_', ''),
(26, 'tour', 'tour', 'Description', '', '', '_', ''),
(27, 'tour', 'tour', 'Avatar', '', '', '_', ''),
(28, 'parking', 'listPark', 'id', '', '', '_', ''),
(29, 'parking', 'listPark', 'place', '', '', '_', ''),
(30, 'parking', 'listPark', 'host', '', '', '_', ''),
(31, 'parking', 'listPark', 'time', '', '', '_', ''),
(32, 'parking', 'listPark', 'location', '', '', '_', ''),
(33, 'parking', 'listPark', 'price', '', '', '_', ''),
(34, 'ttsv', 'admin_user', 'Name', '', '', '_', ''),
(35, 'parking', 'order', 'OrderID', '', '', '_', ''),
(36, 'parking', 'order', 'TimeIn', '', '', '_', ''),
(37, 'parking', 'order', 'TimeOut', '', '', '_', ''),
(38, 'parking', 'order', 'UserID', '', '', '_', ''),
(39, 'parking', 'order', 'HostUserID', '', '', '_', ''),
(40, 'parking', 'order', ' MarineNumber', '', '', '_', ''),
(41, 'parking', 'user', 'UserID', '', '', '_', ''),
(42, 'parking', 'user', 'UserName', '', '', '_', ''),
(43, 'parking', 'user', 'Password', '', '', '_', ''),
(44, 'parking', 'user', 'Avatar', '', '', '_', ''),
(45, 'parking', 'user', 'PhoneNumber', '', '', '_', ''),
(46, 'parking', 'user', 'FullName', '', '', '_', ''),
(47, 'parking', 'user', 'Balance', '', '', '_', ''),
(48, 'parking', 'listpark', 'timeStart', '', '', '_', ''),
(49, 'parking', 'listpark', 'timeEnd', '', '', '_', ''),
(50, 'ttsv', 'dangky_ad', 'id', '', '', '_', ''),
(51, 'ttsv', 'dangky_gv', 'id', '', '', '_', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma_designer_coords`
--

CREATE TABLE IF NOT EXISTS `pma_designer_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `v` tinyint(4) DEFAULT NULL,
  `h` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma_history`
--

CREATE TABLE IF NOT EXISTS `pma_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`,`db`,`table`,`timevalue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma_pdf_pages`
--

CREATE TABLE IF NOT EXISTS `pma_pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`page_nr`),
  KEY `db_name` (`db_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma_recent`
--

CREATE TABLE IF NOT EXISTS `pma_recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma_recent`
--

INSERT INTO `pma_recent` (`username`, `tables`) VALUES
('root', '[{"db":"parking","table":"user"},{"db":"ttsv","table":"dangky"},{"db":"ttsv","table":"admin_user"},{"db":"parking","table":"listpark"},{"db":"ttsv","table":"dangky_gv"},{"db":"ttsv","table":"dangky_ad"},{"db":"parking","table":"order"},{"db":"ttsv","table":"hocphan"},{"db":"ttsv","table":"lophocphan"},{"db":"tour","table":"tour"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma_relation`
--

CREATE TABLE IF NOT EXISTS `pma_relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  KEY `foreign_field` (`foreign_db`,`foreign_table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma_table_coords`
--

CREATE TABLE IF NOT EXISTS `pma_table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float unsigned NOT NULL DEFAULT '0',
  `y` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma_table_info`
--

CREATE TABLE IF NOT EXISTS `pma_table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma_table_uiprefs`
--

CREATE TABLE IF NOT EXISTS `pma_table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`,`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma_table_uiprefs`
--

INSERT INTO `pma_table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'ttsv', 'dangky', '{"sorted_col":"`dangky`.`id` ASC"}', '2018-10-17 01:19:24'),
('root', 'ttsv', 'lophocphan', '{"sorted_col":"`lophocphan`.`namhoc` ASC"}', '2018-10-17 01:59:08'),
('root', 'gk', 'employee', '{"CREATE_TIME":"2018-11-03 17:23:39","col_order":["0","2","1","3","4","5"],"col_visib":["1","1","1","1","1","1"]}', '2018-11-03 10:31:12'),
('root', 'ttsv', 'dangky_ad', '{"sorted_col":"`dangky_ad`.`id` ASC"}', '2018-11-14 01:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `pma_tracking`
--

CREATE TABLE IF NOT EXISTS `pma_tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`db_name`,`table_name`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma_userconfig`
--

CREATE TABLE IF NOT EXISTS `pma_userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets`()
    DETERMINISTIC
begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end$$

DELIMITER ;
--
-- Database: `tour`
--
CREATE DATABASE IF NOT EXISTS `tour` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tour`;

-- --------------------------------------------------------

--
-- Table structure for table `tour`
--

CREATE TABLE IF NOT EXISTS `tour` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LocationName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tour`
--

INSERT INTO `tour` (`ID`, `LocationName`, `Description`, `Avatar`) VALUES
(1, 'Mẽo', '16.047079, 108.206230', 'https://nld.mediacdn.vn/thumb_w/540/2018/11/5/iran-15414300700451456109689.jpg'),
(2, 'Lào.. Cai', '16.047019, 108.206430', 'http://st.galaxypub.vn/staticFile/Subject/2018/07/19/331742/lao-cai-sat-nhap-2-so-vua-hao-hung-vua-be-tac_191745940.jpg'),
(3, 'Quảng Bình', '16.0359087,108.2199704', 'http://st.galaxypub.vn/staticFile/Subject/2018/07/19/331742/lao-cai-sat-nhap-2-so-vua-hao-hung-vua-be-tac_191745940.jpg'),
(4, 'Quảng Bình', '16.047029, 108.204230', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKrEhESfPOXn9NI8zjhtgNCIQT4TtfQDhqNNXSnDg2ghdgax4z');
--
-- Database: `ttsv`
--
CREATE DATABASE IF NOT EXISTS `ttsv` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ttsv`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE IF NOT EXISTS `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`id`, `user_name`, `password`, `Name`) VALUES
(1, 'duc', 'c4ca4238a0b923820dcc509a6f75849b', 'tr.h.duc');

-- --------------------------------------------------------

--
-- Table structure for table `dangky`
--

CREATE TABLE IF NOT EXISTS `dangky` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_lophp` int(11) NOT NULL,
  `masv` varchar(255) NOT NULL,
  `diem` text NOT NULL,
  `thoigian` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=103 ;

--
-- Dumping data for table `dangky`
--

INSERT INTO `dangky` (`id`, `id_lophp`, `masv`, `diem`, `thoigian`) VALUES
(80, 1, '17It169', ' {"CC":"5","GK":"1","CK":"2"} ', '2018-10-17 08:13:45'),
(81, 3, '17It169', '', '2018-10-17 08:13:46'),
(100, 1, '17IT135', '', '2018-11-07 09:32:08'),
(101, 3, '17IT135', '', '2018-11-13 12:04:02'),
(102, 3, '17IT135', '', '2018-11-13 12:04:02');

-- --------------------------------------------------------

--
-- Table structure for table `dangky_ad`
--

CREATE TABLE IF NOT EXISTS `dangky_ad` (
  `id` int(11) NOT NULL,
  `id_lophp` int(11) NOT NULL,
  `masv` varchar(255) NOT NULL,
  `diem` text NOT NULL,
  `thoigian` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dangky_gv`
--

CREATE TABLE IF NOT EXISTS `dangky_gv` (
  `id` int(11) NOT NULL,
  `id_lophp` int(11) NOT NULL,
  `masv` varchar(255) NOT NULL,
  `diem` text NOT NULL,
  `thoigian` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `giangvien`
--

CREATE TABLE IF NOT EXISTS `giangvien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maGV` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `hoten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hocham` varchar(169) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `giangvien`
--

INSERT INTO `giangvien` (`id`, `maGV`, `password`, `hoten`, `hocham`) VALUES
(1, 'gao', 'f7174f24d005a88597b07aa36d388adc', 'Siêu nhân Gao', 'Siêu giáo sư');

-- --------------------------------------------------------

--
-- Table structure for table `hocphan`
--

CREATE TABLE IF NOT EXISTS `hocphan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenhp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sotinchi` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hocphan`
--

INSERT INTO `hocphan` (`id`, `tenhp`, `sotinchi`) VALUES
(1, 'Hóa', 2),
(2, 'Hóa cao cấp', 2),
(3, 'Hóa học vũ trụ', 6);

-- --------------------------------------------------------

--
-- Table structure for table `lop`
--

CREATE TABLE IF NOT EXISTS `lop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenlop` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `GVCN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `lop`
--

INSERT INTO `lop` (`id`, `tenlop`, `GVCN`) VALUES
(1, '17IT3', 'htmp'),
(2, '17IT1', 'lvm');

-- --------------------------------------------------------

--
-- Table structure for table `lophocphan`
--

CREATE TABLE IF NOT EXISTS `lophocphan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenlop` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `soluong` int(11) NOT NULL,
  `namhoc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hocky` int(11) NOT NULL,
  `hocphan_id` int(11) NOT NULL,
  `giangvien_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `lophocphan`
--

INSERT INTO `lophocphan` (`id`, `tenlop`, `soluong`, `namhoc`, `hocky`, `hocphan_id`, `giangvien_id`) VALUES
(1, 'Hóa cao cấp 2', 69, '2016-2017', 2, 1, 'gao'),
(2, 'Hóa chất 1', 96, '2017-2018', 1, 2, 'gao'),
(3, 'Hóa vũ trụ 2', 32, '2017-2018', 2, 3, '1'),
(4, 'Bán muối dạo', 96, '2017-2018', 3, 2, 'gao');

-- --------------------------------------------------------

--
-- Table structure for table `thongtin`
--

CREATE TABLE IF NOT EXISTS `thongtin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `masv` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `ten` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lop` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinh` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `thongtin`
--

INSERT INTO `thongtin` (`id`, `masv`, `password`, `ten`, `lop`, `ngaysinh`) VALUES
(1, '17IT135', 'c4ca4238a0b923820dcc509a6f75849b', 'Trương Huỳnh Đức', '1', '1999-08-10'),
(2, '123123', '', '123123', '213123', '1969-09-06'),
(15, 'hihi', '', 'hi cl', '2', '2013-03-02'),
(18, '17IT069', '', 'hmmm', '1', '2010-09-02'),
(19, 'hahaha', '', 'hahahahhah', '2', '2000-12-31'),
(20, '17It169', 'a275855f6d3711f75fbbffaabfb8d818', 'Lỗi hộ anh cái', '2', '2018-01-31');
--
-- Database: `webauth`
--
CREATE DATABASE IF NOT EXISTS `webauth` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;
USE `webauth`;

-- --------------------------------------------------------

--
-- Table structure for table `user_pwd`
--

CREATE TABLE IF NOT EXISTS `user_pwd` (
  `name` char(30) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `pass` char(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `user_pwd`
--

INSERT INTO `user_pwd` (`name`, `pass`) VALUES
('xampp', 'wampp');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
