-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jul 2025 pada 13.43
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uang_rakyat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `iuran`
--

CREATE TABLE `iuran` (
  `id_iuran` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time DEFAULT NULL,
  `id_warga` int(11) DEFAULT NULL,
  `bulan` varchar(20) DEFAULT NULL,
  `tahun` year(4) DEFAULT NULL,
  `jenis` enum('masuk','keluar') NOT NULL,
  `nominal` int(11) NOT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `status` enum('Lunas','Belum Lunas') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `iuran`
--

INSERT INTO `iuran` (`id_iuran`, `tanggal`, `jam`, `id_warga`, `bulan`, `tahun`, `jenis`, `nominal`, `kategori`, `deskripsi`, `jumlah`, `status`, `created_at`, `updated_at`) VALUES
(116, '2025-07-03', NULL, 31, 'Juli', '2025', 'masuk', 15000, NULL, NULL, NULL, 'Lunas', '2025-07-03 02:11:33', '2025-07-03 02:11:33'),
(117, '2025-07-03', NULL, 29, 'Juli', '2025', 'masuk', 15000, NULL, NULL, NULL, 'Lunas', '2025-07-03 02:11:49', '2025-07-03 02:11:49'),
(118, '2025-07-03', NULL, 32, 'Juli', '2025', 'masuk', 5000, NULL, NULL, NULL, '', '2025-07-03 02:12:03', '2025-07-03 02:12:03'),
(119, '2025-07-03', NULL, 33, 'Juli', '2025', 'masuk', 20000, NULL, NULL, NULL, 'Lunas', '2025-07-03 02:12:18', '2025-07-03 02:12:18'),
(120, '2025-07-03', NULL, 34, 'Juli', '2025', 'masuk', 10000, NULL, NULL, NULL, 'Lunas', '2025-07-03 14:16:54', '2025-07-03 14:16:54'),
(121, '2025-07-04', NULL, 35, 'Juli', '2025', 'masuk', 10000, NULL, NULL, NULL, 'Lunas', '2025-07-04 14:47:14', '2025-07-04 14:47:14'),
(122, '2025-07-04', NULL, 36, 'Juli', '2025', 'masuk', 100000, NULL, NULL, NULL, 'Lunas', '2025-07-04 15:57:51', '2025-07-04 15:57:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `tipe` enum('Masuk','Keluar') DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `id_warga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis` enum('masuk','keluar') NOT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_warga`, `jumlah`, `tanggal`, `jenis`, `kategori`, `keterangan`, `created_at`, `updated_at`, `id_user`) VALUES
(124, 31, 15000, '2025-07-03', 'masuk', NULL, 'Pembayaran iuran Juli 2025 - Freya', '2025-07-03 02:11:33', '2025-07-03 02:11:33', 1),
(125, 29, 15000, '2025-07-03', 'masuk', NULL, 'Pembayaran iuran Juli 2025 - Jokowi', '2025-07-03 02:11:49', '2025-07-03 02:11:49', 1),
(126, 33, 20000, '2025-07-03', 'masuk', NULL, 'Pembayaran iuran Juli 2025 - Asep', '2025-07-03 02:12:18', '2025-07-03 02:12:18', 1),
(127, 1, 15000, '2025-07-03', 'keluar', NULL, 'Pengeluaran Kegiatan RT - Beli sapu', '2025-07-03 02:14:39', '2025-07-03 02:14:39', 1),
(128, 1, 10000, '2025-07-03', 'keluar', NULL, 'Pengeluaran Kebersihan - Beli Sapu Lidi', '2025-07-03 02:15:10', '2025-07-03 02:15:10', 1),
(129, 0, 25000, '2025-07-03', 'keluar', NULL, 'Untuk fakir Miskin', '2025-07-02 19:16:42', '2025-07-02 19:16:42', 1),
(130, 34, 10000, '2025-07-03', 'masuk', NULL, 'Pembayaran iuran Juli 2025 - Gibran', '2025-07-03 14:16:54', '2025-07-03 14:16:54', 3),
(131, 35, 10000, '2025-07-04', 'masuk', NULL, 'Pembayaran iuran Juli 2025 - Agus', '2025-07-04 14:47:14', '2025-07-04 14:47:14', 3),
(132, 0, 20000, '2025-07-04', 'masuk', NULL, '17 Agustus ', '2025-07-04 07:49:48', '2025-07-04 07:49:48', 1),
(133, 1, 40000, '2025-07-01', 'keluar', NULL, 'Pengeluaran Kegiatan RT - makan-makan ibu-ibu TKK', '2025-07-04 14:54:09', '2025-07-04 14:54:09', 1),
(134, 36, 100000, '2025-07-04', 'masuk', NULL, 'Pembayaran iuran Juli 2025 - Arif', '2025-07-04 15:57:51', '2025-07-04 15:57:51', 3),
(135, 0, 50000, '2025-07-04', 'keluar', NULL, 'Membangun Pos Ronda', '2025-07-04 08:59:19', '2025-07-04 08:59:19', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `warga`
--

CREATE TABLE `warga` (
  `warga_id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `no_kk` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `rt_rw` varchar(10) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `rt` varchar(10) DEFAULT '001',
  `rw` varchar(10) DEFAULT '001',
  `keterangan` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'aktif',
  `tanggal_daftar` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `warga`
--

INSERT INTO `warga` (`warga_id`, `nama`, `no_kk`, `alamat`, `rt_rw`, `no_hp`, `rt`, `rw`, `keterangan`, `status`, `tanggal_daftar`, `created_at`, `updated_at`) VALUES
(29, 'Jokowi', NULL, 'Jl A. No 1', NULL, '123-4567-8989', '001', '001', 'orang baik', 'aktif', '2025-07-03 02:06:10', '2025-07-02 19:06:10', '2025-07-02 19:06:10'),
(30, 'Joni', NULL, 'jl A. NO 2', NULL, '987-6545-6789', '001', '001', NULL, 'aktif', '2025-07-03 02:06:42', '2025-07-02 19:06:42', '2025-07-02 19:06:42'),
(31, 'Freya', NULL, 'jl A. NO 3', NULL, '987-6543-4567', '001', '001', 'orang baik', 'aktif', '2025-07-03 02:07:10', '2025-07-02 19:07:10', '2025-07-02 19:07:10'),
(32, 'Yuda', NULL, 'jl A. NO 4', NULL, '987-6543-4567', '001', '001', 'Kurang Mampu', 'aktif', '2025-07-03 02:07:52', '2025-07-02 19:07:52', '2025-07-02 19:07:52'),
(33, 'Asep', NULL, 'jl A. NO 5', NULL, '456-7898-7654', '001', '001', 'Orang Kaya', 'aktif', '2025-07-03 02:08:16', '2025-07-02 19:08:16', '2025-07-02 19:08:16'),
(34, 'Gibran', NULL, 'jl A. NO 6', NULL, '345-6789-8765', '001', '001', 'Anak Orang Kaya', 'aktif', '2025-07-03 14:16:18', '2025-07-03 07:16:18', '2025-07-03 07:16:18'),
(35, 'Agus', NULL, 'jl A. NO 6', NULL, '234-5678-8887', '001', '001', 'Kurang Mampu', 'aktif', '2025-07-04 14:46:20', '2025-07-04 07:46:20', '2025-07-04 07:46:20'),
(36, 'Arif', NULL, 'jl A. NO 7', NULL, '345-6789-9999', '001', '001', 'Orang Kaya', 'aktif', '2025-07-04 15:57:02', '2025-07-04 08:57:02', '2025-07-04 08:57:02');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `iuran`
--
ALTER TABLE `iuran`
  ADD PRIMARY KEY (`id_iuran`),
  ADD KEY `id_warga` (`id_warga`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `warga`
--
ALTER TABLE `warga`
  ADD PRIMARY KEY (`warga_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `iuran`
--
ALTER TABLE `iuran`
  MODIFY `id_iuran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT untuk tabel `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `warga`
--
ALTER TABLE `warga`
  MODIFY `warga_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `iuran`
--
ALTER TABLE `iuran`
  ADD CONSTRAINT `iuran_ibfk_1` FOREIGN KEY (`id_warga`) REFERENCES `warga` (`warga_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
