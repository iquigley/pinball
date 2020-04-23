-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 23, 2020 at 04:07 PM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pinball`
--
CREATE DATABASE IF NOT EXISTS `pinball` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `pinball`;

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `uuid` varchar(32) CHARACTER SET utf8 NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `uuid`, `name`, `created_at`, `updated_at`) VALUES
(1, '5ea0fcfa3a075', 'Pat Lawlor', NULL, NULL),
(2, '5ea0fcfa3b066', 'John Youssi', '2020-04-22 04:00:00', '2020-04-22 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(16) NOT NULL,
  `uuid` varchar(32) CHARACTER SET utf8 NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `abbreviation` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `uuid`, `name`, `abbreviation`, `created_at`, `updated_at`) VALUES
(1, 'mdb_562a95f8ccc4e', 'Andorra', 'AD', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(2, 'mdb_562a95f8ccc59', 'United Arab Emirates', 'AE', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(3, 'mdb_562a95f8ccc5e', 'Afghanistan', 'AF', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(4, 'mdb_562a95f8ccc63', 'Antigua and Barbuda', 'AG', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(5, 'mdb_562a95f8ccc67', 'Anguilla', 'AI', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(6, 'mdb_562a9630a176c', 'Yemen', 'YE', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(7, 'mdb_562a9630a1771', 'Mayotte', 'YT', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(8, 'mdb_562a9630a1775', 'South Africa', 'ZA', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(9, 'mdb_562a9630a177a', 'Zambia', 'ZM', '2020-04-22 04:00:00', '2020-04-22 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` int(11) NOT NULL,
  `uuid` varchar(32) CHARACTER SET utf8 NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `city` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `state_uuid` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `country_uuid` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `year_active` int(11) DEFAULT NULL,
  `year_inactive` int(11) DEFAULT NULL,
  `trade_name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `uuid`, `name`, `city`, `state_uuid`, `country_uuid`, `year_active`, `year_inactive`, `trade_name`, `created_at`, `updated_at`) VALUES
(1, '5ea0fcfa3a077', 'Midway Manufacturing Company', 'Chicago', 'mdb_562a934d7946e', 'mdb_562a95f8ccc59', 1988, 1999, 'Bally', '2020-04-22 04:00:00', '2020-04-22 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mpus`
--

CREATE TABLE `mpus` (
  `id` int(11) NOT NULL,
  `uuid` varchar(32) CHARACTER SET utf8 NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpus`
--

INSERT INTO `mpus` (`id`, `uuid`, `name`, `created_at`, `updated_at`) VALUES
(1, '5ea0fcfa3a076', 'Williams WPC (Fliptronics 2)', '2020-04-22 04:00:00', '2020-04-22 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pinball_images`
--

CREATE TABLE `pinball_images` (
  `id` int(11) NOT NULL,
  `uuid` varchar(32) CHARACTER SET utf8 NOT NULL,
  `pinball_uuid` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `file_name` varchar(256) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pinball_machines`
--

CREATE TABLE `pinball_machines` (
  `id` int(11) NOT NULL,
  `uuid` varchar(32) CHARACTER SET utf8 NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `model_number` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `number_of_players` int(11) DEFAULT NULL,
  `ipd_number` int(11) DEFAULT NULL,
  `date_of_manufacture` date DEFAULT NULL,
  `average_fun_rating` decimal(3,1) NOT NULL DEFAULT '0.0',
  `common_abbreviations` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `manufacturer_uuid` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `mpu_uuid` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `type_uuid` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `production` int(11) DEFAULT NULL,
  `notable_features` text CHARACTER SET utf8,
  `toys` text CHARACTER SET utf8,
  `concept_art_uuid` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `design_by_uuid` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `art_by_uuid` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `dots_animation_by_uuid` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `mechanics_by_uuid` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `music_by_uuid` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `sound_by_uuid` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `software_by_uuid` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `notes` text CHARACTER SET utf8,
  `marketing_slogan` text CHARACTER SET utf8,
  `video_link` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pinball_machines`
--

INSERT INTO `pinball_machines` (`id`, `uuid`, `name`, `model_number`, `number_of_players`, `ipd_number`, `date_of_manufacture`, `average_fun_rating`, `common_abbreviations`, `manufacturer_uuid`, `mpu_uuid`, `type_uuid`, `production`, `notable_features`, `toys`, `concept_art_uuid`, `design_by_uuid`, `art_by_uuid`, `dots_animation_by_uuid`, `mechanics_by_uuid`, `music_by_uuid`, `sound_by_uuid`, `software_by_uuid`, `notes`, `marketing_slogan`, `video_link`, `created_at`, `updated_at`) VALUES
(1, '5ea0fcfa3a999', 'Twilight Zone', '50020', 4, 2684, '1993-04-05', '8.4', 'TZ', '5ea0fcfa3a077', '5ea0fcfa3a076', '5ea0fcfa3a074', 15235, 'Flippers (4), Pop bumpers (3), Ramps (2), Dual left inlanes, \"Rocket\" kicker. Dual autoplunger/manual plunger arrangement. Maximum 1 buy-in ball per player (operator option).\r\n\r\nMagnets on the main playfield are situated on the looping lane and catch the ball to aid in hitting shots into the camera and piano. They are not under player control.\r\n\r\nMagnets on the mini-playfield \'flip\' the ball during \"Battle the Power\" mode when the player presses the flipper buttons.\r\n\r\nThe \"Powerball\" is a ceramic pinball about 20% lighter than a steel pinball, much faster, and not affected by the game\'s magnets.\r\n\r\nFive possible multiball modes:\r\n\"Powerball Mania\", 3-ball;\r\n\"Fast Lock\", 3-ball;\r\n\"Lost in the Zone\", 6-ball wizard mode;\r\n\"Regular Multiball\", 3-ball sequential release, without 3rd magnet installed;\r\n\"Regular Multiball\", 3-ball simultaneous release, with 3rd magnet installed.', 'Mini playfield that uses magnets for flipper-like action; Real working gumball machine on playfield that dispenses pinballs; Working analog clock; tells time in attract mode, times most modes during game play.', '5ea0fcfa3a075', '5ea0fcfa3b066', '5ea0fcfa3a075', '5ea0fcfa3a075', '5ea0fcfa3a075', '5ea0fcfa3a075', '5ea0fcfa3a075', '5ea0fcfa3a075', 'This game was part of Williams/Midway\'s \"SuperPin\" line of widebody games.\r\n\r\nVoice-over artist Tim Kitzrow provided the voice of Rod Serling.\r\n\r\nRod Serling\'s likeness had to be licensed separately from the \"Twilight Zone\" name.\r\n\r\nRetrofit instructions for third playfield magnet (removed in production games) available\r\nhere.\r\n\r\nAn article by Ted Estes about designing Twilight Zone is available at\r\nGameRoom Magazine.\r\n\r\nAnother article shows differences between prototype and production games. Here is an Italian language translation.\r\n\r\nTwilight Zone was originally to be the first game to use Williams\' then-new DCS Sound System (which would actually be introduced for Williams\' 1993 \'Indiana Jones: The Pinball Adventure\'), but due to time constraints concerning the production of the DCS board, the music was recomposed for the Yamaha YM2151/Harris CVSD audio board. It is also therefore the last game to use that audio board.\r\n\r\nWe asked Chris Granner to tell us about the music for this game. He replies:\r\n\r\nThe main play tune for TZ is a WPC (synthesized) version of the loooonnnng guitar solo section from Golden Earring\'s \"Twilight Zone\". The Jackpot tune is a WPC version of the CHORUS of that song, where you hear the main melody of the song. There are snippets and takeoffs from dozens of TV show moments, way too many to list. The actual AUDIO from either of these sources is NOT reproduced in TZ pinball.\r\n\r\nIn this listing is an image of a playfield under blacklighting, revealing a serial number. We asked Pat Lawlor why the manufacturer did this. He replies:\r\n\r\nThe reason for the serial numbers seems strange by today\'s standards. In 1992, Williams\' agreement with its distributors gave them exclusive sales right to a territory. They did not have the right to sell outside of their territory. But some were doing just that. In order to track the game\'s origin from a distributor into the wild, the blacklight number was added. Williams knew where the game was originally shipped. If the game turned up outside of that territory, it was assumed that the distributor had \"Bootlegged\" the game outside of his territory. Then it was up to management to decide what penalty to incur on the offender. Remember, this was during a time when it was PROFITABLE to sell and operate pinball machines. This practice would be laughable today because ANY sale of a pinball machine is a good sale.', '\"Twilight Zone includes more features with patents pending than any other game in history!\"\r\n\"Enter Into a New Age of Pinball\"\r\n\"The Profit Zone. (with PlayMeter and Replay ratings)\"\r\n\"You have just crossed over... into the Twilight Zone\"', 'https://www.youtube.com/watch?v=LyI0c4sRN_w', '2020-04-22 04:00:00', '2020-04-22 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pinball_types`
--

CREATE TABLE `pinball_types` (
  `id` int(11) NOT NULL,
  `uuid` varchar(32) CHARACTER SET utf8 NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pinball_types`
--

INSERT INTO `pinball_types` (`id`, `uuid`, `name`, `created_at`, `updated_at`) VALUES
(1, '5ea0fcfa3a074', 'Solid State Electronics (SS)', '2020-04-22 04:00:00', '2020-04-22 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pinball_with_themes`
--

CREATE TABLE `pinball_with_themes` (
  `id` int(11) NOT NULL,
  `pinball_uuid` varchar(32) CHARACTER SET utf8 NOT NULL,
  `theme_uuid` varchar(32) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pinball_with_themes`
--

INSERT INTO `pinball_with_themes` (`id`, `pinball_uuid`, `theme_uuid`, `created_at`, `updated_at`) VALUES
(1, '5ea0fcfa3a999', '5ea0fcfa3g077', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(2, '5ea0fcfa3a999', '5ea0fcfa4c066', '2020-04-22 04:00:00', '2020-04-22 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `uuid` varchar(32) CHARACTER SET utf8 NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `uuid`, `name`, `created_at`, `updated_at`) VALUES
(1, '5ea0fcfa3g077', 'Adventure', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(2, '5ea0fcfa4c066', 'Supernatural', '2020-04-22 04:00:00', '2020-04-22 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `us_states`
--

CREATE TABLE `us_states` (
  `id` int(16) NOT NULL,
  `uuid` varchar(32) CHARACTER SET utf8 NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `abbreviation` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `us_states`
--

INSERT INTO `us_states` (`id`, `uuid`, `name`, `abbreviation`, `created_at`, `updated_at`) VALUES
(1, 'mdb_562a934d79439', 'Alabama', 'al', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(2, 'mdb_562a934d7945a', 'Alaska', 'ak', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(3, 'mdb_562a934d79465', 'Arizona', 'az', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(4, 'mdb_562a934d7946a', 'Arkansas', 'ar', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(5, 'mdb_562a934d7946e', 'California', 'ca', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(6, 'mdb_562a934d79543', 'Washington', 'wa', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(7, 'mdb_562a934d7954e', 'Wisconsin', 'wi', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(8, 'mdb_562a934d79553', 'Wyoming', 'wy', '2020-04-22 04:00:00', '2020-04-22 04:00:00'),
(9, 'mdb_562a934d79559', 'Washington DC', 'dc', '2020-04-22 04:00:00', '2020-04-22 04:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `uuid_2` (`uuid`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `state_uuid` (`state_uuid`),
  ADD KEY `country_uuid` (`country_uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mpus`
--
ALTER TABLE `mpus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `pinball_images`
--
ALTER TABLE `pinball_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD UNIQUE KEY `file_name` (`file_name`),
  ADD KEY `pinball_uuid` (`pinball_uuid`);

--
-- Indexes for table `pinball_machines`
--
ALTER TABLE `pinball_machines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `manufacturer_uuid` (`manufacturer_uuid`),
  ADD KEY `mpu_uuid` (`mpu_uuid`),
  ADD KEY `type_uuid` (`type_uuid`),
  ADD KEY `concept_art_uuid` (`concept_art_uuid`),
  ADD KEY `design_by_uuid` (`design_by_uuid`),
  ADD KEY `art_by_uuid` (`art_by_uuid`),
  ADD KEY `dots_animation_by_uuid` (`dots_animation_by_uuid`),
  ADD KEY `mechanics_by_uuid` (`mechanics_by_uuid`),
  ADD KEY `music_by_uuid` (`music_by_uuid`),
  ADD KEY `sound_by_uuid` (`sound_by_uuid`),
  ADD KEY `software_by_uuid` (`software_by_uuid`);

--
-- Indexes for table `pinball_types`
--
ALTER TABLE `pinball_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `pinball_with_themes`
--
ALTER TABLE `pinball_with_themes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pinball_uuid` (`pinball_uuid`),
  ADD KEY `theme_uuid` (`theme_uuid`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `us_states`
--
ALTER TABLE `us_states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `uuid_2` (`uuid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mpus`
--
ALTER TABLE `mpus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pinball_images`
--
ALTER TABLE `pinball_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pinball_machines`
--
ALTER TABLE `pinball_machines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `pinball_types`
--
ALTER TABLE `pinball_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pinball_with_themes`
--
ALTER TABLE `pinball_with_themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `us_states`
--
ALTER TABLE `us_states`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD CONSTRAINT `country` FOREIGN KEY (`country_uuid`) REFERENCES `country` (`uuid`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `us_state` FOREIGN KEY (`state_uuid`) REFERENCES `us_states` (`uuid`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `pinball_images`
--
ALTER TABLE `pinball_images`
  ADD CONSTRAINT `pinball` FOREIGN KEY (`pinball_uuid`) REFERENCES `pinball_machines` (`uuid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pinball_machines`
--
ALTER TABLE `pinball_machines`
  ADD CONSTRAINT `art_by` FOREIGN KEY (`art_by_uuid`) REFERENCES `artists` (`uuid`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `concept_art` FOREIGN KEY (`concept_art_uuid`) REFERENCES `artists` (`uuid`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `design_by` FOREIGN KEY (`design_by_uuid`) REFERENCES `artists` (`uuid`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `dots_animation_by` FOREIGN KEY (`dots_animation_by_uuid`) REFERENCES `artists` (`uuid`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `manufacturer` FOREIGN KEY (`manufacturer_uuid`) REFERENCES `manufacturers` (`uuid`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `mechanics_by` FOREIGN KEY (`mechanics_by_uuid`) REFERENCES `artists` (`uuid`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `mpu` FOREIGN KEY (`mpu_uuid`) REFERENCES `mpus` (`uuid`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `music_by` FOREIGN KEY (`music_by_uuid`) REFERENCES `artists` (`uuid`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `pinball_type` FOREIGN KEY (`type_uuid`) REFERENCES `pinball_types` (`uuid`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `software_by` FOREIGN KEY (`software_by_uuid`) REFERENCES `artists` (`uuid`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `sound_by` FOREIGN KEY (`sound_by_uuid`) REFERENCES `artists` (`uuid`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `pinball_with_themes`
--
ALTER TABLE `pinball_with_themes`
  ADD CONSTRAINT `pinball_constraint` FOREIGN KEY (`pinball_uuid`) REFERENCES `pinball_machines` (`uuid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `theme_constraint` FOREIGN KEY (`theme_uuid`) REFERENCES `themes` (`uuid`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
