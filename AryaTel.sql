-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jan 09, 2025 at 11:43 AM
-- Server version: 9.0.1
-- PHP Version: 8.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `AryaTel`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `sender_id` int NOT NULL,
  `recipient_id` int NOT NULL,
  `message` text NOT NULL,
  `sender_encrypted_message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `recipient_id`, `message`, `sender_encrypted_message`) VALUES
(71, 6, 5, 'Zszh91jcnT/5tIAaW9vKqrE4elKtuhqSsbVKTOUbe7UvYysI3y73veaeA+Wzi20gW1vHulK90uIsPCeioTjVqp+nYnrOFLR+9Qd6U6u4x6WN/XcP9Dg91to9EZPsaD2yS/bpoVK+aep15+mcakRcwrhB52usnY3uJk/quVWhANEYYh/8dgLnhj/nfH1v8Zv29uwemR1F2OOXcRxu5PIaS1fGKk3tmx/lXyFKwl5iqIL3NApK79koiKJOWCp4QHC5RkzYULmG+TchHkvauV6UDgAo/RcRLwhMPenUCNY+8DK7ig20yRI9x3CHcBk6ZHguVzoKDwzW/vhVXXffL0BO1Q==', 'jXVum+CnC/bo8lPIrDcMP9/zIzlzyC+xVWgUskmlEB90tI0KfpIXYuHVMAVg5+/+avBRydGc+wfWa+FkuN6qw2gsA6f2Hwv96vTA8tem+T9WDTDQrsiqKm6y6LG1JjOZ0EydIaeTb5zFuA580LEhdHGvvyb/VpSFucDyGJZHxs22bebaAAb1zIvWoj21ahW9yD1212HC6IbsiThdTDzh5IKWEjg+RFo+v1Bd14xyBAEVU57HERxkGtOqtOGwhWfgSsH0U+dQnZ3FIzjqzC55PQeF7yglaYYFA5S+RAsI6tmnCg9UB3Tns/NlDTLAmQpTzAfGPdyAItyRXBk+Lm7mlw=='),
(72, 5, 6, 'GysgAtB9ZuMYs8OeglbjsjBrW+O/ObIH3//mr5T0VlamAS3BJuXnasz9uwKT9jgvEmLArcJw6Bksd8PPR8clYSpXAM0V7pRfQ95Q2A4e8hQsjck8gmBGDdPxIY1JwSwu4oea/QcHy4YPgZFNAhNoe5EwHDg0maXDSXpGEUnV5WiMLOOMiE28+i+kHuciR4esI9XNcMBLjGCZjLAvbggxm8WJnI6y42F0C2VJm54ew96q8UBZ4gEiIltWWZ52xdLEZCaUkf9Yv8WVIGE58t8NjodtxZoPAwCFlxj3aO9jmE2wVBnCL7zkxKNm59HfvPsCIefgTjXwBRZdkTA8Ywap4w==', 'uXcYbHU2FpO+1YbH0AsdLMeRFKu9RmPjP58diQ5qkpNu5Na3LICMWU4AUDMRl4RpERXjukcyllxExQJ8lZeMh8GmIUiQvo5tV+DPmMWJeU2uNadyR2J+DjDCS9UkpueAshz4xSlvVg40hqBoI3EiUvovk9gmIpKgcFNNEeEh9d1FTwton9osGck4BbJ+TQVV39asqEtHIuFe9pMCkatoBZ6UKN6ub+yPjJsbIFtWC/hjDdcVMIksb0ZpBY99qfzynqWn9dwRkPY993U0FNY7ebsyGxyfqP3vGrQQ9kLutUkpp9nNbZvzRwTcRfoxwJMqMpORDgkI0J4YxpRtfEm3pA=='),
(75, 6, 5, 'KKgZZavMtuImPX2zpclj3u5LLZT286BHOIe4OxkHMzjRuHgujr30RSkd+k2Qybo40Zsut4ITLJ8SeTHayxNL6F2KgVjCsQI5sQdIfZ/rKKA+MRIN/LLQWSX2kdNKHwi/vabubadHRyZ0Xwgi+Xb8d8K22Bqu9KnmWyoLUl7ZMsr3TrUxQer16gUvhYfg0UvF2n1Uy+FM4ruo4oQZ9bmIPT6zdWvDJI4weHmk5MLhorRBhWYCrqhtsZJYS4WVFCNzxTnyuGyIxdKcl7xaZb6mJEWQ1iIb3a/+2TexL9odq2TY1K6fwi+EkPY1NEJjdyawXrJHo6s+Eebm+F+m86lSVQ==', 'WHuqXAFzJQzeEOYL3JThYdAGLppWBA4fLgmZZBndIeSYNsflcKsPTCCgfEnYE8+ploKjQdf32+tGZRMi1kizXVewP3+z8+TrCzC4v2DhJqSRj2jAw3QbLturO0MyQt4z9ppGuolcEt6xWRQCTtrFSsmzmZa1u+wGE14bYzmkeWmZxYXlwoNnQVVgkfIlL45eDKUY0+1LqAuICf/p+Vo54KZ/kqZizuG8Ykz1+zpA+SDYGaDlH5J7ddQgeyajBROOGPRxnLe9BHdR6ewscDcqVZ6A15n+krq/CAC39dOi4wKY6T8ryXgorE9S0wuPZDe42d8lupTO6eTiYd2NNXcU2Q=='),
(76, 7, 8, 'gQSDq15L+caYQQNniy9iH2Jb6WcHM7li+VTcuj6zHL46rDlyt5JPSn2Vnjv+PVxs4e7KtPpuEpFiX5eLITJ7Vjz79QhKZGoteWnoTv7NtJAQ+QiY0lXhW7GLn5E0DDNDf2jFzEM3g6n1R5hR63lKsne0hPGmPm2BZdcXydxJ6EkgFBKgsf+Il/m5ZFsl5tvQflidP4aidabRaT/3PwK9GEtaI2wkDBUuIHd2SLKrD+VIqoc+dIA4rg/oqSLSqJYKBPAbbvAFYZwtz7lPqXsMnOUJNay6wB62GPkXpa0YRBnVCx7TpkWstDwUG3MRL4/J122UvA/stdTA3Fvs+HWteg==', 'BKnCjsbPjPfgvjYeVUo/BXsBOzTr2tYtJdqAB8idsPXKHFsWTXEsQVFf78BFsgr+lmOzk8eRO9iU9vwOJf6MWr6K6qakqzDx8GHpSIsEGzf2Oujo91n08/aki+gkJLblc34QNI0rdMEh/D9a9oWroYEre2woppUfIpRMMxJvXP1Ai90lAKyZlrX4HAV/tWh84oe7zpwEZIMRnrvzGnnkKjuVmizWld99u1h8D3bep1pNuRKA1yqyfD/Z80cJIl0qqPtsP/h8D4w1rVxjcxXD467AkUJHsPkhiPOdNa2D1eYzGHhmAgUQ06d2MW45TB8CEZMWFDM36wRpz0SkcjVy/g=='),
(77, 8, 7, 'HjXdTs2VqS7uAgYqDhLaOhi/CSpYElo6Ac2FgdoQD2haU6OYoROY7FdBqtvSu72VZkccPFcdeGUZ/zBGJvKT/jNxgk1tiq1nSC+0kvWuQ8guTurgboRnTGkSsDQNHnQgZuwyHYmyqjTTj/R8KYjmYHyZnVRy3i7WbybBda3iikFQ0U12lThD4lIVAgxmhtVQ2Z+rJ49AiXrB1dnJKJB7dXRA76/8Ygq3LVOGD5cfH0pNizXBMCkuGnlH0bb5IhhlBqE1FntO63jolFbIHAaFRUEf/27e/U2Fc68XNDj0btxgneRrvzrW3JAypEEN7N5Podx5oESMJw1q3LcqGDkOvg==', 'ZqDJaIR7flVSNwsQKh3+QesRHFwNlpQ0FWnSk8LaG+pac+wzdIRRMdbzs2ouqmUg+i2DM9JZuLbXJt1fEgS6Wcadt9lKCKgMj9xrkDU/yn5jhs154HMPfvONgXEueAClxYZIls9xzID+IH2xQn0Y6eeYRw9Gq2+c3CTtiTs1S8LGQv/vg563t39UUFSvr5ctzWxFsVPm6OAYvMd8COJBp9XE2Ri/LH+0yvgy1jQ+yBOzgiqkmgfVwlOoLRCjHx+ggoe5hrXuJu0KBXkpep6kYglCCczjqqJ5R+lFCLl6y0nmg7ZN71mlG0ePcN3Jde/uzgH57+n0OqDLXxNRjB9Weg=='),
(78, 7, 8, 'N3r1tKa5nt0ZYPGL/5ccPKeq7E2Lzw1mdYlPZsPq5ZmNo0aWa4tnM2qdr3jGEvQaFWnjf4PwsIfhTNHhCNhyvyVIyfaX4ZixAMT2JiWmNFz9fvDGmbUoMf52fJFxygY/KXVRzSXwHFPNldOjqxTCqRwSdHEiC7VYmEDj0yACR7QOZQsZKlXwknHwa9UWZBjKSLDPvxmgYEplAFPhztydqXcZC8oHk3kUjyWmC/HzhpeWrNbLicawRsg3dxCbFUkhqSygBFGkEgnMcmVAxJ0KV5YkDP4O4tKjwX3j7wnXDx0im4/+wI9q9gyJNZ66Ow9VyFKisaLL2/Bpk29LpKwjSA==', 'RWUCYnMGWuBjPe5kO53DEzaBlcMrfoJGju5ZBhwlS/ia0a8x1UOyDA7e0FAztvPT7lvQrPInU65rC7JDi+e+niG/UhgeNqR/Db1+2MeUdSZZHYJHKVn+ktsob+TfjUhREI16mgCKCPxqI2Lb3ycRGuWRtJbOUNceP7YLMx3Xky8oiPadY2oqq2+6Z92ra8FUP6/IUWuNjRjJAE3gv/EQNY7ILMFtQ8N2Yw49UksQY6KOqs2RAtQk9idSx3JmljmMscvgysgAg26KQjhrlwZbSujK05CfRtMzJu5i/5sY72NUdfUKaZHtYLXF2ORSbZrkUb8OX0S//6SWhuP27aB8kw==');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `public_key` longtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `public_key`, `created_at`) VALUES
(5, 'arya3@gmail.com', '$2y$10$0jmd6WkRinkEb8BsP2b4Ve2OIv7VdwesOZ.Mqe5ycDzjgQ.8dc1/.', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvBQsidzyofh5d0cGgvfIvMRnw6KEt/884VR987gyYQV91l/UgvPggPpIokhZo91N7wtxVCt2IzI4u7yI6YcwOUJQM+DolNs5wKP8x2OXtBP5nYmBWtU4lZ3p6SiuJ073qso4o+P9z2neNIEspbaRBArKGr7Uli+jvaEGOAQJVCLIrcPXcytSXwxsujytI6n4DMjlwmtEg4u5bpqkuMO4TybldNGwrNclQmBI4slZXFMwy+65FdIUYsuOycQtPWTT2pGP8G9uRgTR0uDlViXzx+ZK8DvHEOEC+ZfIqf19LHwiZHCUbSWImQgAwhg1hdl+b7/g1JYTzYeewXzvaSeJSQIDAQAB', '2025-01-04 14:45:50'),
(6, 'arya@gmail.com', '$2y$10$YoGtScj6K6i5zDqZzIc2r.RbONhcJa4QB7z2iy3K4srWuSjGKkldi', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAobyG3Dqtr0r4FBYRiNLRk/0dnE85Fy3peI1EYZp1Z7ov1sYT+GmVzPTZEVUTOlEqtXpeUd8wFYqim9XnUOFv1nDlG04Fx2TZ44ULtoxBAo5ryI468A7b5nI+P9gE3z6rkbK61DxYfvDsvdB7iDf34kHoYcPSG9z2q+S3t1NZt0uMvCW1Dn/i/GNeSLlPGeiOxy5ZE+U3W66ewCKASUJGnrDYpwekfHiUw5PI900DiJYQ0yEZMcXN1uSxrJZAmZA+g+gJsRu9Sd5edVOXcUXPs1TWxtM/vr9jwLT3Ph+SSIs5OLfbTaZV2pr5fkkfau4G+aNL3uHSzSn7xhfJfUXeuQIDAQAB', '2025-01-04 15:20:32'),
(7, 'arya1@gmail.com', '$2y$10$85D3u4HjsNNrgNmG0ri42.X58tecwCcGIE.GHU53VyOVbtKv.lfou', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxOfL/0cvHcZJL73fSl2NiUWvuDTiWGFvwd2vzVCpVO1+CWOXrO8p44NY5Z77qyOgEOcpiEsEQDGSQXBCL7KD7c6k44hntxq7n0sfxCKkN2foUU6mjYQulDWhBgN0jcOMWiQ6xSsk3zKDn+dnqlVKo+W5hqNfZc2KS+cF/hl82XUCXWPyBUdDKcGnaRzeSYtfR9MQxNiFU6I9oYBMEQh/6QdLkhY99/PnExTc/K7WwlJj/E4bPLb6MNMBiTmN/lDmh15r6G8rwyinTZCjDiX4l9BfQqNsKmG6jh5SlVZn9W2wGyrk87/IvXoUUPJFqsAHo0p64O35ahaLn9JT8T7PTwIDAQAB', '2025-01-04 15:58:33'),
(8, 'arya2@gmail.com', '$2y$10$j/mUd5P4vKYOvDaqQmjJ7.npxSQv.0uqZXoJHqW.aFBz8Zbjog8YG', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgRjCYfLlKljNTLIBdkfC2VKw4DVzsXWawEFUyuCKJmC+tmpDXkArfRxhUpbfiRXscqEmwQpSXy9C0pemm6IRnQNDoI77MWz/m7eVrbd1V9QyFuqJcyzZ5yG0h8f6lN1pfpFY9RqoejXUIy0uVtSfHHLnN5PREiOpoX/yLhuanJjTMQjLOYjU2C/mqnpUpJjbHPNZEoY+D/Y7fbmPrmCOESpUt9nY9k/qpwKFO4nzsoi8o8DBy1ca6jagiLz5nyJv7poJ3gGNjS39+yqULUY13W/hBp39ktahRlPYvwl0oB4mi25BlP/sD0K8p/gUakOvNKJCnjaiUr6RZqSpolsRdwIDAQAB', '2025-01-04 16:05:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
