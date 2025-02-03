-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 29. Jan 2025 um 08:26
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `firma`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `metadaten`
--

CREATE TABLE `metadaten` (
  `meta_id` int(11) NOT NULL,
  `abteilung` varchar(50) DEFAULT NULL,
  `gehalt` decimal(10,2) DEFAULT NULL,
  `adresse` text DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `kontonummer` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `metadaten`
--

INSERT INTO `metadaten` (`meta_id`, `abteilung`, `gehalt`, `adresse`, `email`, `kontonummer`) VALUES
(1, 'Vertrieb', 45000.00, 'Musterstraße 12, 12345 Berlin', 'max.mueller@gmail.com', 'DE12345678901234567890'),
(2, 'Marketing', 43000.00, 'Beispielweg 8, 67890 Hamburg', 'anna.schmidt@gmail.com', 'DE23456789012345678901'),
(3, 'IT', 50000.00, 'Hauptstraße 23, 54321 München', 'peter.meier@mailo.de', 'DE34567890123456789012'),
(4, 'HR', 42000.00, 'Bahnhofstraße 45, 98765 Köln', 'sophie.koch@gmail.com', 'DE45678901234567890123'),
(5, 'Produktion', 47000.00, 'Parkallee 67, 11223 Stuttgart', 'lukas.w@gmail.com', 'DE56789012345678901234'),
(6, 'Finanzen', 48000.00, 'Bergstraße 89, 33445 Dresden', 'l.schneider@gmail.com', 'DE67890123456789012345'),
(7, 'Einkauf', 44000.00, 'Ringstraße 34, 55678 Frankfurt', 'paul.fischer@gmail.com', 'DE78901234567890123456'),
(8, 'Qualitätskontrolle', 46000.00, 'Feldweg 90, 77889 Nürnberg', 'julia.wolf@gmx.de', 'DE89012345678901234567'),
(9, 'Forschung', 52000.00, 'Waldstraße 11, 99887 Hannover', 'jonas.zimmermann@mailo.com', 'DE90123456789012345678'),
(10, 'Support', 42000.00, 'Neue Straße 99, 12345 Berlin', 'lisa.lehmann@gmail.com', 'DE98765432109876543210'),
(12, 'Chef', 100000.00, 'Chefstr.5', 'bat.sch@gmail.com', 'DE51236487896256'),
(13, 'Cantine', 80000.00, 'Hallostr. 10', 'spider@gmail.com', 'DE585248928822862');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mitarbeiter`
--

CREATE TABLE `mitarbeiter` (
  `mit_id` int(11) NOT NULL,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT NULL,
  `geboren` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `mitarbeiter`
--

INSERT INTO `mitarbeiter` (`mit_id`, `vorname`, `nachname`, `geboren`) VALUES
(1, 'Max', 'Müller', '1985-06-15'),
(2, 'Anna', 'Schmidt', '1990-03-22'),
(3, 'Peter', 'Meier', '1982-11-09'),
(4, 'Sophie', 'Koch', '1995-01-18'),
(5, 'Lukas', 'Weber', '1987-12-05'),
(6, 'Laura', 'Schneider', '1993-07-19'),
(7, 'Paul', 'Fischer', '1980-09-13'),
(8, 'Julia', 'Wolf', '1988-02-26'),
(9, 'Jonas', 'Zimmermann', '1992-08-10'),
(10, 'Lisa', 'Lehmann', '1996-04-03'),
(12, 'Batman', 'Schmid', '0000-00-00'),
(13, 'Spiderman', 'Spider', '2000-10-11');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `inhalt` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `test`
--

INSERT INTO `test` (`id`, `inhalt`) VALUES
(1, 'Quicksilver is the burner!'),
(2, 'Quicksilver is the burner!');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `metadaten`
--
ALTER TABLE `metadaten`
  ADD PRIMARY KEY (`meta_id`);

--
-- Indizes für die Tabelle `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
  ADD PRIMARY KEY (`mit_id`);

--
-- Indizes für die Tabelle `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `metadaten`
--
ALTER TABLE `metadaten`
  MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
  MODIFY `mit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `metadaten`
--
ALTER TABLE `metadaten`
  ADD CONSTRAINT `metadaten_ibfk_1` FOREIGN KEY (`meta_id`) REFERENCES `mitarbeiter` (`mit_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
