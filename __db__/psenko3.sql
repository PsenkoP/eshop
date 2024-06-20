-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: St 19.Jún 2024, 14:12
-- Verzia serveru: 10.4.32-MariaDB
-- Verzia PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `psenko3`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `t_kategorie`
--

CREATE TABLE `t_kategorie` (
  `id` int(100) NOT NULL,
  `nazov` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `t_kategorie`
--

INSERT INTO `t_kategorie` (`id`, `nazov`) VALUES
(1, 'Víťaz'),
(2, 'Postúpili'),
(3, 'Nepostúpili'),
(4, 'Vypadli'),
(5, 'Diskvalifikovaný');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `t_produkty`
--

CREATE TABLE `t_produkty` (
  `ID` int(100) NOT NULL,
  `nazov` varchar(255) DEFAULT NULL,
  `znacka` varchar(255) DEFAULT NULL,
  `popis` text DEFAULT NULL,
  `cena` double(10,2) DEFAULT NULL,
  `mnozstvo` int(100) DEFAULT NULL,
  `kategorie` char(100) DEFAULT NULL,
  `obrazok` varchar(255) DEFAULT NULL,
  `kategoria_id` int(100) DEFAULT NULL,
  `t_kategorie` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `t_produkty`
--

INSERT INTO `t_produkty` (`ID`, `nazov`, `znacka`, `popis`, `cena`, `mnozstvo`, `kategorie`, `obrazok`, `kategoria_id`, `t_kategorie`) VALUES
(1, 'Lewis Hamilton', 'Mercedes', 'Sedemnásobný majster sveta s neuveriteľným talentom a skúsenosťami', 99999999.99, 1, 'Šofér', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_75,w_1320/content/dam/fom-website/drivers/2024Drivers/hamilton', 1, 0),
(2, 'Max Verstappen', 'Red Bull', 'Mladý a dynamický pretekár, ktorý láme rekordy', 90000000.00, 1, 'Šofér', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_75,w_1320/content/dam/fom-website/drivers/2024Drivers/verstappen', 1, 0),
(3, 'Charles Leclerc', 'Ferrari', 'Talentovaný pretekár s veľkou budúcnosťou vo Formule 1', 70000000.00, 1, 'Šofér', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_75,w_1320/content/dam/fom-website/drivers/2024Drivers/leclerc', 2, 0),
(4, 'Lando Norris', 'McLaren', 'Populárny a rýchly pretekár, ktorý stále stúpa na rebríčku F1', 60000000.00, 1, 'Šofér', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_75,w_1320/content/dam/fom-website/drivers/2024Drivers/norris', 2, 0),
(5, 'Daniel Ricciardo', 'AlphaTauri', 'Skúsený pretekár s dlhoročnou praxou.', 80000000.00, 1, 'Šofér', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_75,w_1320/content/dam/fom-website/drivers/2024Drivers/ricciardo', 3, 0),
(6, 'Fernando Alonso', 'Alpine', 'Legendárny pretekár s obrovskými skúsenosťami a dvoma titulmi majstra sveta', 85000000.00, 1, 'Šofér', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_75,w_1320/content/dam/fom-website/drivers/2024Drivers/alonso', 3, 0),
(7, 'Sergio Perez', 'Red Bull', 'Spoľahlivý a skúsený pretekár, ktorý vie, ako vyhrať preteky', 65000000.00, 1, 'Šofér', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_75,w_1320/content/dam/fom-website/drivers/2024Drivers/perez', 4, 0),
(8, 'Valtteri Bottas', 'Alfa Romeo', 'Skúsený pretekár s mnohými pódiami na konte', 55000000.00, 1, 'Šofér', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_75,w_1320/content/dam/fom-website/drivers/2024Drivers/bottas', 4, 0),
(9, 'George Russell', 'Mercedes', 'Mladý a ambiciózny pretekár s veľkým potenciálom', 75000000.00, 1, 'Šofér', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_75,w_1320/content/dam/fom-website/drivers/2024Drivers/russell', 5, 0),
(10, 'Pierre Gasly', 'AlphaTauri', 'Mladý a rýchly pretekár, ktorý už vyhral preteky F1', 5000000.00, 1, 'Šofér', 'https://media.formula1.com/image/upload/f_auto,c_limit,q_75,w_1320/content/dam/fom-website/drivers/2024Drivers/gasly', 5, 0);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `t_user`
--

CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `t_user`
--

INSERT INTO `t_user` (`id`, `username`, `password`, `email`) VALUES
(1, 'jozko', 'heslo', 'jozko@gmail.com'),
(8, 'Oliver1', '$2y$10$z20Nk0HV1JEjcAaqev7p3.4LpLRJadN/GrMuv.rkuiXhUwLCpB9V.', 'oliver1@gmail.com'),
(9, 'Sepino', '$2y$10$cuLQOehpRkPD0vDnj1yIduQegm3v.CQ5Ms7n0uo3Kvhz1Xn/aOkS2', 'sepino@gmail.com'),
(10, 'Marek', '$2y$10$d7NYhwSgfHbaIJHbEMxSPuI4hRiR/i9AUlFE9wgqeXDCHSl7PPPm2', 'marek@gmail.com');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `t_kategorie`
--
ALTER TABLE `t_kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `t_produkty`
--
ALTER TABLE `t_produkty`
  ADD PRIMARY KEY (`ID`);

--
-- Indexy pre tabuľku `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `t_kategorie`
--
ALTER TABLE `t_kategorie`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `t_produkty`
--
ALTER TABLE `t_produkty`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pre tabuľku `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
