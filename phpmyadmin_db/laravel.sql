-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 07 2024 г., 03:19
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_11_16_122958_create_order_models_table', 1),
(7, '2023_11_16_133008_create_price_models_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `order_models`
--

CREATE TABLE `order_models` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `count` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_models`
--

INSERT INTO `order_models` (`id`, `user_id`, `product_id`, `product_name`, `quantity`, `price`, `count`, `name`, `address`, `purchase_date`) VALUES
(1, 1, 8, 'labore', 1, 68, 6, 'maiores', 'nesciunt', '2023-06-06'),
(2, 1, 11, 'explicabo', 1, 41, 2, 'et', 'harum', '2023-10-28'),
(3, 1, 9, 'vero', 1, 71, 9, 'aut', 'deleniti', '2023-12-25'),
(4, 1, 11, 'dicta', 1, 8, 1, 'doloribus', 'ullam', '2023-07-24'),
(5, 1, 8, 'eligendi', 1, 51, 6, 'assumenda', 'doloremque', '2023-12-07'),
(6, 1, 15, 'quia', 1, 32, 1, 'id', 'expedita', '2023-08-13'),
(7, 1, 5, 'magnam', 1, 47, 5, 'inventore', 'doloremque', '2023-02-28'),
(8, 1, 6, 'sit', 1, 9, 7, 'voluptatem', 'doloribus', '2023-09-28'),
(9, 1, 5, 'placeat', 1, 49, 3, 'quis', 'quia', '2023-03-14'),
(10, 1, 12, 'iste', 1, 55, 10, 'voluptatem', 'illo', '2023-06-08'),
(11, 1, 11, 'eligendi', 1, 28, 2, 'natus', 'facere', '2023-11-08'),
(12, 1, 14, 'repellendus', 1, 74, 10, 'nesciunt', 'ut', '2023-08-07'),
(13, 1, 8, 'ipsam', 1, 60, 6, 'quam', 'porro', '2023-09-05'),
(14, 1, 5, 'itaque', 1, 44, 9, 'dolore', 'non', '2023-05-27'),
(15, 1, 12, 'placeat', 1, 7, 3, 'repellat', 'sit', '2023-02-16'),
(16, 1, 8, 'pariatur', 1, 31, 2, 'recusandae', 'est', '2023-08-30'),
(17, 1, 11, 'aut', 1, 47, 2, 'animi', 'eveniet', '2023-04-04'),
(18, 1, 15, 'distinctio', 1, 20, 1, 'quibusdam', 'ut', '2023-09-10'),
(19, 1, 5, 'doloremque', 1, 52, 2, 'aliquam', 'modi', '2023-05-02'),
(20, 1, 6, 'voluptas', 1, 58, 6, 'consequatur', 'suscipit', '2023-10-29'),
(21, 1, 5, 'quod', 1, 56, 6, 'hic', 'quos', '2023-01-03'),
(22, 1, 12, 'dolorem', 1, 63, 7, 'explicabo', 'cum', '2023-02-20'),
(23, 1, 5, 'autem', 1, 36, 8, 'et', 'voluptas', '2023-09-11'),
(24, 1, 9, 'atque', 1, 80, 8, 'labore', 'voluptas', '2023-11-23'),
(25, 1, 10, 'omnis', 1, 47, 4, 'corrupti', 'eos', '2023-06-15'),
(26, 1, 7, 'numquam', 1, 37, 7, 'esse', 'facilis', '2023-01-11'),
(27, 1, 13, 'sunt', 1, 95, 2, 'a', 'voluptatibus', '2023-10-31'),
(28, 1, 11, 'perspiciatis', 1, 38, 4, 'blanditiis', 'cupiditate', '2023-07-23'),
(29, 1, 15, 'placeat', 1, 8, 1, 'voluptatum', 'impedit', '2023-01-06'),
(30, 1, 5, 'deserunt', 1, 8, 4, 'voluptatum', 'deserunt', '2023-04-22'),
(31, 1, 10, 'deserunt', 1, 86, 8, 'repellat', 'ea', '2023-06-03'),
(32, 1, 12, 'repellat', 1, 98, 10, 'necessitatibus', 'ex', '2023-01-10'),
(33, 1, 13, 'ut', 1, 33, 5, 'consequatur', 'minus', '2023-02-20'),
(34, 1, 6, 'id', 1, 48, 8, 'distinctio', 'ut', '2023-12-23'),
(35, 1, 6, 'voluptatem', 1, 100, 2, 'omnis', 'dolorem', '2023-06-25'),
(36, 1, 15, 'sit', 1, 46, 8, 'minus', 'qui', '2023-04-11'),
(37, 1, 6, 'atque', 1, 22, 1, 'non', 'eum', '2023-09-29'),
(38, 1, 15, 'modi', 1, 28, 1, 'velit', 'facere', '2023-04-26'),
(39, 1, 7, 'quis', 1, 86, 7, 'dicta', 'reiciendis', '2023-02-19'),
(40, 1, 9, 'similique', 1, 48, 1, 'quia', 'ut', '2023-06-03'),
(41, 1, 14, 'voluptatibus', 1, 25, 1, 'tempore', 'odit', '2023-11-21'),
(42, 1, 7, 'et', 1, 5, 6, 'est', 'cum', '2023-02-22'),
(43, 1, 14, 'quo', 1, 81, 4, 'aut', 'repudiandae', '2023-12-25'),
(44, 1, 9, 'odit', 1, 90, 10, 'et', 'voluptatem', '2023-12-12'),
(45, 1, 15, 'alias', 1, 92, 10, 'dolores', 'vel', '2023-04-15'),
(46, 1, 14, 'ipsam', 1, 38, 5, 'natus', 'sunt', '2023-12-22'),
(47, 1, 11, 'modi', 1, 71, 9, 'placeat', 'et', '2023-04-05'),
(48, 1, 9, 'nesciunt', 1, 26, 10, 'voluptatem', 'nisi', '2023-10-28'),
(49, 1, 7, 'recusandae', 1, 77, 6, 'maxime', 'eum', '2023-01-07'),
(50, 1, 13, 'consequatur', 1, 20, 6, 'repellat', 'dolor', '2023-12-06'),
(51, 1, 13, 'dolorem', 1, 92, 9, 'facilis', 'nesciunt', '2023-09-21'),
(52, 1, 11, 'ratione', 1, 76, 9, 'saepe', 'veniam', '2023-03-27'),
(53, 1, 14, 'autem', 1, 62, 2, 'cumque', 'soluta', '2023-02-04'),
(54, 1, 7, 'repudiandae', 1, 67, 7, 'modi', 'harum', '2023-09-30'),
(55, 1, 11, 'ut', 1, 79, 9, 'quia', 'debitis', '2023-12-03'),
(56, 1, 7, 'distinctio', 1, 23, 6, 'vel', 'a', '2023-12-10'),
(57, 1, 11, 'repellat', 1, 39, 9, 'quos', 'temporibus', '2023-10-16'),
(58, 1, 7, 'porro', 1, 77, 7, 'numquam', 'est', '2023-06-17'),
(59, 1, 6, 'est', 1, 83, 2, 'ut', 'enim', '2023-03-02'),
(60, 1, 8, 'architecto', 1, 3, 5, 'iste', 'et', '2023-12-06'),
(61, 1, 9, 'eius', 1, 70, 2, 'modi', 'facilis', '2023-06-18'),
(62, 1, 10, 'iste', 1, 65, 8, 'similique', 'error', '2023-05-12'),
(63, 1, 10, 'quia', 1, 74, 7, 'accusantium', 'quo', '2023-06-14'),
(64, 1, 11, 'autem', 1, 99, 3, 'sed', 'id', '2023-09-22'),
(65, 1, 7, 'ut', 1, 35, 1, 'dolores', 'sit', '2023-09-28'),
(66, 1, 15, 'non', 1, 13, 2, 'sit', 'voluptas', '2023-10-19'),
(67, 1, 9, 'est', 1, 100, 9, 'quo', 'quod', '2023-09-28'),
(68, 1, 5, 'dolorum', 1, 39, 4, 'quia', 'at', '2023-02-08'),
(69, 1, 11, 'magnam', 1, 82, 4, 'quisquam', 'eveniet', '2023-12-28'),
(70, 1, 13, 'quod', 1, 5, 2, 'enim', 'minus', '2023-08-20'),
(71, 1, 13, 'illo', 1, 56, 5, 'et', 'dicta', '2023-08-08'),
(72, 1, 6, 'iusto', 1, 75, 7, 'omnis', 'voluptatem', '2023-12-11'),
(73, 1, 11, 'accusantium', 1, 63, 4, 'quis', 'iste', '2023-06-15'),
(74, 1, 10, 'vitae', 1, 85, 5, 'ut', 'et', '2023-03-24'),
(75, 1, 15, 'doloribus', 1, 42, 7, 'sit', 'quae', '2023-05-29'),
(76, 1, 10, 'sed', 1, 24, 4, 'numquam', 'quam', '2023-05-12'),
(77, 1, 8, 'iste', 1, 50, 5, 'consequatur', 'modi', '2023-08-23'),
(78, 1, 11, 'quisquam', 1, 90, 10, 'id', 'repellat', '2023-01-19'),
(79, 1, 10, 'molestiae', 1, 35, 9, 'dicta', 'nam', '2023-08-20'),
(80, 1, 13, 'at', 1, 24, 9, 'rerum', 'sunt', '2023-04-29'),
(81, 1, 13, 'nulla', 1, 50, 7, 'architecto', 'aliquid', '2023-05-08'),
(82, 1, 6, 'hic', 1, 85, 8, 'quia', 'itaque', '2023-02-15'),
(83, 1, 10, 'odio', 1, 22, 9, 'impedit', 'dolorem', '2023-10-18'),
(84, 1, 10, 'quibusdam', 1, 10, 10, 'nostrum', 'est', '2023-10-04'),
(85, 1, 8, 'soluta', 1, 97, 10, 'rerum', 'est', '2023-10-03'),
(86, 1, 13, 'totam', 1, 25, 5, 'eos', 'autem', '2023-10-09'),
(87, 1, 8, 'nobis', 1, 91, 6, 'amet', 'non', '2023-11-03'),
(88, 1, 13, 'animi', 1, 43, 3, 'ut', 'ut', '2023-10-16'),
(89, 1, 12, 'sint', 1, 14, 2, 'non', 'neque', '2023-03-20'),
(90, 1, 13, 'et', 1, 25, 6, 'suscipit', 'enim', '2023-09-25'),
(91, 1, 11, 'inventore', 1, 57, 8, 'aut', 'reiciendis', '2023-08-14'),
(92, 1, 7, 'aliquid', 1, 61, 6, 'fugiat', 'voluptatem', '2023-11-28'),
(93, 1, 10, 'autem', 1, 95, 9, 'vero', 'reiciendis', '2023-06-24'),
(94, 1, 15, 'ea', 1, 59, 3, 'aut', 'cumque', '2023-07-07'),
(95, 1, 15, 'eos', 1, 62, 9, 'tenetur', 'laborum', '2023-03-05'),
(96, 1, 7, 'voluptas', 1, 23, 8, 'velit', 'suscipit', '2023-11-25'),
(97, 1, 15, 'assumenda', 1, 56, 3, 'sed', 'laborum', '2023-08-30'),
(98, 1, 7, 'vel', 1, 100, 10, 'aut', 'autem', '2023-12-08'),
(99, 1, 7, 'voluptates', 1, 16, 3, 'natus', 'enim', '2023-09-07'),
(100, 1, 7, 'sunt', 1, 16, 4, 'et', 'quo', '2023-06-03'),
(101, 1, 5, 'sunt', 1, 60, 8, 'omnis', 'commodi', '2023-01-18'),
(102, 1, 13, 'laboriosam', 1, 18, 10, 'nobis', 'nam', '2023-03-08'),
(103, 1, 7, 'distinctio', 1, 67, 4, 'tempora', 'et', '2023-07-15'),
(104, 1, 14, 'aut', 1, 15, 10, 'ratione', 'voluptates', '2023-10-19'),
(105, 1, 11, 'reiciendis', 1, 93, 3, 'rerum', 'consectetur', '2023-12-13'),
(106, 1, 7, 'quisquam', 1, 22, 1, 'recusandae', 'et', '2023-10-15'),
(107, 1, 11, 'dolores', 1, 69, 1, 'quia', 'libero', '2023-12-24'),
(108, 1, 9, 'quas', 1, 75, 10, 'repellendus', 'amet', '2023-06-18'),
(109, 1, 15, 'aperiam', 1, 85, 5, 'dolor', 'vero', '2023-11-28'),
(110, 1, 13, 'sequi', 1, 49, 1, 'et', 'pariatur', '2023-03-20'),
(111, 1, 15, 'quis', 1, 84, 7, 'dolores', 'aut', '2023-03-29'),
(112, 1, 6, 'quaerat', 1, 35, 5, 'odio', 'voluptas', '2023-01-19'),
(113, 1, 6, 'natus', 1, 77, 2, 'non', 'deserunt', '2023-04-17'),
(114, 1, 8, 'autem', 1, 95, 2, 'inventore', 'saepe', '2023-11-21'),
(115, 1, 5, 'sunt', 1, 53, 4, 'architecto', 'officia', '2023-06-03'),
(116, 1, 10, 'eum', 1, 70, 3, 'dolore', 'qui', '2023-12-27'),
(117, 1, 11, 'dolorem', 1, 9, 6, 'exercitationem', 'magnam', '2023-05-11'),
(118, 1, 6, 'nihil', 1, 5, 9, 'ut', 'aut', '2023-02-21'),
(119, 1, 8, 'totam', 1, 57, 4, 'ut', 'in', '2023-12-22'),
(120, 1, 6, 'deserunt', 1, 61, 9, 'enim', 'voluptatem', '2023-03-21'),
(121, 1, 11, 'quis', 1, 49, 4, 'repellendus', 'labore', '2023-01-22'),
(122, 1, 5, 'a', 1, 90, 9, 'necessitatibus', 'inventore', '2023-10-05'),
(123, 1, 10, 'praesentium', 1, 26, 7, 'debitis', 'repellat', '2023-12-29'),
(124, 1, 10, 'sed', 1, 96, 3, 'quam', 'et', '2023-04-26'),
(125, 1, 12, 'velit', 1, 16, 6, 'praesentium', 'reiciendis', '2023-06-11'),
(126, 1, 13, 'reprehenderit', 1, 72, 6, 'sed', 'debitis', '2023-11-13'),
(127, 1, 8, 'qui', 1, 27, 1, 'quia', 'qui', '2023-02-20'),
(128, 1, 13, 'quisquam', 1, 11, 1, 'qui', 'eos', '2023-07-19'),
(129, 1, 11, 'qui', 1, 44, 1, 'veritatis', 'animi', '2023-05-01'),
(130, 1, 11, 'optio', 1, 70, 7, 'nihil', 'minus', '2023-06-28'),
(131, 1, 12, 'velit', 1, 33, 8, 'sed', 'pariatur', '2023-10-15'),
(132, 1, 9, 'soluta', 1, 12, 5, 'nobis', 'quia', '2023-12-26'),
(133, 1, 9, 'iste', 1, 37, 2, 'voluptatum', 'iusto', '2023-02-13'),
(134, 1, 14, 'non', 1, 32, 4, 'velit', 'aut', '2023-01-31'),
(135, 1, 12, 'architecto', 1, 54, 7, 'quis', 'in', '2023-04-24'),
(136, 1, 10, 'est', 1, 10, 3, 'enim', 'corrupti', '2023-02-15'),
(137, 1, 7, 'temporibus', 1, 97, 2, 'rerum', 'numquam', '2023-07-07'),
(138, 1, 5, 'et', 1, 79, 5, 'dicta', 'at', '2023-02-22'),
(139, 1, 11, 'et', 1, 88, 10, 'quia', 'blanditiis', '2023-04-26'),
(140, 1, 12, 'nam', 1, 37, 9, 'aut', 'perspiciatis', '2023-11-17'),
(141, 1, 5, 'dolore', 1, 39, 8, 'quia', 'magnam', '2023-09-16'),
(142, 1, 10, 'repellendus', 1, 17, 9, 'quaerat', 'repellat', '2023-04-10'),
(143, 1, 12, 'odit', 1, 62, 7, 'quaerat', 'facilis', '2023-08-16'),
(144, 1, 15, 'voluptatem', 1, 38, 10, 'facere', 'distinctio', '2023-10-06'),
(145, 1, 5, 'temporibus', 1, 90, 7, 'et', 'beatae', '2023-12-25'),
(146, 1, 11, 'quia', 1, 28, 2, 'ut', 'animi', '2023-11-07'),
(147, 1, 7, 'fuga', 1, 70, 3, 'et', 'eum', '2023-11-13'),
(148, 1, 9, 'est', 1, 67, 8, 'adipisci', 'ut', '2023-05-16'),
(149, 1, 7, 'cumque', 1, 64, 9, 'similique', 'non', '2023-01-11'),
(150, 1, 8, 'nesciunt', 1, 59, 9, 'occaecati', 'quisquam', '2023-04-23');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `price_models`
--

CREATE TABLE `price_models` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `price` int NOT NULL,
  `count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `price_models`
--

INSERT INTO `price_models` (`id`, `name`, `price`, `count`) VALUES
(12, 'hic', 24, 9),
(13, 'voluptatem', 38, 4),
(14, 'quia', 43, 6),
(15, 'repellat', 32, 4),
(16, 'delectus', 60, 8),
(17, 'nostrum', 71, 3),
(18, 'quasi', 8, 3),
(19, 'similique', 51, 0),
(20, 'voluptatum', 4, 0),
(21, 'dolores', 48, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Dr. Dameon Ward DVM', 'rosario.deckow@example.net', '2024-01-06 21:08:03', '$2y$12$p1HwcA.Mc909zoDI6Vaw3uICABL5GNwsc9qdw/cwh744Y6TxIuCyK', 'o4S9RQNOlW', '2024-01-06 21:08:03', '2024-01-06 21:08:03'),
(3, 'Marie Walker', 'alek60@example.net', '2024-01-06 21:08:03', '$2y$12$p1HwcA.Mc909zoDI6Vaw3uICABL5GNwsc9qdw/cwh744Y6TxIuCyK', 'g2AuLTpl2K', '2024-01-06 21:08:03', '2024-01-06 21:08:03'),
(4, 'Agustin Weber', 'qrice@example.org', '2024-01-06 21:08:03', '$2y$12$p1HwcA.Mc909zoDI6Vaw3uICABL5GNwsc9qdw/cwh744Y6TxIuCyK', 'oE0vT2QGNC', '2024-01-06 21:08:03', '2024-01-06 21:08:03'),
(5, 'Kaci Fahey', 'xwaelchi@example.net', '2024-01-06 21:08:03', '$2y$12$p1HwcA.Mc909zoDI6Vaw3uICABL5GNwsc9qdw/cwh744Y6TxIuCyK', 'vtJFgnMaIw', '2024-01-06 21:08:03', '2024-01-06 21:08:03'),
(6, 'Leta Quitzon Jr.', 'kassulke.lillian@example.net', '2024-01-06 21:08:03', '$2y$12$p1HwcA.Mc909zoDI6Vaw3uICABL5GNwsc9qdw/cwh744Y6TxIuCyK', 'Qv2HaAMsFK', '2024-01-06 21:08:03', '2024-01-06 21:08:03'),
(7, 'Cornell Zemlak', 'dweissnat@example.net', '2024-01-06 21:08:03', '$2y$12$p1HwcA.Mc909zoDI6Vaw3uICABL5GNwsc9qdw/cwh744Y6TxIuCyK', 'o3iPqy5QPU', '2024-01-06 21:08:03', '2024-01-06 21:08:03'),
(8, 'Jaren Berge', 'qgerlach@example.com', '2024-01-06 21:08:03', '$2y$12$p1HwcA.Mc909zoDI6Vaw3uICABL5GNwsc9qdw/cwh744Y6TxIuCyK', 'PU2bJWXnFC', '2024-01-06 21:08:03', '2024-01-06 21:08:03'),
(9, 'Elisabeth Klein', 'jewel.lehner@example.org', '2024-01-06 21:08:03', '$2y$12$p1HwcA.Mc909zoDI6Vaw3uICABL5GNwsc9qdw/cwh744Y6TxIuCyK', 'bPOd8w12KF', '2024-01-06 21:08:03', '2024-01-06 21:08:03'),
(10, 'Raquel Friesen', 'herminia31@example.com', '2024-01-06 21:08:03', '$2y$12$p1HwcA.Mc909zoDI6Vaw3uICABL5GNwsc9qdw/cwh744Y6TxIuCyK', 'cGD0AaiI40', '2024-01-06 21:08:03', '2024-01-06 21:08:03'),
(11, 'Chyna Medhurst', 'lance03@example.net', '2024-01-06 21:08:03', '$2y$12$p1HwcA.Mc909zoDI6Vaw3uICABL5GNwsc9qdw/cwh744Y6TxIuCyK', '1wE1xnRNd7', '2024-01-06 21:08:03', '2024-01-06 21:08:03');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_models`
--
ALTER TABLE `order_models`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `price_models`
--
ALTER TABLE `price_models`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `order_models`
--
ALTER TABLE `order_models`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `price_models`
--
ALTER TABLE `price_models`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
