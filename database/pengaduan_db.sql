-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2021 at 04:40 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengaduan_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_masyarakat`
--

CREATE TABLE `tb_masyarakat` (
  `id` bigint(20) NOT NULL,
  `nik` char(16) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_masyarakat`
--

INSERT INTO `tb_masyarakat` (`id`, `nik`, `nama`, `username`, `password`, `telp`) VALUES
(10, '0987654321123456', 'Nama Warga 2', 'warga2', '209bddf8c92d748b8dbfe36c64c95a4dabc8ffb8', '087741130500'),
(11, '0987654321456789', 'Nama Warga 3', 'warga3', '09cad029366f5d94782483e667d3eede14102801', '082133455678'),
(12, '1234567890098765', 'Nama Warga 1', 'warga1', 'ae7fc2228fffd444dc7920067cb79f7f80dd56b4', '080041130522'),
(13, '1234567890987645', 'Nama Warga 4', 'warga4', 'cb9935e328bf37ddf9676cc0cf698c108274aac6', '087741130522'),
(14, '1234567890987654', 'Nama Warga 5', 'warga5', 'fb89bf3381234da7a91eb3e891c9b3f362b03510', '082133455678');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengaduan`
--

CREATE TABLE `tb_pengaduan` (
  `id` bigint(20) NOT NULL,
  `tgl` date NOT NULL,
  `nik` char(16) NOT NULL,
  `isi_laporan` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('ditanggapi','proses','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengaduan`
--

INSERT INTO `tb_pengaduan` (`id`, `tgl`, `nik`, `isi_laporan`, `foto`, `status`) VALUES
(20, '2021-01-09', '1234567890987654', 'Lapor, Mohon bantuannya di desa kami desa sukahati telah terjadi banjir bandang yang sangat besar, mohon segera kirimkan bantuan kedesa kami\r\nTerimakasih', 'Banjir3.jpg', 'proses'),
(21, '2021-01-09', '1234567890098765', 'Lapor, mohon bantuannya telah terjadi longsor yang besar di desa kami di desa sukahati mohon segera kirimkan bantuan ke desa kami\r\nTerimakasih', 'longsor1.jpg', 'selesai'),
(22, '2021-01-09', '0987654321123456', 'Lapor, mohon bantuannya telah terjadi kebakaran besar di desa kami tepatnya dirumah ibu warga, mohon segera dikirimkan mobil pemadam kebakaran\r\nTerimakasih', 'kebakaran1.jpg', 'proses'),
(23, '2021-01-09', '0987654321123456', 'Lapor, mohon dibantu warga kami saat ini telah diterjang banjir, mohon segera kirimkan kami bahan makanan untuk diposko desa sukahati\r\nTerimakasih', 'Banjir4.jpg', 'ditanggapi');

-- --------------------------------------------------------

--
-- Table structure for table `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `id` bigint(20) NOT NULL,
  `nama_petugas` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telp` varchar(255) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_petugas`
--

INSERT INTO `tb_petugas` (`id`, `nama_petugas`, `username`, `password`, `telp`, `level`) VALUES
(13, 'Akang Admin', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '087741130522', 'admin'),
(14, 'Petugas', 'petugas', '670489f94b6997a870b148f74744ee5676304925', '087741130522', 'petugas');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tanggapan`
--

CREATE TABLE `tb_tanggapan` (
  `id` bigint(20) NOT NULL,
  `id_pengaduan` bigint(20) NOT NULL,
  `tgl_tanggapan` date NOT NULL,
  `tanggapan` text NOT NULL,
  `id_petugas` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tanggapan`
--

INSERT INTO `tb_tanggapan` (`id`, `id_pengaduan`, `tgl_tanggapan`, `tanggapan`, `id_petugas`) VALUES
(3, 2, '2020-04-30', 'andi isi ya', 2),
(4, 3, '2020-04-30', ';ofalah ;alhf a;fha;ohf;ahfda', 2),
(5, 7, '2020-05-01', 'kami akan segera menyelesaikan nya\r\n', 2),
(6, 4, '2020-05-01', 'FDAdWADGFDA', 2),
(7, 11, '2021-01-08', 'ok', 2),
(8, 12, '2021-01-09', 'terimakasih', 13),
(9, 13, '2021-01-09', 'Baik terimakasih atas laporannya akan segara kami lakukan tindakan dan bantuan kelokasi', 13),
(10, 17, '2021-01-09', 'Terimakasih atas laporannya\r\nTim kami dan semua bantuan akan segera kami kerahkan dan siap untuk membantu dengan sepenuh hati\r\nMohon ditunggu dengan sabar dan tenang\r\nTerimakasih', 13),
(11, 15, '2021-01-09', 'Terimakasih atas laporannya\r\nTim kami dan semua bantuan akan segera kami kerahkan dan siap untuk membantu dengan sepenuh hati\r\nMohon ditunggu dengan sabar dan tenang\r\nTerimakasih', 13),
(12, 16, '2021-01-09', 'Terimakasih atas laporannya\r\nTim kami dan semua bantuan akan segera kami kerahkan dan siap untuk membantu dengan sepenuh hati\r\nMohon ditunggu dengan sabar dan tenang\r\nTerimakasih', 13),
(13, 18, '2021-01-09', 'Terimakasih atas laporannya\r\nTim kami dan semua bantuan akan segera kami kerahkan dan siap untuk membantu dengan sepenuh hati\r\nMohon ditunggu dengan sabar dan tenang\r\nTerimakasih', 13),
(14, 19, '2021-01-09', 'Terimakasih atas laporannya\r\nTim kami dan semua bantuan akan segera kami kerahkan dan siap untuk membantu dengan sepenuh hati\r\nMohon ditunggu dengan sabar dan tenang\r\nTerimakasih', 13),
(15, 23, '2021-01-09', 'Terimakasih atas laporannya\r\nTim kami dan semua bantuan akan segera kami kerahkan dan siap untuk membantu dengan sepenuh hati\r\nMohon ditunggu dengan sabar dan tenang\r\nTerimakasih', 13),
(16, 21, '2021-01-09', 'Terimakasih atas laporannya\r\nTim kami dan semua bantuan akan segera kami kerahkan dan siap untuk membantu dengan sepenuh hati\r\nMohon ditunggu dengan sabar dan tenang\r\nTerimakasih', 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_masyarakat`
--
ALTER TABLE `tb_masyarakat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pengaduan`
--
ALTER TABLE `tb_pengaduan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_tanggapan`
--
ALTER TABLE `tb_tanggapan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_masyarakat`
--
ALTER TABLE `tb_masyarakat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tb_pengaduan`
--
ALTER TABLE `tb_pengaduan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tb_tanggapan`
--
ALTER TABLE `tb_tanggapan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
