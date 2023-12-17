-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Des 2023 pada 15.42
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tacakra`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabungan`
--

CREATE TABLE `tabungan` (
  `id_tabungan` int(11) NOT NULL,
  `no_kk` varchar(128) DEFAULT NULL,
  `saldo` int(8) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabungan`
--

INSERT INTO `tabungan` (`id_tabungan`, `no_kk`, `saldo`) VALUES
(1, '3328103008020003', 20000),
(2, '3328103008020002', 0),
(3, '3328104805842003', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `jenis_transaksi` varchar(15) NOT NULL,
  `nominal` int(8) NOT NULL,
  `catatan` varchar(128) NOT NULL,
  `metode_pembayaran` varchar(10) NOT NULL,
  `bukti` varchar(128) NOT NULL,
  `status` varchar(10) NOT NULL,
  `id_tabungan` int(11) NOT NULL,
  `tanggal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_user`, `jenis_transaksi`, `nominal`, `catatan`, `metode_pembayaran`, `bukti`, `status`, `id_tabungan`, `tanggal`) VALUES
(1, 47, 'Setoran', 20000, 'iuran 17 an', 'Dana', '471702650180.png', 'Diterima', 1, 1702650180);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `no_kk` char(16) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `no_kk`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(1, 'Admin TA - CAKRA 03/05', '9999999999999999', 'default.jpg', '$2y$10$tswI2xnDTZ9r1tGkKe0/vuoX0/ipxGmRK6vxfdk4LlQ/4m4UoegPm', 1, 1, 200033),
(47, 'KIRANI RIZKIYANA PUTRI', '3328103008020003', 'default.jpg', '$2y$10$5PvkBsGe8bhEbwkrCT/SX.cWqREBomiyobo6lNdztEcSPAlQWUEBu', 2, 1, 1702649033),
(48, 'Abimanyu Surya Putra', '3328103008020002', 'default.jpg', '$2y$10$W04D67vPMt4aggRVIRGio.yuesM5slf3C9qMBfUGC8WPjWFJFkDLu', 2, 1, 1702711867),
(49, 'Salsabilah Nur Fitri Aeni', '3328104805842003', 'default.jpg', '$2y$10$r4O4TL9U4bvRbeSgksP/Wuofr4Wq3atPx5361zhKMxg1sMQVMi4qa', 2, 1, 1702714035);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'Warga');

-- --------------------------------------------------------

--
-- Struktur dari tabel `warga`
--

CREATE TABLE `warga` (
  `no_kk` char(16) NOT NULL,
  `nama` varchar(125) DEFAULT NULL,
  `komplek` varchar(5) DEFAULT NULL,
  `jenis_kelamin` varchar(16) DEFAULT NULL,
  `no_telepon` varchar(16) DEFAULT NULL,
  `tahun_masuk` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `warga`
--

INSERT INTO `warga` (`no_kk`, `nama`, `komplek`, `jenis_kelamin`, `no_telepon`, `tahun_masuk`) VALUES
('3328103008020002', 'Abimanyu Surya Putra', '3C', 'Laki-laki', '085608922134', 2023),
('3328103008020003', 'Kirani Rizkiyana putri', '2B', 'Perempuan', '085608922134', 2023),
('3328104805842003', 'Salsabilah Nur Fitri Aeni', '1A', 'Perempuan', '085725261597', 2023);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tabungan`
--
ALTER TABLE `tabungan`
  ADD PRIMARY KEY (`id_tabungan`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `user_id` (`id_user`) USING BTREE,
  ADD KEY `tabungan_id` (`id_tabungan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_kk` (`no_kk`),
  ADD KEY `role_id` (`role_id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `warga`
--
ALTER TABLE `warga`
  ADD PRIMARY KEY (`no_kk`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tabungan`
--
ALTER TABLE `tabungan`
  MODIFY `id_tabungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
