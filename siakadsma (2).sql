-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2022 at 01:03 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakadsma`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `uname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pwd` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`uname`, `pwd`, `level`) VALUES
('12345', '81dc9bdb52d04dc20036dbd8313ed055', 1),
('admin', '21232f297a57a5a743894a0e4a801fc3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `nip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_kelas` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`nip`, `nama`, `jk`, `alamat`, `kode_kelas`) VALUES
('12345', 'Bambang', 'L', 'jalan', 'K1'),
('123456', 'Doni', 'L', 'jalan', 'K2');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `kode_mp` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_kelas` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_semester` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_ta` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hari` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kode_kelas` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip_wali` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kode_kelas`, `nama`, `nip_wali`) VALUES
('K1', 'Kelas 1', '12345'),
('K2', 'Kelas 2', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `kode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`kode`, `nama`) VALUES
('IPA', 'Ilmu Pengetahuan Alam');

-- --------------------------------------------------------

--
-- Table structure for table `murid`
--

CREATE TABLE `murid` (
  `nisn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_kelas` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `murid`
--

INSERT INTO `murid` (`nisn`, `nama`, `jk`, `alamat`, `kode_kelas`) VALUES
('19104062', 'Tuti', 'P', 'mendoan', 'K1');

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_mp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pertemuan` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `alpha` int(11) NOT NULL,
  `ijin` int(11) NOT NULL,
  `sakit` int(11) NOT NULL,
  `kode_semester` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_ta` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nisn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `presensi`
--

INSERT INTO `presensi` (`kode`, `kode_mp`, `pertemuan`, `tanggal`, `alpha`, `ijin`, `sakit`, `kode_semester`, `kode_ta`, `nisn`) VALUES
('19104062', 'IPA', 1, '2022-12-16', 1, 0, 0, 'S001', 'TA001', '19104062');

-- --------------------------------------------------------

--
-- Table structure for table `rapot`
--

CREATE TABLE `rapot` (
  `id` int(11) NOT NULL,
  `nisn` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_mp` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_semester` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_ta` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilaipts` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilaipas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rapot`
--

INSERT INTO `rapot` (`id`, `nisn`, `kode_mp`, `kode_semester`, `kode_ta`, `nilaipts`, `nilaipas`) VALUES
(61, '19104062', 'IPA', 'S001', 'TA001', '91232', ''),
(62, '19104062', 'IPA', 'S001', 'TA001', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `kode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`kode`, `nama`, `status`) VALUES
('S001', 'Ganjil', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `kode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tahun_ajaran`
--

INSERT INTO `tahun_ajaran` (`kode`, `nama`) VALUES
('TA001', '2021/2022');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`uname`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD KEY `kode_mp` (`kode_mp`),
  ADD KEY `kode_kelas` (`kode_kelas`),
  ADD KEY `kode_semester` (`kode_semester`),
  ADD KEY `kode_ta` (`kode_ta`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kode_kelas`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `murid`
--
ALTER TABLE `murid`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `kode_kelas` (`kode_kelas`);

--
-- Indexes for table `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `kode_semester` (`kode_semester`),
  ADD KEY `kode_ta` (`kode_ta`),
  ADD KEY `kode_mp` (`kode_mp`);

--
-- Indexes for table `rapot`
--
ALTER TABLE `rapot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `kode_mp` (`kode_mp`),
  ADD KEY `kode_semester` (`kode_semester`),
  ADD KEY `kode_ta` (`kode_ta`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  ADD PRIMARY KEY (`kode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rapot`
--
ALTER TABLE `rapot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`kode_ta`) REFERENCES `tahun_ajaran` (`kode`),
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`kode_mp`) REFERENCES `mapel` (`kode`),
  ADD CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`kode_kelas`) REFERENCES `kelas` (`kode_kelas`),
  ADD CONSTRAINT `jadwal_ibfk_4` FOREIGN KEY (`kode_semester`) REFERENCES `semester` (`kode`);

--
-- Constraints for table `murid`
--
ALTER TABLE `murid`
  ADD CONSTRAINT `murid_ibfk_2` FOREIGN KEY (`kode_kelas`) REFERENCES `kelas` (`kode_kelas`);

--
-- Constraints for table `presensi`
--
ALTER TABLE `presensi`
  ADD CONSTRAINT `presensi_ibfk_1` FOREIGN KEY (`nisn`) REFERENCES `murid` (`nisn`),
  ADD CONSTRAINT `presensi_ibfk_2` FOREIGN KEY (`kode_ta`) REFERENCES `tahun_ajaran` (`kode`),
  ADD CONSTRAINT `presensi_ibfk_3` FOREIGN KEY (`kode_semester`) REFERENCES `semester` (`kode`),
  ADD CONSTRAINT `presensi_ibfk_4` FOREIGN KEY (`kode_mp`) REFERENCES `mapel` (`kode`);

--
-- Constraints for table `rapot`
--
ALTER TABLE `rapot`
  ADD CONSTRAINT `rapot_ibfk_1` FOREIGN KEY (`kode_semester`) REFERENCES `semester` (`kode`),
  ADD CONSTRAINT `rapot_ibfk_2` FOREIGN KEY (`kode_ta`) REFERENCES `tahun_ajaran` (`kode`),
  ADD CONSTRAINT `rapot_ibfk_3` FOREIGN KEY (`nisn`) REFERENCES `murid` (`nisn`),
  ADD CONSTRAINT `rapot_ibfk_4` FOREIGN KEY (`kode_mp`) REFERENCES `mapel` (`kode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
