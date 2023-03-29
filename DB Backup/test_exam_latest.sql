-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2023 at 01:07 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_exam`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `options` tinytext NOT NULL,
  `answer` char(1) NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `options`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 'Indian', 'N', '2023-03-28 17:37:49', '2023-03-28 17:39:20'),
(2, 1, 'Pacific', 'N', '2023-03-28 17:37:49', '2023-03-28 17:37:49'),
(3, 1, 'Atlantic', 'N', '2023-03-28 17:39:30', '2023-03-28 17:39:30'),
(4, 1, 'Arctic', 'Y', '2023-03-28 17:39:30', '2023-03-28 17:39:30'),
(5, 2, 'France', 'Y', '2023-03-28 17:41:26', '2023-03-28 17:41:26'),
(6, 2, 'Canada', 'N', '2023-03-28 17:41:26', '2023-03-28 17:41:26'),
(7, 2, 'Brazil', 'N', '2023-03-28 17:42:25', '2023-03-28 17:42:25'),
(8, 2, 'England', 'N', '2023-03-28 17:42:25', '2023-03-28 17:42:25'),
(9, 3, 'Jordan and Sudan', 'N', '2023-03-28 17:43:04', '2023-03-28 17:43:04'),
(10, 3, 'Jordan and Israel', 'Y', '2023-03-28 17:43:04', '2023-03-28 17:43:04'),
(13, 3, 'Turkey and UAE', 'N', '2023-03-28 17:44:03', '2023-03-28 17:44:03'),
(14, 3, 'UAE and Egypt', 'N', '2023-03-28 17:44:03', '2023-03-28 17:44:03'),
(15, 4, 'Atlantic', 'Y', '2023-03-29 10:13:05', '2023-03-29 10:13:05'),
(16, 4, 'Indian', 'N', '2023-03-29 10:13:05', '2023-03-29 10:13:05'),
(17, 4, 'Pacific', 'N', '2023-03-29 10:14:11', '2023-03-29 10:14:11'),
(18, 4, 'Arctic', 'N', '2023-03-29 10:14:11', '2023-03-29 10:14:11'),
(19, 5, 'Austria', 'N', '2023-03-29 10:14:47', '2023-03-29 10:14:47'),
(20, 5, 'Holland', 'N', '2023-03-29 10:14:47', '2023-03-29 10:14:47'),
(21, 5, 'Switzerland', 'Y', '2023-03-29 10:15:36', '2023-03-29 10:15:36'),
(22, 5, 'Italy', 'N', '2023-03-29 10:15:36', '2023-03-29 10:15:36'),
(23, 6, 'Japan', 'Y', '2023-03-29 10:17:17', '2023-03-29 10:17:17'),
(24, 6, 'New Zealand', 'N', '2023-03-29 10:17:17', '2023-03-29 10:17:17'),
(25, 6, 'Fiji', 'N', '2023-03-29 10:18:01', '2023-03-29 10:18:01'),
(26, 6, 'China', 'N', '2023-03-29 10:18:01', '2023-03-29 10:18:01'),
(27, 7, 'China', 'N', '2023-03-29 10:18:39', '2023-03-29 10:18:39'),
(28, 7, 'Bhutan', 'Y', '2023-03-29 10:18:39', '2023-03-29 10:18:39'),
(29, 7, 'Mongolia', 'N', '2023-03-29 10:19:16', '2023-03-29 10:19:16'),
(30, 7, 'Thailand', 'N', '2023-03-29 10:19:16', '2023-03-29 10:19:16'),
(31, 8, 'Asia', 'N', '2023-03-29 10:20:54', '2023-03-29 10:20:54'),
(32, 8, 'Europe', 'N', '2023-03-29 10:20:54', '2023-03-29 10:20:54'),
(33, 8, 'North America', 'N', '2023-03-29 10:21:43', '2023-03-29 10:21:43'),
(34, 8, 'Africa', 'Y', '2023-03-29 10:21:43', '2023-03-29 10:21:43'),
(35, 9, 'India', 'N', '2023-03-29 10:22:24', '2023-03-29 10:22:24'),
(36, 9, 'Sri Lanka', 'N', '2023-03-29 10:22:24', '2023-03-29 10:22:24'),
(37, 9, 'Thailand', 'Y', '2023-03-29 10:23:05', '2023-03-29 10:23:05'),
(38, 9, 'Malaysia', 'N', '2023-03-29 10:23:45', '2023-03-29 10:23:45'),
(39, 10, '3', 'N', '2023-03-29 10:24:44', '2023-03-29 10:24:44'),
(40, 10, '5', 'Y', '2023-03-29 10:24:44', '2023-03-29 10:24:44'),
(41, 10, '7', 'N', '2023-03-29 10:25:23', '2023-03-29 10:25:23'),
(42, 10, '12', 'N', '2023-03-29 10:25:23', '2023-03-29 10:25:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_03_28_122420_create_questions_table', 1),
(7, '2023_03_28_124643_create_answers_table', 1),
(8, '2023_03_28_125458_create_results_table', 1),
(9, '2023_03_29_125458_create_results_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` tinytext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `created_at`, `updated_at`) VALUES
(1, 'Which one is the smallest ocean in the World?', '2023-03-28 17:37:24', '2023-03-28 17:37:24'),
(2, 'Which country gifted the ‘Statue of Liberty’ to USA in 1886?', '2023-03-28 17:40:35', '2023-03-28 17:40:35'),
(3, 'Dead Sea is located between which two countries?', '2023-03-28 17:40:35', '2023-03-28 17:40:35'),
(4, 'In which ocean ‘Bermuda Triangle’ region is located?', '2023-03-29 10:12:17', '2023-03-29 10:12:17'),
(5, 'Which country is known as the ‘playground of Europe’?', '2023-03-29 10:12:17', '2023-03-29 10:12:17'),
(6, 'Which country is also known as the ‘Land of Rising Sun’?', '2023-03-29 10:16:37', '2023-03-29 10:16:37'),
(7, 'Which country is known as the ‘Land of Thunderbolts’?', '2023-03-29 10:16:37', '2023-03-29 10:16:37'),
(8, 'Which continent has the highest number of countries?', '2023-03-29 10:20:13', '2023-03-29 10:20:13'),
(9, 'In which country, white elephant is found?', '2023-03-29 10:20:13', '2023-03-29 10:20:13'),
(10, 'Total number of oceans in the World is', '2023-03-29 10:24:16', '2023-03-29 10:24:16');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `is_skip` char(1) NOT NULL DEFAULT 'N',
  `is_correct` char(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Doremon', NULL, NULL, NULL, NULL, '2023-03-28 11:55:06', '2023-03-28 11:55:06'),
(2, 'Jest', NULL, NULL, NULL, NULL, '2023-03-28 12:24:30', '2023-03-28 12:24:30'),
(3, 'ssdsd', NULL, NULL, NULL, NULL, '2023-03-28 12:33:51', '2023-03-28 12:33:51'),
(4, 'Qwerty', NULL, NULL, NULL, NULL, '2023-03-28 12:44:14', '2023-03-28 12:44:14'),
(5, 'James Yell', NULL, NULL, NULL, NULL, '2023-03-29 04:25:21', '2023-03-29 04:25:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answers_question_id_foreign` (`question_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `results_user_id_foreign` (`user_id`),
  ADD KEY `results_question_id_foreign` (`question_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  ADD CONSTRAINT `results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
