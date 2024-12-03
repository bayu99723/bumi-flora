-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Des 2024 pada 10.19
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gudang_belakang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `unit` enum('buah','pcs','unit','psg','btg','kg','mtr','bks','roll','bal','ktk','pak','kpg','set','lbr','glg','sak','ikat','btl','jrg','liter','gram') NOT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `periode` varchar(7) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `stok_bulan_lalu` int(11) DEFAULT 0,
  `stok_bulan_ini` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `jumlah`, `unit`, `kategori`, `periode`, `keterangan`, `stok_bulan_lalu`, `stok_bulan_ini`) VALUES
(1, 'BRG001', 'Dexlite', 2000, 'liter', 'BBM', '2024-12', 'Barang OK', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `fraction`
--

CREATE TABLE `fraction` (
  `id` int(11) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `id_brg_dgnkan` int(11) NOT NULL,
  `banyak` varchar(255) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `fraction`
--

INSERT INTO `fraction` (`id`, `Nama`, `id_brg_dgnkan`, `banyak`, `tanggal`) VALUES
(1, 'Implasment', 1, '3', '2024-12-03'),
(2, 'bibitan', 4, '3', '2024-12-03'),
(3, 'traksi', 5, '4', '2024-12-03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','staff') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'staff', 'staff', 'staff', '2024-11-28 07:28:22'),
(2, 'admin', 'admin', 'admin', '2024-11-28 08:08:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL,
  `Nama_Kendaraan` varchar(255) NOT NULL,
  `id_brg_dgnkan` int(11) NOT NULL,
  `banyak` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `vehicle`
--

INSERT INTO `vehicle` (`id`, `Nama_Kendaraan`, `id_brg_dgnkan`, `banyak`, `tanggal`) VALUES
(1, 'Hiline 01', 9, 12, '2024-11-28'),
(2, 'Hiline 02', 9, 13, '2024-11-28'),
(4, 'Catterpillar', 4, 23, '2024-11-28'),
(5, 'bayu', 8, 2, '2024-11-28');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_barang` (`kode_barang`);

--
-- Indeks untuk tabel `fraction`
--
ALTER TABLE `fraction`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `fraction`
--
ALTER TABLE `fraction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
