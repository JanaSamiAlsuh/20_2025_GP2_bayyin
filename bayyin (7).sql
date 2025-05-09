-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 08, 2025 at 09:07 AM
-- Server version: 9.1.0
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bayyin`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_api_analysis`
--

CREATE TABLE `tbl_api_analysis` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `original_text` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `goal` text NOT NULL,
  `gpt4_datasets_id` bigint DEFAULT NULL,
  `claude_datasets_id` bigint DEFAULT NULL,
  `gemini_datasets_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_datasets`
--

CREATE TABLE `tbl_datasets` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `dataset_name` varchar(255) DEFAULT NULL,
  `columns_data` text,
  `rows_data` longtext,
  `original_text` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `model_used` varchar(50) DEFAULT NULL,
  `goal` text,
  `gpt4_results` json DEFAULT NULL,
  `claude_results` json DEFAULT NULL,
  `gemini_results` json DEFAULT NULL,
  `group_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_data_verifications`
--

CREATE TABLE `tbl_data_verifications` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `dataset_issues` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `recommendations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `type` enum('ai_verification','human_verification') NOT NULL,
  `filename` varchar(255) NOT NULL,
  `original_filename` varchar(255) NOT NULL,
  `file_id` varchar(255) DEFAULT NULL,
  `verification_email` varchar(255) DEFAULT NULL,
  `email_message` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_human_verifications_rating`
--

CREATE TABLE `tbl_human_verifications_rating` (
  `id` int NOT NULL,
  `data_verification_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `is_data_organized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_content_clear_easy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `evaluate_column_formatting` varchar(255) NOT NULL,
  `is_data_amount_sufficient_accurate_results` varchar(255) NOT NULL,
  `most_liked_about_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comments_or_suggestions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `overall_dataset_opinion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_results`
--

CREATE TABLE `tbl_results` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `original_text` longtext,
  `cleaned_text` longtext,
  `word_frequencies` text,
  `wordcloud_path` varchar(255) DEFAULT NULL,
  `processing_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ner_results` text,
  `keyword_results` text,
  `unigram_plot_path` varchar(255) DEFAULT NULL,
  `bigram_plot_path` varchar(255) DEFAULT NULL,
  `trigram_plot_path` varchar(255) DEFAULT NULL,
  `original_filename` varchar(255) DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `is_previous_file` tinyint(1) DEFAULT '0',
  `file_status` varchar(50) DEFAULT 'processing',
  `error_message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `second_name` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `cv` text,
  `birthdate` date DEFAULT NULL,
  `verification_token` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `user_id`, `username`, `email`, `password`, `first_name`, `second_name`, `major`, `country`, `cv`, `birthdate`, `verification_token`, `is_verified`) VALUES
(8, NULL, 'janasami2', 'janaalsuhaibani2003@gmail.com', 'scrypt:32768:8:1$DDfO8YivtUPxip05$fbcc5affc7348942ed49adac796b29117762b8db68726e8dca454f1445a35a1a3f3c91d41fadd62909402ba255702b5bab835b0415ec2a08c7f08cf5a3470677', 'jana', 'fff', NULL, NULL, NULL, NULL, '42078b7a-0b02-4940-beb4-04e2cbc38789', 1),
(10, NULL, 'saged', 'saged@saged.site', 'pbkdf2:sha256:1000000$TV7QcTcB27s2spxi$c72762c852430c7273c9ac96c267fd2026002dd30b440857a4ca3f443737c638', 'saged', 'Elbassuni', NULL, NULL, NULL, NULL, '4945d6be-c1a1-4643-ad88-8b8b6a3521aa', 1),
(11, NULL, 'janasami200333', 'sabbaq44@gmail.com', 'scrypt:32768:8:1$kFKb7aSS3KyjT8eV$57bc7830788526e1a24c222a0f70c7ff1f01ab56e4b5be7adf8a30b91589ac65a1233a61b731afd102d84a604791ad31f8bab8b11b6e58624e947895b01e6603', 'jana', 'fff', NULL, NULL, NULL, NULL, '2690aed5-7ad7-41ca-a5a1-e4733d7a1746', 1),
(13, NULL, 'janasami2003', 'jana.alsuhaibani.452@gmail.com', 'pbkdf2:sha256:1000000$TV7QcTcB27s2spxi$c72762c852430c7273c9ac96c267fd2026002dd30b440857a4ca3f443737c638', 'jana', 'sami', NULL, NULL, NULL, NULL, 'c9de97ca-17b8-4061-a4c9-6a63f09cabe1', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_api_analysis`
--
ALTER TABLE `tbl_api_analysis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_datasets`
--
ALTER TABLE `tbl_datasets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_data_verifications`
--
ALTER TABLE `tbl_data_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_human_verifications_rating`
--
ALTER TABLE `tbl_human_verifications_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_results`
--
ALTER TABLE `tbl_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_file_status` (`file_status`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `verification_token_index` (`verification_token`),
  ADD KEY `is_verified_index` (`is_verified`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_api_analysis`
--
ALTER TABLE `tbl_api_analysis`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_datasets`
--
ALTER TABLE `tbl_datasets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_data_verifications`
--
ALTER TABLE `tbl_data_verifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_human_verifications_rating`
--
ALTER TABLE `tbl_human_verifications_rating`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_results`
--
ALTER TABLE `tbl_results`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
