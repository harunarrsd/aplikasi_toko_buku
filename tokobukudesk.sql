-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 18 Jul 2017 pada 03.46
-- Versi Server: 5.5.27
-- Versi PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `tokobukudesk`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE IF NOT EXISTS `buku` (
  `id_buku` varchar(20) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `noisbn` varchar(20) NOT NULL,
  `penulis` varchar(50) NOT NULL,
  `penerbit` varchar(30) NOT NULL,
  `tahun` varchar(5) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga_pokok` double(10,2) NOT NULL,
  `harga_jual` int(10) NOT NULL,
  `ppn` int(11) NOT NULL,
  `diskon` int(11) NOT NULL,
  PRIMARY KEY (`id_buku`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `noisbn`, `penulis`, `penerbit`, `tahun`, `stok`, `harga_pokok`, `harga_jual`, `ppn`, `diskon`) VALUES
('123', '5 cm', '23233', 'dsfkfmk', 'ksfmdfnmd', '1990', 25, 24343.00, 32324, 10, 10),
('124', 'sfdfdgga', '3434', 'fdfdggfgd', 'ddafdffs', '1990', 44, 3232.00, 50000, 32, 21),
('125', 'ddasda', '232', 'daddf', 'fdfdfd', '1997', 30, 25000.00, 30000, 12, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `distributor`
--

CREATE TABLE IF NOT EXISTS `distributor` (
  `id_distributor` int(11) NOT NULL AUTO_INCREMENT,
  `nama_distributor` varchar(100) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `telepon` varchar(14) NOT NULL,
  PRIMARY KEY (`id_distributor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76544 ;

--
-- Dumping data untuk tabel `distributor`
--

INSERT INTO `distributor` (`id_distributor`, `nama_distributor`, `alamat`, `telepon`) VALUES
(1234, 'bedul rosid', 'bogor', '09876546789'),
(76543, 'harun', 'depok', '767364');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kasir`
--

CREATE TABLE IF NOT EXISTS `kasir` (
  `id_kasir` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `telepon` varchar(14) NOT NULL,
  `status` varchar(12) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `akses` varchar(6) NOT NULL,
  PRIMARY KEY (`id_kasir`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

--
-- Dumping data untuk tabel `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nama`, `alamat`, `telepon`, `status`, `username`, `password`, `akses`) VALUES
(101, 'harun', 'jl nusa indah rt.008/05', '089615160238', 'aktif', 'harun', 'harun123', 'kasir'),
(102, 'arrosid', 'jl raya bogor km.30', '0987645678', 'aktif', 'arrosid', 'arrosid123', 'kasir'),
(103, 'bedul', 'jalan nusa indah rt.008/005', '089615160238', 'Aktif', 'bedul', '321bedul', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasok`
--

CREATE TABLE IF NOT EXISTS `pasok` (
  `id_pasok` int(11) NOT NULL AUTO_INCREMENT,
  `id_distributor` int(11) NOT NULL,
  `id_buku` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` varchar(11) NOT NULL,
  PRIMARY KEY (`id_pasok`),
  KEY `id_distributor` (`id_distributor`,`id_buku`),
  KEY `id_buku` (`id_buku`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=779 ;

--
-- Dumping data untuk tabel `pasok`
--

INSERT INTO `pasok` (`id_pasok`, `id_distributor`, `id_buku`, `jumlah`, `tanggal`) VALUES
(764, 1234, '123', 10, '2017-02-01'),
(765, 1234, '125', 8, '2002-02-17'),
(777, 76543, '123', 5, '2017-02-09'),
(778, 1234, '124', 10, '2017-02-12');

--
-- Trigger `pasok`
--
DROP TRIGGER IF EXISTS `updatestokbukupasok`;
DELIMITER //
CREATE TRIGGER `updatestokbukupasok` AFTER INSERT ON `pasok`
 FOR EACH ROW begin
update buku
set stok = stok + new.jumlah
where id_buku = new.id_buku;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE IF NOT EXISTS `penjualan` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `id_penjualan` varchar(11) NOT NULL,
  `id_buku` varchar(20) NOT NULL,
  `id_kasir` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(10) NOT NULL,
  `tanggal` varchar(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `id_buku` (`id_buku`),
  KEY `id_kasir` (`id_kasir`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`no`, `id_penjualan`, `id_buku`, `id_kasir`, `jumlah`, `total`, `tanggal`) VALUES
(1, 'BK.456.1', '125', 101, 2, 60000, '2017-02-12'),
(2, 'BK.456.2', '124', 102, 5, 210000, '2017-02-12'),
(3, 'BK.456.3', '125', 103, 4, 140000, '2017-02-12'),
(4, 'BK.456.4', '125', 102, 2, 60000, '2017-02-05'),
(5, 'BK.456.5', '125', 101, 3, 90000, '2017-02-07'),
(6, 'BK.456.6', '125', 101, 6, 180000, '2017-02-07');

--
-- Trigger `penjualan`
--
DROP TRIGGER IF EXISTS `updatestokbukupenjualan`;
DELIMITER //
CREATE TRIGGER `updatestokbukupenjualan` AFTER INSERT ON `penjualan`
 FOR EACH ROW begin
update buku
set stok = stok - new.jumlah
where id_buku = new.id_buku;
END
//
DELIMITER ;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pasok`
--
ALTER TABLE `pasok`
  ADD CONSTRAINT `pasok_ibfk_1` FOREIGN KEY (`id_distributor`) REFERENCES `distributor` (`id_distributor`),
  ADD CONSTRAINT `pasok_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`),
  ADD CONSTRAINT `penjualan_ibfk_3` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
