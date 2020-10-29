-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2020 at 11:53 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci4`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_activation_attempts`
--

INSERT INTO `auth_activation_attempts` (`id`, `ip_address`, `user_agent`, `token`, `created_at`) VALUES
(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36 Edg/86.0.622.51', '35bb2dae2abce2bf555fadf13cbf770d', '2020-10-29 05:35:38');

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'guyasumka@gmail.com', 1, '2020-10-29 05:06:44', 1),
(2, '::1', 'chaplindeny@gmail.com', 2, '2020-10-29 05:35:57', 1),
(3, '::1', 'chaplindeny@gmail.com', 2, '2020-10-29 05:50:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_reset_attempts`
--

INSERT INTO `auth_reset_attempts` (`id`, `email`, `ip_address`, `user_agent`, `token`, `created_at`) VALUES
(1, 'chaplindeny@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36 Edg/86.0.622.51', '5374b5caa0304eab8ab09a98e1823f7a', '2020-10-29 05:49:48');

-- --------------------------------------------------------

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `komik`
--

CREATE TABLE `komik` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `sampul` varchar(255) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `komik`
--

INSERT INTO `komik` (`id`, `judul`, `slug`, `penulis`, `penerbit`, `sampul`, `created_at`, `updated_at`) VALUES
(1, 'Naruto', 'naruto', 'Masashi Kishimoto', 'Shounen', 'naruto.jpg', NULL, NULL),
(2, 'One Piece', 'one-piece', 'Echiro Oda', 'Shounen', 'onepiece.jpg', NULL, NULL),
(13, 'Yang berubah hanya Judul', 'yang-berubah-hanya-judul', 'Deny Andriana', 'ksdask', '1603098226_4059d6d12516e268b3ed.jpg', '2020-10-19', '2020-10-19');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` text NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2020-10-19-090906', 'App\\Database\\Migrations\\Orang', 'default', 'App', 1603099067, 1),
(2, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1603964621, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orang`
--

CREATE TABLE `orang` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orang`
--

INSERT INTO `orang` (`id`, `nama`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 'Ratna Handayani M.Kom.', 'Ds. Banceng Pondok No. 689, Malang 71152, DIY', '1994-06-11 07:20:34', '2020-10-19 05:07:27'),
(2, 'Reza Mangunsong', 'Ds. Sukajadi No. 851, Banjarmasin 89613, SumSel', '1983-10-18 14:54:33', '2020-10-19 05:07:27'),
(3, 'Ami Puspasari', 'Jr. Baja No. 738, Sibolga 88333, SumUt', '1974-06-22 20:35:31', '2020-10-19 05:07:27'),
(4, 'Laras Puspita S.Farm', 'Ds. Ikan No. 921, Tebing Tinggi 16306, Banten', '2001-05-26 20:59:59', '2020-10-19 05:07:27'),
(5, 'Febi Vera Laksmiwati S.Ked', 'Ds. Surapati No. 350, Pagar Alam 72623, PapBar', '1992-03-16 06:18:02', '2020-10-19 05:07:27'),
(6, 'Lukman Wijaya', 'Gg. Ahmad Dahlan No. 767, Tangerang Selatan 53701, Lampung', '2016-11-22 05:18:38', '2020-10-19 05:07:27'),
(7, 'Ganep Raden Kurniawan', 'Ds. Kyai Gede No. 574, Administrasi Jakarta Timur 28212, Bengkulu', '1997-03-27 02:09:29', '2020-10-19 05:07:27'),
(8, 'Uchita Mulyani', 'Jln. Baing No. 122, Banjar 37816, Papua', '2011-07-22 20:21:52', '2020-10-19 05:07:27'),
(9, 'Usyi Mardhiyah', 'Gg. Suharso No. 942, Singkawang 91911, SulSel', '1997-11-27 09:37:23', '2020-10-19 05:07:27'),
(10, 'Catur Bahuwirya Narpati', 'Jr. Salam No. 859, Administrasi Jakarta Utara 12191, NTT', '1989-10-18 07:58:13', '2020-10-19 05:07:27'),
(11, 'Suci Melinda Anggraini S.Gz', 'Psr. Pelajar Pejuang 45 No. 523, Pontianak 83640, Banten', '2010-11-13 03:16:55', '2020-10-19 05:07:27'),
(12, 'Almira Nurdiyanti', 'Ds. Basuki No. 978, Pariaman 96495, SumSel', '2017-07-04 22:18:23', '2020-10-19 05:07:27'),
(13, 'Titin Hartati', 'Gg. Diponegoro No. 714, Parepare 34110, KalBar', '2014-10-21 00:33:57', '2020-10-19 05:07:27'),
(14, 'Ajimin Cawuk Uwais', 'Gg. Babah No. 590, Pekanbaru 93283, SulUt', '2004-11-23 05:15:22', '2020-10-19 05:07:28'),
(15, 'Siti Yolanda', 'Jln. Salatiga No. 387, Pagar Alam 43496, KalUt', '1976-05-08 19:18:56', '2020-10-19 05:07:28'),
(16, 'Maya Kamila Susanti S.E.', 'Jr. Kebangkitan Nasional No. 373, Yogyakarta 74115, NTB', '2014-05-03 11:08:42', '2020-10-19 05:07:28'),
(17, 'Garang Damanik S.IP', 'Gg. Bayan No. 612, Palu 50138, Maluku', '2011-05-04 03:02:15', '2020-10-19 05:07:28'),
(18, 'Raihan Hakim', 'Jln. Dewi Sartika No. 531, Tanjung Pinang 38773, JaTeng', '2004-12-19 13:02:09', '2020-10-19 05:07:28'),
(19, 'Icha Gasti Puspita S.Gz', 'Dk. Bank Dagang Negara No. 81, Blitar 25804, Bengkulu', '1995-02-09 20:23:40', '2020-10-19 05:07:28'),
(20, 'Abyasa Aris Damanik', 'Kpg. Tambun No. 395, Tangerang Selatan 29231, SulBar', '1981-07-11 21:26:59', '2020-10-19 05:07:28'),
(21, 'Yoga Sihombing', 'Gg. Bawal No. 402, Binjai 62473, Papua', '2017-03-04 11:31:56', '2020-10-19 05:07:28'),
(22, 'Hasta Rizki Mansur S.Sos', 'Ki. Siliwangi No. 44, Surabaya 96914, SumUt', '1989-10-22 04:46:39', '2020-10-19 05:07:28'),
(23, 'Usyi Yolanda', 'Psr. Cikutra Timur No. 474, Balikpapan 36471, SulBar', '1982-07-06 11:28:13', '2020-10-19 05:07:28'),
(24, 'Erik Januar M.Ak', 'Gg. Bakin No. 196, Jambi 41617, BaBel', '2011-01-29 20:34:03', '2020-10-19 05:07:28'),
(25, 'Edi Hakim', 'Kpg. Moch. Ramdan No. 374, Lhokseumawe 91930, KalTeng', '2007-07-07 22:51:56', '2020-10-19 05:07:28'),
(26, 'Ganep Yono Simanjuntak M.Kom.', 'Dk. Bakin No. 254, Madiun 61495, JaTeng', '1985-02-26 12:58:08', '2020-10-19 05:07:28'),
(27, 'Gilda Namaga', 'Gg. Wahid Hasyim No. 148, Cilegon 36648, BaBel', '2019-04-13 06:31:23', '2020-10-19 05:07:29'),
(28, 'Pangestu Permadi', 'Ds. Babadan No. 708, Surakarta 98995, KalUt', '2016-12-07 11:03:22', '2020-10-19 05:07:29'),
(29, 'Nalar Mansur', 'Jln. Bak Mandi No. 395, Kediri 68678, SulUt', '1971-05-16 19:56:46', '2020-10-19 05:07:29'),
(30, 'Prima Natsir', 'Kpg. Nakula No. 837, Padangsidempuan 79520, Aceh', '2005-04-01 14:01:28', '2020-10-19 05:07:29'),
(31, 'Ira Hariyah', 'Dk. Ters. Buah Batu No. 600, Palangka Raya 79039, Gorontalo', '2000-09-04 17:27:57', '2020-10-19 05:07:29'),
(32, 'Daruna Narpati', 'Jln. Panjaitan No. 950, Manado 67116, SumBar', '2017-04-17 08:35:03', '2020-10-19 05:07:29'),
(33, 'Kawaca Nainggolan', 'Kpg. Sutoyo No. 759, Singkawang 78059, KalTeng', '2004-04-06 16:36:43', '2020-10-19 05:07:29'),
(34, 'Setya Jaswadi Adriansyah', 'Gg. Gajah Mada No. 259, Tual 80037, KalTeng', '1974-11-07 01:51:49', '2020-10-19 05:07:29'),
(35, 'Umi Astuti', 'Ds. Achmad No. 659, Balikpapan 23457, DKI', '1995-04-16 08:10:52', '2020-10-19 05:07:29'),
(36, 'Zahra Hassanah', 'Ds. Bakau No. 881, Lhokseumawe 25331, KalSel', '2006-03-07 16:24:54', '2020-10-19 05:07:29'),
(37, 'Novi Winarsih S.Farm', 'Dk. Nanas No. 149, Makassar 45866, PapBar', '2013-09-28 13:30:04', '2020-10-19 05:07:29'),
(38, 'Gara Samosir', 'Jr. Basket No. 211, Denpasar 91715, NTB', '1985-07-05 01:57:39', '2020-10-19 05:07:29'),
(39, 'Ami Lintang Anggraini', 'Dk. Bakti No. 638, Manado 77432, Banten', '1984-03-11 20:33:19', '2020-10-19 05:07:29'),
(40, 'Slamet Rajata', 'Kpg. Setia Budi No. 927, Administrasi Jakarta Utara 83984, JaTim', '2005-05-25 19:23:51', '2020-10-19 05:07:29'),
(41, 'Daniswara Pratama', 'Ki. Urip Sumoharjo No. 256, Kendari 89582, SulTra', '1990-04-21 15:17:12', '2020-10-19 05:07:29'),
(42, 'Lasmanto Wasis Thamrin', 'Jr. Antapani Lama No. 883, Payakumbuh 22707, Banten', '1986-02-23 10:11:06', '2020-10-19 05:07:29'),
(43, 'Dina Nuraini', 'Jln. Radio No. 505, Tangerang Selatan 38485, SulTeng', '1986-07-25 20:11:30', '2020-10-19 05:07:29'),
(44, 'Dalima Carla Lestari S.Ked', 'Ds. Arifin No. 580, Administrasi Jakarta Barat 52851, SulSel', '2011-10-04 10:36:53', '2020-10-19 05:07:30'),
(45, 'Raina Padmasari', 'Dk. Tambak No. 407, Administrasi Jakarta Selatan 54349, Jambi', '1970-05-05 09:31:30', '2020-10-19 05:07:30'),
(46, 'Pardi Prakasa', 'Gg. Rajawali Barat No. 452, Gorontalo 97683, Bengkulu', '1999-04-14 12:35:03', '2020-10-19 05:07:30'),
(47, 'Ana Hartati S.Ked', 'Ki. W.R. Supratman No. 678, Cimahi 45316, BaBel', '2010-06-09 15:08:18', '2020-10-19 05:07:30'),
(48, 'Hasna Hastuti', 'Psr. Raden No. 649, Administrasi Jakarta Utara 79171, Jambi', '2016-05-03 18:01:08', '2020-10-19 05:07:30'),
(49, 'Oliva Usada S.Farm', 'Kpg. Soekarno Hatta No. 625, Sungai Penuh 85996, SulTeng', '1983-02-23 18:20:23', '2020-10-19 05:07:30'),
(50, 'Candra Elvin Nainggolan M.Farm', 'Psr. Perintis Kemerdekaan No. 969, Batu 83954, Bali', '2018-08-28 09:21:37', '2020-10-19 05:07:30'),
(51, 'Jumari Mustofa', 'Ds. Bass No. 729, Surabaya 22416, JaTim', '2006-04-16 19:14:58', '2020-10-19 05:07:30'),
(52, 'Zalindra Oktaviani M.Kom.', 'Dk. Ekonomi No. 989, Malang 17229, DKI', '2013-05-08 16:14:26', '2020-10-19 05:07:30'),
(53, 'Kanda Wisnu Siregar S.H.', 'Dk. Ciumbuleuit No. 156, Bandar Lampung 95300, SumBar', '1975-04-13 11:11:28', '2020-10-19 05:07:30'),
(54, 'Dartono Tarihoran S.Pd', 'Gg. Dipatiukur No. 200, Sorong 56427, SulSel', '1994-03-29 00:19:07', '2020-10-19 05:07:30'),
(55, 'Tantri Uchita Maryati S.E.', 'Jr. Bayam No. 462, Administrasi Jakarta Pusat 33580, JaTeng', '1998-07-01 22:03:33', '2020-10-19 05:07:30'),
(56, 'Gabriella Kani Puspasari', 'Jln. Taman No. 563, Tegal 22830, NTT', '2005-05-07 20:11:23', '2020-10-19 05:07:30'),
(57, 'Rangga Sinaga', 'Dk. Bappenas No. 744, Batu 25532, Bengkulu', '1975-05-25 07:59:39', '2020-10-19 05:07:30'),
(58, 'Michelle Nurdiyanti', 'Jr. Cihampelas No. 871, Payakumbuh 89413, NTT', '1985-06-20 14:24:04', '2020-10-19 05:07:30'),
(59, 'Tantri Halimah', 'Jr. Dipatiukur No. 553, Lhokseumawe 28852, Aceh', '1983-05-25 11:55:13', '2020-10-19 05:07:30'),
(60, 'Dinda Nasyiah', 'Psr. Sentot Alibasa No. 352, Batu 26373, Riau', '2019-02-22 12:31:23', '2020-10-19 05:07:30'),
(61, 'Ida Mayasari', 'Dk. Karel S. Tubun No. 159, Tual 13594, KepR', '2015-12-03 10:42:58', '2020-10-19 05:07:30'),
(62, 'Mahesa Tampubolon', 'Ki. Raden Saleh No. 496, Metro 65165, JaTim', '2011-08-28 11:58:13', '2020-10-19 05:07:31'),
(63, 'Nadine Hassanah', 'Dk. Krakatau No. 146, Batam 69093, SumBar', '2017-12-03 16:27:24', '2020-10-19 05:07:31'),
(64, 'Galak Wasita S.Psi', 'Ki. Suryo Pranoto No. 177, Batu 28410, BaBel', '1992-06-14 05:12:25', '2020-10-19 05:07:31'),
(65, 'Jasmin Tari Palastri S.Pd', 'Dk. Merdeka No. 685, Cimahi 17539, NTB', '1980-11-22 06:21:44', '2020-10-19 05:07:31'),
(66, 'Gangsar Januar', 'Dk. Batako No. 759, Pontianak 32923, JaBar', '2013-06-22 23:07:05', '2020-10-19 05:07:31'),
(67, 'Kariman Adinata Napitupulu S.Pd', 'Ds. Padang No. 863, Palembang 79495, NTB', '1997-06-27 21:23:29', '2020-10-19 05:07:31'),
(68, 'Asmianto Jaga Prabowo S.IP', 'Psr. Ters. Kiaracondong No. 902, Depok 26894, KalTim', '1986-09-11 23:08:08', '2020-10-19 05:07:31'),
(69, 'Yuni Nurdiyanti S.I.Kom', 'Kpg. Acordion No. 166, Semarang 13140, MalUt', '2004-01-30 15:29:47', '2020-10-19 05:07:31'),
(70, 'Amalia Purnawati S.Psi', 'Gg. Krakatau No. 263, Palu 19523, Aceh', '1994-08-25 03:57:02', '2020-10-19 05:07:31'),
(71, 'Jelita Farida', 'Ki. Sutoyo No. 57, Langsa 89640, Papua', '2019-06-27 12:14:14', '2020-10-19 05:07:31'),
(72, 'Aswani Tampubolon', 'Kpg. Dipenogoro No. 767, Administrasi Jakarta Utara 21181, SumSel', '2009-06-15 11:12:00', '2020-10-19 05:07:31'),
(73, 'Mitra Gunawan', 'Dk. Surapati No. 312, Surabaya 62949, JaBar', '2011-06-21 06:17:41', '2020-10-19 05:07:31'),
(74, 'Mutia Hasna Uyainah S.E.I', 'Jr. Bakaru No. 985, Langsa 10257, KalBar', '2020-05-03 07:19:28', '2020-10-19 05:07:31'),
(75, 'Raden Cemeti Najmudin', 'Ds. Eka No. 106, Bau-Bau 77237, KepR', '2009-01-11 19:29:21', '2020-10-19 05:07:31'),
(76, 'Emin Jati Waluyo', 'Jr. Cut Nyak Dien No. 417, Kediri 96283, SumSel', '2004-09-11 21:28:57', '2020-10-19 05:07:31'),
(77, 'Dinda Suartini', 'Kpg. Yohanes No. 312, Bima 82316, Banten', '1994-12-06 13:23:39', '2020-10-19 05:07:31'),
(78, 'Taufan Salahudin', 'Psr. Katamso No. 216, Pangkal Pinang 67370, SulBar', '2011-12-08 15:56:31', '2020-10-19 05:07:31'),
(79, 'Luwar Budiyanto', 'Jln. Bakin No. 115, Cirebon 37460, Banten', '1992-05-12 19:35:58', '2020-10-19 05:07:31'),
(80, 'Kemba Gunarto', 'Jr. Suprapto No. 818, Madiun 11877, JaTim', '2006-05-23 00:02:09', '2020-10-19 05:07:32'),
(81, 'Chelsea Rahayu', 'Ds. Sunaryo No. 684, Singkawang 40937, SumUt', '1989-02-28 06:07:17', '2020-10-19 05:07:32'),
(82, 'Luwar Situmorang', 'Jln. Ir. H. Juanda No. 939, Makassar 41615, KalTim', '1995-06-02 01:22:57', '2020-10-19 05:07:32'),
(83, 'Vicky Ellis Hariyah', 'Jr. Sam Ratulangi No. 885, Kotamobagu 45200, Banten', '1977-04-07 03:49:34', '2020-10-19 05:07:32'),
(84, 'Gabriella Jasmin Pertiwi', 'Ki. Batako No. 836, Payakumbuh 80894, JaTim', '1983-04-09 15:41:42', '2020-10-19 05:07:32'),
(85, 'Latika Salsabila Nasyiah', 'Dk. Ikan No. 90, Administrasi Jakarta Timur 59468, MalUt', '2000-09-12 12:57:07', '2020-10-19 05:07:32'),
(86, 'Dimaz Marpaung', 'Dk. Ir. H. Juanda No. 16, Mojokerto 89425, Gorontalo', '2012-06-15 03:20:22', '2020-10-19 05:07:32'),
(87, 'Lasmono Adriansyah S.Pt', 'Gg. Sumpah Pemuda No. 150, Serang 77722, JaTeng', '1978-02-20 00:37:10', '2020-10-19 05:07:32'),
(88, 'Harsaya Nashiruddin', 'Dk. Veteran No. 390, Tebing Tinggi 53456, Bali', '2002-09-20 14:38:12', '2020-10-19 05:07:32'),
(89, 'Ida Cindy Nuraini', 'Dk. Sampangan No. 559, Administrasi Jakarta Timur 67547, KalBar', '2019-06-05 09:41:17', '2020-10-19 05:07:32'),
(90, 'Hartaka Jayadi Haryanto', 'Jr. Yogyakarta No. 341, Administrasi Jakarta Timur 45104, KalTeng', '2006-11-22 13:46:27', '2020-10-19 05:07:32'),
(91, 'Umar Megantara', 'Gg. Moch. Yamin No. 548, Palu 76076, PapBar', '1982-04-25 17:39:22', '2020-10-19 05:07:32'),
(92, 'Rina Laksita', 'Jr. HOS. Cjokroaminoto (Pasirkaliki) No. 530, Makassar 90226, MalUt', '1980-02-16 04:54:19', '2020-10-19 05:07:32'),
(93, 'Mulya Dabukke', 'Dk. Aceh No. 707, Pematangsiantar 23124, KalSel', '1979-09-07 20:48:02', '2020-10-19 05:07:32'),
(94, 'Ajiono Anggriawan', 'Psr. Bambu No. 44, Administrasi Jakarta Selatan 30753, NTT', '1986-01-26 07:27:55', '2020-10-19 05:07:32'),
(95, 'Siska Rahayu S.Ked', 'Dk. Sutami No. 422, Serang 62120, DIY', '1990-10-30 23:51:36', '2020-10-19 05:07:32'),
(96, 'Eva Prastuti', 'Gg. Baranangsiang No. 5, Tangerang Selatan 78967, JaBar', '2003-04-07 19:44:15', '2020-10-19 05:07:32'),
(97, 'Lanjar Candrakanta Prayoga', 'Ki. Yosodipuro No. 976, Palangka Raya 13059, DKI', '1975-12-07 09:10:33', '2020-10-19 05:07:33'),
(98, 'Kusuma Nasim Situmorang S.H.', 'Dk. BKR No. 243, Semarang 39454, KalSel', '1995-08-04 16:28:26', '2020-10-19 05:07:33'),
(99, 'Elma Victoria Oktaviani M.M.', 'Dk. Kali No. 774, Serang 15643, Gorontalo', '1980-05-19 03:40:33', '2020-10-19 05:07:33'),
(100, 'Cagak Marpaung', 'Jln. K.H. Wahid Hasyim (Kopo) No. 169, Metro 16821, SulTeng', '2000-07-28 03:26:01', '2020-10-19 05:07:33'),
(101, 'Halima Widiastuti', 'Ki. Bagas Pati No. 59, Pasuruan 43335, DIY', '1971-01-26 21:39:27', '2020-10-19 05:07:33'),
(102, 'Cindy Amelia Mardhiyah S.Kom', 'Jln. Bawal No. 31, Pagar Alam 47489, KepR', '1986-09-23 00:51:15', '2020-10-19 05:07:33'),
(103, 'Raisa Hartati M.Kom.', 'Ki. Rajiman No. 92, Batu 28347, KalTeng', '2018-05-20 08:55:21', '2020-10-19 05:07:33'),
(104, 'Siska Agnes Susanti S.IP', 'Jr. Jayawijaya No. 175, Blitar 63504, JaBar', '2017-12-10 10:14:08', '2020-10-19 05:07:33'),
(105, 'Liman Gunawan', 'Gg. Katamso No. 987, Samarinda 31412, SulBar', '2012-12-05 03:14:35', '2020-10-19 05:07:33'),
(106, 'Lintang Usamah M.Farm', 'Jr. Ciwastra No. 590, Lubuklinggau 50964, SulBar', '1984-01-15 11:58:01', '2020-10-19 05:07:33'),
(107, 'Wardaya Bahuwirya Rajasa', 'Jln. Rajawali No. 794, Bandung 56947, SumBar', '1991-10-08 06:46:11', '2020-10-19 05:07:33'),
(108, 'Nadine Riyanti S.I.Kom', 'Ds. Kebonjati No. 133, Balikpapan 11140, Lampung', '2016-10-10 20:37:57', '2020-10-19 05:07:33'),
(109, 'Mitra Saefullah', 'Ds. Wahidin No. 325, Mataram 77722, NTB', '2009-11-25 13:28:05', '2020-10-19 05:07:33'),
(110, 'Kairav Sihotang', 'Jr. K.H. Maskur No. 85, Cirebon 54924, SumUt', '2019-03-16 16:39:43', '2020-10-19 05:07:33'),
(111, 'Gilda Aryani S.Pt', 'Gg. Halim No. 619, Cilegon 49452, Banten', '1975-08-31 07:39:10', '2020-10-19 05:07:33'),
(112, 'Cinta Iriana Rahimah', 'Ds. Batako No. 24, Tegal 77083, Aceh', '1993-11-09 17:28:05', '2020-10-19 05:07:33'),
(113, 'Azalea Oktaviani', 'Dk. Suharso No. 675, Pekalongan 93532, SulUt', '1999-01-10 10:22:36', '2020-10-19 05:07:33'),
(114, 'Lantar Hardiansyah', 'Jr. Suniaraja No. 245, Mojokerto 47334, KalUt', '2003-12-13 01:49:51', '2020-10-19 05:07:33'),
(115, 'Keisha Suci Susanti S.Farm', 'Ds. Panjaitan No. 329, Bukittinggi 50092, Papua', '2002-05-31 00:45:54', '2020-10-19 05:07:33'),
(116, 'Sidiq Opung Pangestu', 'Ki. Baing No. 866, Cirebon 60699, KalSel', '2010-05-20 16:38:08', '2020-10-19 05:07:33'),
(117, 'Panji Gara Nashiruddin S.E.', 'Jln. M.T. Haryono No. 229, Sawahlunto 60737, Banten', '2016-06-08 13:00:41', '2020-10-19 05:07:33'),
(118, 'Irfan Adikara Habibi S.Kom', 'Dk. Umalas No. 777, Sibolga 96544, Jambi', '1971-02-04 07:59:30', '2020-10-19 05:07:33'),
(119, 'Dina Namaga', 'Psr. Cokroaminoto No. 87, Bogor 62787, SulSel', '1985-03-12 01:13:30', '2020-10-19 05:07:34'),
(120, 'Endah Zulaika M.M.', 'Jln. Gajah No. 124, Palu 15243, Bali', '2013-03-14 02:04:46', '2020-10-19 05:07:34'),
(121, 'Ajeng Hartati', 'Dk. Suryo No. 679, Pontianak 36446, SulTra', '1972-12-15 07:35:08', '2020-10-19 05:07:34'),
(122, 'Eli Zulaika', 'Ki. Bass No. 950, Tanjungbalai 54934, SumUt', '1987-06-07 02:55:11', '2020-10-19 05:07:34'),
(123, 'Rendy Pradana', 'Ki. Cikutra Barat No. 720, Madiun 14867, Riau', '1976-12-15 17:47:16', '2020-10-19 05:07:34'),
(124, 'Putri Lala Yulianti S.Psi', 'Jr. Ters. Jakarta No. 454, Parepare 97605, SulTra', '1984-02-01 14:10:29', '2020-10-19 05:07:34'),
(125, 'Wakiman Kuswoyo', 'Ds. Sumpah Pemuda No. 874, Administrasi Jakarta Barat 75329, KalUt', '1980-05-11 12:31:40', '2020-10-19 05:07:34'),
(126, 'Ciaobella Maryati', 'Psr. Basket No. 29, Tasikmalaya 57199, SumSel', '1999-09-16 19:32:31', '2020-10-19 05:07:34'),
(127, 'Kala Rizki Firmansyah', 'Kpg. Merdeka No. 133, Tegal 35724, Banten', '1975-12-17 13:56:27', '2020-10-19 05:07:34'),
(128, 'Wahyu Muhammad Hutasoit M.Pd', 'Ds. Adisumarmo No. 67, Pagar Alam 77251, Riau', '2001-12-15 23:34:27', '2020-10-19 05:07:34'),
(129, 'Laras Pertiwi', 'Dk. Umalas No. 697, Palembang 96983, SumBar', '1983-03-03 03:34:00', '2020-10-19 05:07:34'),
(130, 'Alika Laksmiwati', 'Jln. Kebonjati No. 927, Tarakan 27775, DKI', '2006-01-15 07:38:41', '2020-10-19 05:07:34'),
(131, 'Mala Widiastuti M.Kom.', 'Kpg. Achmad Yani No. 943, Singkawang 21503, MalUt', '1994-03-29 17:23:18', '2020-10-19 05:07:34'),
(132, 'Salsabila Uyainah', 'Kpg. Jaksa No. 825, Kendari 58526, Riau', '1971-07-23 12:08:13', '2020-10-19 05:07:34'),
(133, 'Hasna Melani', 'Kpg. Muwardi No. 938, Probolinggo 74199, SumUt', '1995-07-01 05:54:49', '2020-10-19 05:07:34'),
(134, 'Juli Namaga M.Kom.', 'Ki. Ters. Kiaracondong No. 45, Padangsidempuan 92967, BaBel', '1984-04-20 21:07:13', '2020-10-19 05:07:34'),
(135, 'Vanya Fujiati', 'Kpg. Cut Nyak Dien No. 374, Bogor 55635, NTB', '1996-02-04 12:29:07', '2020-10-19 05:07:34'),
(136, 'Manah Maman Saragih', 'Kpg. Bak Mandi No. 837, Pekalongan 32203, SumUt', '2014-05-17 13:25:47', '2020-10-19 05:07:34'),
(137, 'Mitra Maheswara S.Kom', 'Dk. Basoka No. 15, Kupang 97984, SulBar', '1985-01-19 09:48:45', '2020-10-19 05:07:34'),
(138, 'Kasiyah Hartati', 'Psr. Barasak No. 585, Pematangsiantar 72211, Bali', '2013-05-08 02:28:41', '2020-10-19 05:07:34'),
(139, 'Puput Astuti', 'Ki. Kalimalang No. 424, Gorontalo 79206, JaTim', '2014-01-20 09:08:24', '2020-10-19 05:07:35'),
(140, 'Imam Rajata', 'Gg. Basmol Raya No. 751, Tasikmalaya 40624, KalTim', '1988-03-07 17:32:37', '2020-10-19 05:07:35'),
(141, 'Setya Harjasa Ardianto S.Psi', 'Jln. Ikan No. 791, Gorontalo 64490, KalBar', '1978-06-05 14:55:25', '2020-10-19 05:07:35'),
(142, 'Mahfud Maheswara', 'Dk. Jend. A. Yani No. 58, Padang 34230, JaBar', '2007-05-30 03:08:25', '2020-10-19 05:07:35'),
(143, 'Jono Marsudi Wahyudin M.M.', 'Jln. Pattimura No. 520, Tebing Tinggi 87630, PapBar', '2001-08-23 12:41:28', '2020-10-19 05:07:35'),
(144, 'Rina Palastri', 'Ds. Surapati No. 99, Banjarbaru 39114, KalBar', '1994-06-14 08:43:11', '2020-10-19 05:07:35'),
(145, 'Mutia Pudjiastuti', 'Kpg. Panjaitan No. 6, Langsa 99610, Bengkulu', '1994-08-09 09:51:57', '2020-10-19 05:07:35'),
(146, 'Tasdik Olga Lazuardi', 'Gg. Dipenogoro No. 465, Tebing Tinggi 48824, BaBel', '2020-04-06 18:46:19', '2020-10-19 05:07:35'),
(147, 'Anggabaya Budiman', 'Ds. Cikutra Barat No. 169, Manado 12212, Banten', '1994-06-15 12:45:50', '2020-10-19 05:07:35'),
(148, 'Maida Permata', 'Dk. Bakti No. 798, Banda Aceh 95281, DIY', '1990-02-21 06:19:32', '2020-10-19 05:07:35'),
(149, 'Saiful Rajata M.Farm', 'Jr. K.H. Maskur No. 521, Bengkulu 65171, Lampung', '2003-02-19 23:49:08', '2020-10-19 05:07:35'),
(150, 'Dadap Galih Permadi', 'Ds. Mahakam No. 204, Makassar 36738, JaTeng', '1992-01-12 06:47:47', '2020-10-19 05:07:35'),
(151, 'Amalia Nasyidah', 'Jln. Kebonjati No. 25, Yogyakarta 99298, Gorontalo', '1993-10-10 08:23:31', '2020-10-19 05:07:35'),
(152, 'Eka Zulaika M.Ak', 'Kpg. Kali No. 596, Tarakan 92606, KepR', '1990-02-26 11:28:45', '2020-10-19 05:07:35'),
(153, 'Hasta Banara Setiawan S.E.', 'Ds. Casablanca No. 837, Tanjung Pinang 11639, SumSel', '1973-07-23 02:59:29', '2020-10-19 05:07:35'),
(154, 'Cinthia Puspasari', 'Kpg. Adisucipto No. 736, Mataram 44497, Lampung', '1995-04-21 09:14:42', '2020-10-19 05:07:35'),
(155, 'Garang Najmudin', 'Kpg. Casablanca No. 788, Serang 50729, KalSel', '1992-06-24 07:34:31', '2020-10-19 05:07:35'),
(156, 'Maria Susanti S.Sos', 'Kpg. Tentara Pelajar No. 128, Cilegon 70915, PapBar', '1993-11-13 11:29:25', '2020-10-19 05:07:35'),
(157, 'Harto Karja Iswahyudi M.Farm', 'Ds. Bhayangkara No. 950, Langsa 24209, KalBar', '2010-01-18 15:58:03', '2020-10-19 05:07:35'),
(158, 'Yance Palastri', 'Ds. Suniaraja No. 925, Dumai 89965, KalUt', '1986-01-24 17:49:48', '2020-10-19 05:07:36'),
(159, 'Hana Susanti', 'Ki. Rumah Sakit No. 979, Bima 91151, Bali', '2009-02-10 09:41:47', '2020-10-19 05:07:36'),
(160, 'Jumari Cager Tampubolon M.Kom.', 'Jr. Pahlawan No. 241, Prabumulih 72635, KalTeng', '1976-08-31 14:56:59', '2020-10-19 05:07:36'),
(161, 'Zelaya Iriana Kuswandari', 'Kpg. Ters. Buah Batu No. 139, Bau-Bau 15988, SumBar', '2007-09-12 08:09:43', '2020-10-19 05:07:36'),
(162, 'Sakura Wastuti', 'Psr. Tentara Pelajar No. 559, Tual 80337, SulBar', '2001-02-07 16:29:17', '2020-10-19 05:07:36'),
(163, 'Virman Balijan Nainggolan', 'Gg. Bah Jaya No. 941, Bengkulu 48330, NTB', '2001-10-31 16:54:10', '2020-10-19 05:07:36'),
(164, 'Rahayu Suryatmi S.Farm', 'Jln. Sudirman No. 106, Tanjung Pinang 86497, Lampung', '2013-11-24 20:58:05', '2020-10-19 05:07:36'),
(165, 'Eman Mariadi Saragih', 'Ki. Yoga No. 580, Cirebon 38628, Papua', '1972-04-27 17:35:54', '2020-10-19 05:07:36'),
(166, 'Marwata Tampubolon', 'Dk. Barat No. 93, Tidore Kepulauan 56637, SulUt', '1990-08-15 07:21:38', '2020-10-19 05:07:36'),
(167, 'Embuh Halim', 'Psr. Sudirman No. 112, Yogyakarta 60510, SumUt', '1973-03-02 16:38:56', '2020-10-19 05:07:36'),
(168, 'Johan Haryanto', 'Dk. Baiduri No. 566, Dumai 51275, Lampung', '2011-06-06 05:58:45', '2020-10-19 05:07:36'),
(169, 'Almira Mulyani', 'Jr. Bakau No. 391, Madiun 76825, JaTim', '1979-06-12 03:11:40', '2020-10-19 05:07:36'),
(170, 'Dalima Wastuti', 'Gg. Suharso No. 277, Binjai 78453, Riau', '1992-03-04 16:36:38', '2020-10-19 05:07:36'),
(171, 'Wulan Nasyiah', 'Ds. Laksamana No. 19, Palopo 36760, Riau', '1973-03-10 00:02:05', '2020-10-19 05:07:36'),
(172, 'Fathonah Pertiwi', 'Dk. K.H. Maskur No. 973, Surakarta 50985, SulTeng', '2011-02-27 12:26:35', '2020-10-19 05:07:36'),
(173, 'Bakijan Rajata', 'Psr. Baranang Siang Indah No. 928, Lubuklinggau 98635, DKI', '1974-01-10 04:09:47', '2020-10-19 05:07:36'),
(174, 'Muni Latupono', 'Jr. Flora No. 258, Langsa 68701, Papua', '1976-08-06 08:04:37', '2020-10-19 05:07:36'),
(175, 'Farhunnisa Raina Usada S.E.', 'Jr. Jamika No. 825, Tasikmalaya 41446, JaBar', '2020-09-16 16:50:48', '2020-10-19 05:07:36'),
(176, 'Bagas Utama', 'Dk. Bahagia  No. 604, Bandar Lampung 89506, SulUt', '2002-12-12 22:42:30', '2020-10-19 05:07:36'),
(177, 'Humaira Aryani', 'Ds. Sutarjo No. 97, Ambon 64358, DKI', '1970-01-31 01:54:04', '2020-10-19 05:07:37'),
(178, 'Darijan Pradana S.I.Kom', 'Gg. Bata Putih No. 713, Kotamobagu 84635, Riau', '1972-01-06 14:17:40', '2020-10-19 05:07:37'),
(179, 'Aris Tedi Wacana M.Ak', 'Jln. Sutami No. 310, Administrasi Jakarta Utara 84741, SumUt', '1990-06-15 11:03:24', '2020-10-19 05:07:37'),
(180, 'Ilsa Zulaikha Widiastuti', 'Kpg. Gegerkalong Hilir No. 242, Surabaya 88391, KalSel', '1998-12-13 00:05:57', '2020-10-19 05:07:37'),
(181, 'Reksa Manullang S.T.', 'Ki. Uluwatu No. 953, Banjar 86233, SulTeng', '2005-07-12 10:12:17', '2020-10-19 05:07:37'),
(182, 'Endah Pertiwi', 'Dk. Lembong No. 423, Singkawang 77676, SumBar', '2002-03-24 14:07:27', '2020-10-19 05:07:37'),
(183, 'Labuh Pradipta', 'Jln. Achmad Yani No. 967, Banjar 74130, KepR', '1996-10-20 10:31:56', '2020-10-19 05:07:37'),
(184, 'Paris Riyanti M.Farm', 'Gg. Dr. Junjunan No. 643, Salatiga 55728, KalTeng', '2003-06-29 16:24:46', '2020-10-19 05:07:37'),
(185, 'Mila Rahayu', 'Jr. Bambu No. 499, Payakumbuh 65489, BaBel', '1970-03-02 22:03:49', '2020-10-19 05:07:37'),
(186, 'Hasta Harja Wahyudin M.Farm', 'Kpg. Abdul Rahmat No. 775, Tarakan 19226, SulTeng', '2007-06-02 05:19:03', '2020-10-19 05:07:37'),
(187, 'Rina Karen Laksita S.Gz', 'Ds. Abdul No. 177, Sungai Penuh 11716, Lampung', '1995-08-31 11:56:55', '2020-10-19 05:07:37'),
(188, 'Jamalia Rahimah', 'Psr. Baiduri No. 290, Payakumbuh 13147, JaTeng', '2008-02-04 21:28:16', '2020-10-19 05:07:37'),
(189, 'Yuni Hartati', 'Kpg. Pahlawan No. 225, Pekanbaru 42149, NTT', '1999-01-24 21:49:21', '2020-10-19 05:07:37'),
(190, 'Puti Nurul Wastuti', 'Jln. Baranang No. 59, Padangpanjang 11623, SulTra', '1985-09-25 10:41:58', '2020-10-19 05:07:37'),
(191, 'Ganda Januar', 'Ki. Sutarto No. 790, Blitar 21530, KalTeng', '2010-08-25 05:55:52', '2020-10-19 05:07:37'),
(192, 'Xanana Wahyudin', 'Ds. Tangkuban Perahu No. 310, Palangka Raya 95648, KalSel', '2001-07-16 10:56:26', '2020-10-19 05:07:37'),
(193, 'Nrima Pranawa Wijaya', 'Kpg. Dewi Sartika No. 226, Magelang 10142, SulSel', '2008-01-01 12:01:37', '2020-10-19 05:07:38'),
(194, 'Shania Utami', 'Dk. Ters. Jakarta No. 424, Cirebon 67650, JaBar', '1976-02-13 20:24:01', '2020-10-19 05:07:38'),
(195, 'Salimah Karimah Aryani', 'Dk. Imam Bonjol No. 323, Cimahi 93249, Gorontalo', '1993-05-12 00:50:11', '2020-10-19 05:07:38'),
(196, 'Kani Hasanah S.I.Kom', 'Jr. Mulyadi No. 627, Gorontalo 28145, DIY', '2011-10-28 02:24:55', '2020-10-19 05:07:38'),
(197, 'Yahya Nugroho', 'Gg. Imam Bonjol No. 828, Blitar 92275, Bengkulu', '1997-07-02 01:29:01', '2020-10-19 05:07:38'),
(198, 'Ajiman Argono Setiawan S.Psi', 'Ki. K.H. Maskur No. 387, Binjai 35654, SulBar', '2003-11-25 14:35:51', '2020-10-19 05:07:38'),
(199, 'Emong Jaswadi Iswahyudi', 'Dk. Mahakam No. 61, Parepare 83051, Lampung', '2014-04-01 07:48:45', '2020-10-19 05:07:38'),
(200, 'Bakiman Rosman Waskita S.E.', 'Jln. Sentot Alibasa No. 844, Surakarta 78407, SumBar', '2006-11-20 14:40:48', '2020-10-19 05:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'chaplindeny@gmail.com', 'Deny', '$2y$10$Ybsf0cMV.Gns3jx7bVDRi.5mmaqRZ5A3y5XtFKIOb1Jkn3H8vdUfe', NULL, '2020-10-29 05:49:49', NULL, NULL, NULL, NULL, 1, 0, '2020-10-29 05:33:38', '2020-10-29 05:49:49', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indexes for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indexes for table `komik`
--
ALTER TABLE `komik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orang`
--
ALTER TABLE `orang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `komik`
--
ALTER TABLE `komik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orang`
--
ALTER TABLE `orang`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
