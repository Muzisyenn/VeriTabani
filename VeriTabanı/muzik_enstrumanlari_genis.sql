-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 22 Ara 2024, 17:38:42
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `muzik_enstrumanlari_genis`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `enstrumanlar`
--

CREATE TABLE `enstrumanlar` (
  `enstruman_id` int(11) NOT NULL,
  `ad` varchar(100) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `marka_id` int(11) NOT NULL,
  `fiyat` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `renk` varchar(30) DEFAULT NULL,
  `yapim_tarihi` date DEFAULT NULL,
  `tedarikci_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `enstrumanlar`
--

INSERT INTO `enstrumanlar` (`enstruman_id`, `ad`, `kategori_id`, `marka_id`, `fiyat`, `stok`, `renk`, `yapim_tarihi`, `tedarikci_id`) VALUES
(1, 'Akustik Gitar', 1, 2, 3000.00, 20, 'Kahverengi', '2023-03-01', 1),
(2, 'Elektro Gitar', 1, 3, 6000.00, 15, 'Siyah', '2022-07-01', 2),
(3, 'Bas Gitar', 1, 3, 5000.00, 10, 'Mavi', '2023-01-15', 1),
(4, 'Flüt', 2, 1, 800.00, 50, 'Gümüş', '2021-05-30', 3),
(5, 'Keman', 1, 1, 1500.00, 25, 'Kahverengi', '2022-10-12', 2),
(6, 'Davul', 3, 6, 10000.00, 5, 'Kırmızı', '2023-02-15', 1),
(7, 'Synthesizer', 4, 4, 15000.00, 3, 'Siyah', '2023-06-20', 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `kategori_id` int(11) NOT NULL,
  `ad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`kategori_id`, `ad`) VALUES
(1, 'Telli'),
(2, 'Üflemeli'),
(3, 'Vurmalı'),
(4, 'Tuşlu'),
(5, 'Elektronik');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `kullanici_id` int(11) NOT NULL,
  `ad` varchar(100) NOT NULL,
  `soyad` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `sifre` varchar(255) NOT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `adres` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`kullanici_id`, `ad`, `soyad`, `email`, `sifre`, `telefon`, `adres`) VALUES
(1, 'Ali', 'Yılmaz', 'ali@example.com', 'sifre123', '05431234567', 'İstanbul, Türkiye'),
(2, 'Ayşe', 'Kara', 'ayse@example.com', 'sifre456', '05531234567', 'Ankara, Türkiye'),
(3, 'Mehmet', 'Öz', 'mehmet@example.com', 'sifre789', '05631234567', 'İzmir, Türkiye');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `markalar`
--

CREATE TABLE `markalar` (
  `marka_id` int(11) NOT NULL,
  `ad` varchar(50) NOT NULL,
  `ulke` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `markalar`
--

INSERT INTO `markalar` (`marka_id`, `ad`, `ulke`) VALUES
(1, 'Yamaha', 'Japonya'),
(2, 'Fender', 'ABD'),
(3, 'Gibson', 'ABD'),
(4, 'Roland', 'Japonya'),
(5, 'Korg', 'Japonya'),
(6, 'Pearl', 'ABD');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisler`
--

CREATE TABLE `siparisler` (
  `siparis_id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `siparis_tarihi` datetime DEFAULT current_timestamp(),
  `toplam_tutar` decimal(10,2) NOT NULL,
  `durum` enum('Beklemede','Tamamlandı','İptal Edildi') DEFAULT 'Beklemede'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `siparisler`
--

INSERT INTO `siparisler` (`siparis_id`, `kullanici_id`, `siparis_tarihi`, `toplam_tutar`, `durum`) VALUES
(1, 1, '2024-12-22 19:27:46', 7000.00, 'Tamamlandı'),
(2, 2, '2024-12-22 19:27:46', 3000.00, 'Beklemede'),
(3, 3, '2024-12-22 19:27:46', 10000.00, 'Tamamlandı');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparis_detaylari`
--

CREATE TABLE `siparis_detaylari` (
  `siparis_detay_id` int(11) NOT NULL,
  `siparis_id` int(11) NOT NULL,
  `enstruman_id` int(11) NOT NULL,
  `adet` int(11) NOT NULL,
  `birim_fiyat` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `siparis_detaylari`
--

INSERT INTO `siparis_detaylari` (`siparis_detay_id`, `siparis_id`, `enstruman_id`, `adet`, `birim_fiyat`) VALUES
(1, 1, 1, 2, 3000.00),
(2, 1, 5, 1, 1500.00),
(3, 2, 6, 1, 10000.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tedarikciler`
--

CREATE TABLE `tedarikciler` (
  `tedarikci_id` int(11) NOT NULL,
  `ad` varchar(100) NOT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `adres` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `tedarikciler`
--

INSERT INTO `tedarikciler` (`tedarikci_id`, `ad`, `telefon`, `email`, `adres`) VALUES
(1, 'Müzik Dünyası', '05341234567', 'info@muzikdunyasi.com', 'İstanbul, Türkiye'),
(2, 'Ses ve Nota', '05461239876', 'iletisim@sesvenota.com', 'Ankara, Türkiye'),
(3, 'Enstrüman Market', '05531234567', 'destek@enstrumanmarket.com', 'İzmir, Türkiye');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorumlar`
--

CREATE TABLE `yorumlar` (
  `yorum_id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `enstruman_id` int(11) NOT NULL,
  `yorum` text NOT NULL,
  `puan` int(11) DEFAULT NULL CHECK (`puan` between 1 and 5),
  `yorum_tarihi` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `yorumlar`
--

INSERT INTO `yorumlar` (`yorum_id`, `kullanici_id`, `enstruman_id`, `yorum`, `puan`, `yorum_tarihi`) VALUES
(1, 1, 1, 'Çok güzel bir gitar, sesi mükemmel!', 5, '2024-12-22 19:27:46'),
(2, 2, 6, 'Bateri kaliteli ama biraz pahalı.', 4, '2024-12-22 19:27:46'),
(3, 3, 4, 'Flüt başlangıç seviyesi için harika.', 5, '2024-12-22 19:27:46');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `enstrumanlar`
--
ALTER TABLE `enstrumanlar`
  ADD PRIMARY KEY (`enstruman_id`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `marka_id` (`marka_id`),
  ADD KEY `tedarikci_id` (`tedarikci_id`);

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`kullanici_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `markalar`
--
ALTER TABLE `markalar`
  ADD PRIMARY KEY (`marka_id`);

--
-- Tablo için indeksler `siparisler`
--
ALTER TABLE `siparisler`
  ADD PRIMARY KEY (`siparis_id`),
  ADD KEY `kullanici_id` (`kullanici_id`);

--
-- Tablo için indeksler `siparis_detaylari`
--
ALTER TABLE `siparis_detaylari`
  ADD PRIMARY KEY (`siparis_detay_id`),
  ADD KEY `siparis_id` (`siparis_id`),
  ADD KEY `enstruman_id` (`enstruman_id`);

--
-- Tablo için indeksler `tedarikciler`
--
ALTER TABLE `tedarikciler`
  ADD PRIMARY KEY (`tedarikci_id`);

--
-- Tablo için indeksler `yorumlar`
--
ALTER TABLE `yorumlar`
  ADD PRIMARY KEY (`yorum_id`),
  ADD KEY `kullanici_id` (`kullanici_id`),
  ADD KEY `enstruman_id` (`enstruman_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `enstrumanlar`
--
ALTER TABLE `enstrumanlar`
  MODIFY `enstruman_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `kullanici_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `markalar`
--
ALTER TABLE `markalar`
  MODIFY `marka_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `siparisler`
--
ALTER TABLE `siparisler`
  MODIFY `siparis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `siparis_detaylari`
--
ALTER TABLE `siparis_detaylari`
  MODIFY `siparis_detay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `tedarikciler`
--
ALTER TABLE `tedarikciler`
  MODIFY `tedarikci_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `yorumlar`
--
ALTER TABLE `yorumlar`
  MODIFY `yorum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `enstrumanlar`
--
ALTER TABLE `enstrumanlar`
  ADD CONSTRAINT `enstrumanlar_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategoriler` (`kategori_id`),
  ADD CONSTRAINT `enstrumanlar_ibfk_2` FOREIGN KEY (`marka_id`) REFERENCES `markalar` (`marka_id`),
  ADD CONSTRAINT `enstrumanlar_ibfk_3` FOREIGN KEY (`tedarikci_id`) REFERENCES `tedarikciler` (`tedarikci_id`);

--
-- Tablo kısıtlamaları `siparisler`
--
ALTER TABLE `siparisler`
  ADD CONSTRAINT `siparisler_ibfk_1` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`);

--
-- Tablo kısıtlamaları `siparis_detaylari`
--
ALTER TABLE `siparis_detaylari`
  ADD CONSTRAINT `siparis_detaylari_ibfk_1` FOREIGN KEY (`siparis_id`) REFERENCES `siparisler` (`siparis_id`),
  ADD CONSTRAINT `siparis_detaylari_ibfk_2` FOREIGN KEY (`enstruman_id`) REFERENCES `enstrumanlar` (`enstruman_id`);

--
-- Tablo kısıtlamaları `yorumlar`
--
ALTER TABLE `yorumlar`
  ADD CONSTRAINT `yorumlar_ibfk_1` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`),
  ADD CONSTRAINT `yorumlar_ibfk_2` FOREIGN KEY (`enstruman_id`) REFERENCES `enstrumanlar` (`enstruman_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
