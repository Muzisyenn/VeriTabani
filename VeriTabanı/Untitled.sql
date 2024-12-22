CREATE TABLE `kategoriler` (
  `kategori_id` INT PRIMARY KEY AUTO_INCREMENT,
  `ad` VARCHAR(50) NOT NULL
);

CREATE TABLE `markalar` (
  `marka_id` INT PRIMARY KEY AUTO_INCREMENT,
  `ad` VARCHAR(50) NOT NULL,
  `ulke` VARCHAR(50)
);

CREATE TABLE `tedarikciler` (
  `tedarikci_id` INT PRIMARY KEY AUTO_INCREMENT,
  `ad` VARCHAR(100) NOT NULL,
  `telefon` VARCHAR(15),
  `email` VARCHAR(100),
  `adres` TEXT
);

CREATE TABLE `enstrumanlar` (
  `enstruman_id` INT PRIMARY KEY AUTO_INCREMENT,
  `ad` VARCHAR(100) NOT NULL,
  `kategori_id` INT NOT NULL,
  `marka_id` INT NOT NULL,
  `fiyat` DECIMAL(10,2) NOT NULL,
  `stok` INT NOT NULL,
  `renk` VARCHAR(30),
  `yapim_tarihi` DATE,
  `tedarikci_id` INT
);

CREATE TABLE `kullanicilar` (
  `kullanici_id` INT PRIMARY KEY AUTO_INCREMENT,
  `ad` VARCHAR(100) NOT NULL,
  `soyad` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) UNIQUE NOT NULL,
  `sifre` VARCHAR(255) NOT NULL,
  `telefon` VARCHAR(15),
  `adres` TEXT
);

CREATE TABLE `siparisler` (
  `siparis_id` INT PRIMARY KEY AUTO_INCREMENT,
  `kullanici_id` INT NOT NULL,
  `siparis_tarihi` DATETIME DEFAULT (CURRENT_TIMESTAMP),
  `toplam_tutar` DECIMAL(10,2) NOT NULL,
  `durum` ENUM(Beklemede,Tamamlandı,İptal Edildi) DEFAULT 'Beklemede'
);

CREATE TABLE `siparis_detaylari` (
  `siparis_detay_id` INT PRIMARY KEY AUTO_INCREMENT,
  `siparis_id` INT NOT NULL,
  `enstruman_id` INT NOT NULL,
  `adet` INT NOT NULL,
  `birim_fiyat` DECIMAL(10,2) NOT NULL
);

CREATE TABLE `yorumlar` (
  `yorum_id` INT PRIMARY KEY AUTO_INCREMENT,
  `kullanici_id` INT NOT NULL,
  `enstruman_id` INT NOT NULL,
  `yorum` TEXT NOT NULL,
  `puan` INT NOT NULL,
  `yorum_tarihi` DATETIME DEFAULT (CURRENT_TIMESTAMP)
);

ALTER TABLE `enstrumanlar` ADD FOREIGN KEY (`kategori_id`) REFERENCES `kategoriler` (`kategori_id`);

ALTER TABLE `enstrumanlar` ADD FOREIGN KEY (`marka_id`) REFERENCES `markalar` (`marka_id`);

ALTER TABLE `enstrumanlar` ADD FOREIGN KEY (`tedarikci_id`) REFERENCES `tedarikciler` (`tedarikci_id`);

ALTER TABLE `siparisler` ADD FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`);

ALTER TABLE `siparis_detaylari` ADD FOREIGN KEY (`siparis_id`) REFERENCES `siparisler` (`siparis_id`);

ALTER TABLE `siparis_detaylari` ADD FOREIGN KEY (`enstruman_id`) REFERENCES `enstrumanlar` (`enstruman_id`);

ALTER TABLE `yorumlar` ADD FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`);

ALTER TABLE `yorumlar` ADD FOREIGN KEY (`enstruman_id`) REFERENCES `enstrumanlar` (`enstruman_id`);
