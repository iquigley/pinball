-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 23, 2020 at 10:58 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mpus`
--
ALTER TABLE `mpus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pinball_images`
--
ALTER TABLE `pinball_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pinball_machines`
--
ALTER TABLE `pinball_machines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pinball_types`
--
ALTER TABLE `pinball_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pinball_with_themes`
--
ALTER TABLE `pinball_with_themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `us_states`
--
ALTER TABLE `us_states`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT;

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
