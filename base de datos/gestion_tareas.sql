-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2024 a las 16:23:19
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_tareas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` enum('por_iniciar','en_proceso','terminado') NOT NULL,
  `categoria_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`id`, `nombre`, `descripcion`, `estado`, `categoria_id`, `created_at`, `updated_at`) VALUES
(1, 'Limpieza del parque central', 'Una actividad para limpiar el parque central de la ciudad.', 'por_iniciar', 1, NULL, NULL),
(2, 'Reforestación', 'Plantación de árboles en áreas deforestadas.', 'por_iniciar', 2, NULL, NULL),
(3, 'Clases de inglés gratuitas', 'Clases de inglés gratuitas para la comunidad.', 'por_iniciar', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Comunidad', NULL, NULL),
(2, 'Medio Ambiente', NULL, NULL),
(3, 'Educación', NULL, NULL),
(4, 'Salud', NULL, NULL),
(5, 'Cultura', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evidencias`
--

CREATE TABLE `evidencias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `actividad_id` bigint(20) UNSIGNED NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
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
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_29_202605_create_categorias_table', 1),
(5, '2024_05_29_202608_create_tareas_table', 1),
(6, '2024_06_01_192246_create_actividades_table', 1),
(7, '2024_06_01_192436_create_evidencias_table', 1),
(8, '2024_06_05_185152_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'NombreDelToken', 'f19b966c06897ea9eedc0cf85409467dff04764d8d9bd14bd49a5607eafb16aa', '[\"*\"]', NULL, NULL, '2024-06-06 04:42:16', '2024-06-06 04:42:16'),
(2, 'App\\Models\\User', 2, 'NombreDelToken', '0bb15e239d5c309d55e3be067d6f0c4c890259e613bb030a2101cc3b7e46a8dd', '[\"*\"]', NULL, NULL, '2024-06-06 04:42:22', '2024-06-06 04:42:22'),
(3, 'App\\Models\\User', 5, 'NombreDelToken', '03418da81ee46d139c04b37bc8f5e94bca7698d74ea0393f85725215b86ca23a', '[\"*\"]', NULL, NULL, '2024-06-06 04:44:03', '2024-06-06 04:44:03'),
(4, 'App\\Models\\User', 6, 'NombreDelToken', 'cd5fef4ea11a865e0b3cb10e98a91ccfd2d4bf7299b5ac3b64b09e3568ebd9d4', '[\"*\"]', NULL, NULL, '2024-06-06 04:48:26', '2024-06-06 04:48:26'),
(5, 'App\\Models\\User', 7, 'NombreDelToken', 'b7ede56938178ea97ebb8dae5ab7efc32fda7d83d7ca11eb141bba9f21b092a1', '[\"*\"]', NULL, NULL, '2024-06-06 04:50:02', '2024-06-06 04:50:02'),
(6, 'App\\Models\\User', 8, 'auth_token', '528bfb59278246f5ab4feb8ab182ab7b6d92e483f7c55f42b94f4d13c9890e66', '[\"*\"]', NULL, NULL, '2024-06-06 05:12:42', '2024-06-06 05:12:42'),
(7, 'App\\Models\\User', 8, 'auth_token', '8f533ad4d5dc4a107262ab710139b2895ffb5e507a19c7bd9e5fe0a40bedea80', '[\"*\"]', NULL, NULL, '2024-06-06 05:13:17', '2024-06-06 05:13:17'),
(8, 'App\\Models\\User', 8, 'auth_token', '2733fa82449dfe86614e7c4ffdc21d230355eba56efc2d3f180cabc3bca86209', '[\"*\"]', NULL, NULL, '2024-06-06 05:13:23', '2024-06-06 05:13:23'),
(9, 'App\\Models\\User', 8, 'auth_token', '6dd9853137267179089b3addee6107699d2bf76eab7efcdc296c7953847b2814', '[\"*\"]', NULL, NULL, '2024-06-06 05:13:25', '2024-06-06 05:13:25'),
(10, 'App\\Models\\User', 8, 'auth_token', 'c30d47755639df4ffa417ca83430ce709adf554f0e81ceceabd95b99b1bf3411', '[\"*\"]', NULL, NULL, '2024-06-06 05:13:26', '2024-06-06 05:13:26'),
(11, 'App\\Models\\User', 8, 'auth_token', '68eee0a43050d587aca2fbc01f6f02fb318ed2b2847b41b48801dc4ecdf8bfaa', '[\"*\"]', NULL, NULL, '2024-06-06 05:13:26', '2024-06-06 05:13:26'),
(12, 'App\\Models\\User', 8, 'auth_token', 'c3d7257841ccb6fc6ba9e74073d73150cce1db8cda6633e329e16f216f1576e5', '[\"*\"]', NULL, NULL, '2024-06-06 05:13:26', '2024-06-06 05:13:26'),
(13, 'App\\Models\\User', 8, 'auth_token', 'cb4255bde4ea9251f02f2796108a18eb8c0e54fb21d5a722129c63f5928ba26a', '[\"*\"]', NULL, NULL, '2024-06-06 05:13:27', '2024-06-06 05:13:27'),
(14, 'App\\Models\\User', 8, 'auth_token', '3a4bc057512f55edd9e3f35ab58ee79a7f461d11985b870211ec8395054663fd', '[\"*\"]', NULL, NULL, '2024-06-06 05:13:28', '2024-06-06 05:13:28'),
(15, 'App\\Models\\User', 8, 'auth_token', 'a599bcde83c31599a1da4d7cc044ae43e200118ac75a7b4f0c84e6f3e53987a7', '[\"*\"]', NULL, NULL, '2024-06-06 05:13:28', '2024-06-06 05:13:28'),
(16, 'App\\Models\\User', 8, 'auth_token', 'fcebec33e6d7171bd93e9db6e1a2e2dd144fc9a9e8bb047fb88e899d30f9fecc', '[\"*\"]', NULL, NULL, '2024-06-06 05:13:28', '2024-06-06 05:13:28'),
(17, 'App\\Models\\User', 8, 'auth_token', '4ae7007177a38792c42717d8b0af3a7f16c2477ea8e75bb43123f128c91e93a0', '[\"*\"]', NULL, NULL, '2024-06-06 05:13:29', '2024-06-06 05:13:29'),
(18, 'App\\Models\\User', 8, 'auth_token', 'd17376c1b667931d16476bde6e1ec6b7f23703ea573e17338d74ccaa2a0d18db', '[\"*\"]', NULL, NULL, '2024-06-06 05:13:30', '2024-06-06 05:13:30'),
(19, 'App\\Models\\User', 8, 'auth_token', '5e12a180f73bdeb7c63dc355d42a67633723f94ffa2cbd0f390f9a88989a805d', '[\"*\"]', NULL, NULL, '2024-06-06 05:13:49', '2024-06-06 05:13:49'),
(20, 'App\\Models\\User', 8, 'auth_token', '26ffe5c1e99b4778f744abd81b18b4ed60dacb0576831999ce531555a1cefeaa', '[\"*\"]', NULL, NULL, '2024-06-06 05:13:57', '2024-06-06 05:13:57'),
(21, 'App\\Models\\User', 8, 'auth_token', '9d4e5117f3d8ecec24386e303169a6bdd58955147a80a08f68e4033f31555288', '[\"*\"]', NULL, NULL, '2024-06-06 05:13:57', '2024-06-06 05:13:57'),
(22, 'App\\Models\\User', 8, 'auth_token', '40e1f7bfe8a440e1c7c6d9b5cd0155f89e36908f9aa75f4668f41c3c7449a193', '[\"*\"]', NULL, NULL, '2024-06-06 05:14:11', '2024-06-06 05:14:11'),
(23, 'App\\Models\\User', 8, 'auth_token', '8afcb0890893f76bd1d46da3c837a2f8e1f9ede3a7d6e109d43292c64d932ed7', '[\"*\"]', NULL, NULL, '2024-06-06 05:15:55', '2024-06-06 05:15:55'),
(24, 'App\\Models\\User', 8, 'auth_token', 'b6a5a15c65b5d2402726c8bc9ed9e436ca9955462a2c12ef9a1842c899c3d5d7', '[\"*\"]', NULL, NULL, '2024-06-06 05:15:56', '2024-06-06 05:15:56'),
(25, 'App\\Models\\User', 8, 'auth_token', '11fe7de06db35852bab8d704bbf0313c2a1ce0555528e7900642966ed072a070', '[\"*\"]', NULL, NULL, '2024-06-06 05:15:56', '2024-06-06 05:15:56'),
(26, 'App\\Models\\User', 8, 'auth_token', 'c315fb7d51c5edff76cc9798411241070e9497420478709f86a9e459c738d4eb', '[\"*\"]', NULL, NULL, '2024-06-06 05:15:57', '2024-06-06 05:15:57'),
(27, 'App\\Models\\User', 9, 'auth_token', '465910daa5ff7fbb5802f3680f5d8af8bfbb1f9e5e4275155a9bbf185739b6e0', '[\"*\"]', NULL, NULL, '2024-06-06 05:18:05', '2024-06-06 05:18:05'),
(28, 'App\\Models\\User', 15, 'auth_token', '48f74adec866722f962ee89ec5492df2f6a6c2d274bd09dda91353604590db38', '[\"*\"]', NULL, NULL, '2024-06-06 05:41:14', '2024-06-06 05:41:14'),
(29, 'App\\Models\\User', 16, 'auth_token', '9a6c06ca1fd9150ed69fb0c15fd723b4815d3f50a46ff6c8e938fadb3c9b715e', '[\"*\"]', NULL, NULL, '2024-06-06 05:44:32', '2024-06-06 05:44:32'),
(30, 'App\\Models\\User', 16, 'auth_token', '01c417f14d500893154bc7d4641b9516541d7f7c2a16ab8e59ec76363efc750a', '[\"*\"]', NULL, NULL, '2024-06-06 05:45:26', '2024-06-06 05:45:26'),
(31, 'App\\Models\\User', 16, 'auth_token', 'bf579ce3b68963ce5a20100eac9de8e971c51fe4c18735236ba78950586edd6f', '[\"*\"]', NULL, NULL, '2024-06-06 05:45:29', '2024-06-06 05:45:29'),
(32, 'App\\Models\\User', 16, 'auth_token', '1d1666b8056b128c7b054fbaffc04eb67df8757d3d934d13e286959bf5bd78d7', '[\"*\"]', NULL, NULL, '2024-06-06 05:45:30', '2024-06-06 05:45:30'),
(33, 'App\\Models\\User', 16, 'auth_token', '3aee0d413fd8df5bcab526cf22ba848fe0a0eaf9951eac20fa5ba9194cd2e8c7', '[\"*\"]', NULL, NULL, '2024-06-06 05:49:18', '2024-06-06 05:49:18'),
(34, 'App\\Models\\User', 16, 'auth_token', '75c7593825d68f3f03f6686ce59121527165593194a2c468b5353f3b3349b0f6', '[\"*\"]', NULL, NULL, '2024-06-06 05:50:36', '2024-06-06 05:50:36'),
(35, 'App\\Models\\User', 16, 'auth_token', '5214022b2c2c982b93881d3b3b4dc4a8e979cdb281453ea63384a11769fde9d5', '[\"*\"]', NULL, NULL, '2024-06-06 05:51:40', '2024-06-06 05:51:40'),
(36, 'App\\Models\\User', 16, 'auth_token', 'b5f4dfd9dcd8e187df2ebac73fafa81342d06fd5d1898b6bd8320ce697d724b5', '[\"*\"]', NULL, NULL, '2024-06-06 05:52:53', '2024-06-06 05:52:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('01q8eYRKyj2gpNmQ7LQtXMSl2nWgmCLcNKcWheY2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidWFLT3hxMnpJRmV5UWluZU1SNENEMVpvZEdyejliYmJZY3ZnQ2ZJRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717575209),
('0pFaxRD9PctRnA9G4E4ZJYliDXLRLKooWINVXD3Y', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemZjbXBJVjdvOUFncGxDS1FZTG1ZUnlhMk1BVkozUVpsOWFpcXRmbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvYWN0aXZpZGFkZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717340823),
('1VM4o25a0IWOvAO8aHJtsQfrvP6sewUd0T59PS9e', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTEJyNFRIb3Z3WUlTaEFtdDNRV2xxSWFmaGpNZUVrcDJ1RnJRV0xPNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717339972),
('1xICjCKIQl5jB5n9NhSOBMXBn11dMEFhcNZGfA4f', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRHlTbFc0QzlzQTM0RXJsZVBDbWdicmRtdTFuZnVuTmRwdzIzaExmQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717573626),
('4r0EIYAWgtlEoGCcic0gzBXjPhw8JfdJ09cpyqbi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3FGaWNISWpGcVpTZWJMQzlpVzY5UFpHWnVINWpPRDRadmxXTGs4YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmVnaXN0ZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717574323),
('4WXzsixv0ynDZ9AZQAsu4tCztGmufZ5ibO0BbB5c', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0JDRDNEWENRVUtaejhqMHRWQXFGd202VmpvWXJwVEtZZEZCZkM0diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvYWN0aXZpZGFkZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717340823),
('8ls7DI7iXUJI8AQsOvY4hNkfbadtL2KQlwamhn2X', NULL, '127.0.0.1', 'PostmanRuntime/7.39.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmF1UFRxcXhBT1BPVFNEV2ZKODNMeTZVZWtKWjlVaXk2aHVaaVlJTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1717571127),
('BbpgzYvEH8vWU1anAxq7xWsR3kWjEXhlcVZlc8jp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFhiTWYyWHFzZ013MzhTMTNDcDYzVXc2YVRFRmxQdTlLRFdtck96RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvYWN0aXZpZGFkZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717336964),
('cEGgbRToq0dgm99gxbZgcV1jchnu1EpRiwQsVdN1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDJxWWF0NVpwSklmaFZwcFRVeXZudGFhOHFGN3k1cnJCS0laelN1YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmVnaXN0ZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717574448),
('d44gYhslfiuPMefCtkd9w2g4yd4ATA3ibnEtTya3', NULL, '127.0.0.1', 'PostmanRuntime/7.39.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWFNN2Y0Qm5INGFrV01RQ0ZNVWFPdW9KWms2aXFKSzcxVUxpU0xNaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmVnaXN0ZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717613575),
('e2b7UOnBvgWS1OeFnljqy8nIf6S6MlWvuVh72N3l', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUEZab0lxWktnNGQ4djR5ZVpSMWV4SnZNSDNTZlQxNGgwRGpBRzZSViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717573626),
('fZ4Gk29SnMMzqtbvJ8mYyfuEZLCjSHmQIWvjbcWE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicVJJOWMydE5YYmIyODNZQ0FMMEpwa3Vva1lyN0U3NmdZSm5LRXVsTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717594908),
('GuCrsbrqFo9CFF47gFNvP6Cr6Rm25dZ4EFNBoULo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWjE4dWJ1YUZTdVRjcWdEcjYzVnJmOGcySFJTeGpkUkExb0QzWWh5ciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717559356),
('gz0Am31hlHoq6JqtfaPL7yD12UJagjei4rfO0Em9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTVd1emFkc1dENElnMGFTaFMzeWRValExcGxlRXhORkpjVzJWbUVBZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717613568),
('HAPZFrDglyygiu5J69yVCB4J2vUibIfclniDLL3i', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTFTYlUwSU1XYjVKR0RobnpPdFFyOTRBV0ZtbDdFOHRobHlUdng0USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvYWN0aXZpZGFkZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717340110),
('HiY8bOkWYKjatliQ8gljyxyoL3JcmlLrIkPxKwxs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQXU1b1pDMlRGc3dWZml2WEt3TkdnRlFXaGpkWGlWU0d3QW1qVzN2USI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717574887),
('I4CP2eXkig5u7kJWTfNQQfZae4ZUWNQjBkO5neTo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieUFDU2tnY1B0WVJacnBDNEFETE1JSHFrbHJubzl0YWRWbmpScWRSdyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717559867),
('iG82QaFEvpuSTky25YUb1MXUQQCimbhk7RrEJXyY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVjhaQmJJY1Z3VHVZS2xiQVZHUWdqOVE2YXRWVEZaSUxKcnNSTkJMdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717339973),
('iZXVxKyH8dLcyfpnZx7qBde88NXKTjejayz8BeIx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1AxN0NZaFR4SW5LQWdyeXpncFltZEU1U1VPOU9vVUF2aE8xTmphNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmVnaXN0ZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717574366),
('JipwC7v2TZh0cbx0rYe6FHT74HujAYtky5aNN6zd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYWZUOTMzN1VIVVVXTjR6cGtBeXM1NDYxbFJzS1FPaHNqM2ZBb3Q2OSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717613302),
('JtSoUUj6YfDj5G4gad6qFfNy8ZOQjiaLfdwl1fQ7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoib0xXWkN1TE5ENW43MDBVdnRON3BRbFRGb3lEVjMxZUM4bmR2UVlGTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717575755),
('LdPnbweHNkQMfLSq1SvIy3db790udS1f2fFlhDuQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibk5lRExIRFBzdXM2YjJMMlVPQm04Y0RpaVZLY1ZKWEwzcHpqcGhzYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvYWN0aXZpZGFkZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717337127),
('mckNg4LdM5wDhnWTWDidD9oknQvK8IQNFjc9OMaG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDBwdlZvYVJIMVdPZzNZaXhGREhjcllZMnVGZFg2V0toNEpZNWpTOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvYWN0aXZpZGFkZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717339987),
('MNQmnMNzNBjL3zA9mAGL3Zc7MfC1tArauBCXn5ak', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVVITUNnWDN2WFlUNmFOcFdJWkNZS0lTdlBxb3hQbktZajFJVkxvTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmVnaXN0ZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717574448),
('mWPKt6NG0wmZWd10lnWXJzgf49K6EjwdKS9DXcOU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDREUEFYWVdkdkxvdFc1YURRRkRCRVJOSnpZUzhjSE13N2dlT0xHZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvYWN0aXZpZGFkZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717336964),
('NuKPWVU7gPRgq1PNMTaVLu1XGSWufZx5nlME7nsf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRFc0QmhGWXlPU0Q1MlU5b2MxQnY4WVVjNnFBZHN2aDRjMlBXRjJhbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717612328),
('oA3A7TOmw54vJNzd8FKedPzCQ8UBgPse0ihA6qlT', NULL, '127.0.0.1', 'PostmanRuntime/7.39.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1RHSFFCM2JER0hQa0ZRcndBYUlrVE9mODFGSFVHVmljZ1Ewa3BwNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmlhcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1717338847),
('pjNNbMB6UvtnfbLS2SHkWLCnOXFoSnoGmEEwxQCM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHBaWnhpQXI4SmlzdWZ2WVZMWm1UUDRNUE1tUXZSZkxMdlo2WjcxUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvYWN0aXZpZGFkZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717339986),
('rsl1EZ5Qm7xds0rwi5UTSNXitDpX8JfsY3y1IgBH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjN6TTF4MUxKRzlJejJ1cm1mYWlmZFEwSnhxdHNuMkZMdnV3aEFpYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmVnaXN0ZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717574366),
('skt3BfE1gw113QSfuO4jIK6b7P3AsHa0q6wIh1Dz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1Jua09uY0ZWemFQSFY1SFJXVXVkNDR1Q1FOZlRGTTk2UlFGdmN1TyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1717595229),
('UDXV1EwqBo84gKwkwCoyo7UnsnHS1SiJX8s2yRx0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGxRU0UwNGNxem1hR1F4dlJ2RXVhelgzWmdTc0lxSFBxaTRQcFF1cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvYWN0aXZpZGFkZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717340110),
('UPNbKiBRsu7ZCJ7ITLox1emFKVBpydSu3bj7sd8v', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXBlbkVnVlEwdG9xQnpxcWR3WnFoVkp1MmlaUkxNZmUwNHdtZEtwUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvYWN0aXZpZGFkZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717337692),
('wC7JSDsnC7b7bJuodoDOnrTihg8XWyyuIgvaZ0iE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOGp1ajVCQkVrRkphYnFoVXpxRGR4OXVoVmZiRjFXdDgwY1daVHJ1ZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717557569),
('wtZnPt1m4JY8vwdF0HJaOwyFnYngJlGPSn2uPu0R', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGZ2QUVUMnlBbVpaNjI2OVJQTlBBVG02QmZieFhnempjMHBlRmVTSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmVnaXN0ZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717574335),
('X3qLRhTDNcobKCQhu091Wr07N45v7JRUKFigHIcM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXhJOGM1OVYzUFBoT1FuaWdSRkFPYUFEOVNjUDZ4dDJpekdkYkcxeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvYWN0aXZpZGFkZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717340325),
('XFl8ZlF0ZHMdDxNXd0AmbtC22SuNgz270duvd2IE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmxlNU1YREdCUFFMNlZ6bmJxTHdKTGtkenFxaTZ5Z3RwRU1JYXRXbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvYWN0aXZpZGFkZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717340325),
('XRrAXDQwB3XM6bsAwx5htph6omj8LDIWt6nvWzhD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieWs2aUJlcW16TnpaN3BYZkFpb1pMTnFSa3JBWVdDOFZhUmh6YUtOaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717612327),
('ycxIhfvLp5WuNEmCqAti2lG2uIEYD5m71c7xXnV1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFVKZWdYRlA1ZERMZlhLd1Z6czJUcGNMamwwanZYNGI5SUNvME83TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmVnaXN0ZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717574339);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `categoria_id` bigint(20) UNSIGNED DEFAULT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` enum('pendiente','en_proceso','completada') NOT NULL DEFAULT 'pendiente',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2024-06-02 20:02:05', '$2y$12$LkRD1SK/lCbBCZX2ysOCVepKFvV3NHMMjm9hcSQvysdhOnU/P/UaW', 'CH3xNqZaXp', '2024-06-02 20:02:05', '2024-06-02 20:02:05'),
(2, 'montoya', 'montoya@gmail.com', NULL, '$2y$12$cow3DUPSYW.TfOfCu21YhO.MCigPGp.VVraQSJOAuiOVTxY/0yHsi', NULL, '2024-06-06 04:26:58', '2024-06-06 04:26:58'),
(3, 'Montoya', 'montoyados@gmail.com', NULL, '$2y$12$xlzz0GIMToFkLKNjbUpLluNjmZ1Z75DHIDhZPexjjfmfdD2Qr0Qvm', NULL, '2024-06-06 04:28:33', '2024-06-06 04:28:33'),
(4, 'susy', 'herrera.marin.emily@gmail.com', NULL, '$2y$12$5iRrsHwRQXdR6qiA7UJvJ.uq1J6nVfEl15L7gNccB6uCOYtfar9VO', NULL, '2024-06-06 04:32:37', '2024-06-06 04:32:37'),
(5, 'Allan', 'Allan@gmail.com', NULL, '$2y$12$AKcLlFetcWvj5jZy0XZDZOev1YUduL2FkceBSuED7bYtblperRKDu', NULL, '2024-06-06 04:42:50', '2024-06-06 04:42:50'),
(6, 'Emi', 'emi@gmail.com', NULL, '$2y$12$cTkercK.tCoTx.mRW/.VgeK798juCPmrno2GEjhUF/F1oXl2UU3YK', NULL, '2024-06-06 04:48:26', '2024-06-06 04:48:26'),
(7, '0odqa', 'oda@gmail.com', NULL, '$2y$12$fNqF/8sPrCR3CcEeaTD.4OGdA99SXZFxI4rdFt8Xr/cjlZv/1UDla', NULL, '2024-06-06 04:50:02', '2024-06-06 04:50:02'),
(8, 'susy', 'edwin@gmail.com', NULL, '$2y$12$h3N0oMr4VAWcDOQYDRCGt.YR2fyQiskqZ.Mce5tJrMPGPZZN1gJKC', NULL, '2024-06-06 05:12:42', '2024-06-06 05:12:42'),
(9, 'MontoyaH', 'Hernandez@gmail.com', NULL, '$2y$12$E5oPUh6zFEcxCKEF9yc.9exFgYBxCph6xfnmTIUnbgWInFkYilZg2', NULL, '2024-06-06 05:18:05', '2024-06-06 05:18:05'),
(13, 'MontoyaH', 'Hernandez121@gmail.com', NULL, '$2y$12$gG4orkN7uJ1OtvbxijMqSu2/.54CZ1TNbD1BZEyZQYu9x3X1Ertzq', NULL, '2024-06-06 05:30:52', '2024-06-06 05:30:52'),
(14, 'MontoyaH', 'Hernandez51@gmail.com', NULL, '$2y$12$/5htAkWAW33Y1vTMBVGZY.a07tFIFxU0g6/tj68Tkn1QnJiMU6N1C', NULL, '2024-06-06 05:33:48', '2024-06-06 05:33:48'),
(15, 'MontoyaH', 'Hernandez551@gmail.com', NULL, '$2y$12$RwNTS3yni63oeGBjfH/ID.2HluDabvnTU/Jlg0n3CdFK5GltySXn.', NULL, '2024-06-06 05:41:14', '2024-06-06 05:41:14'),
(16, 'ola', 'ola@gmail.com', NULL, '$2y$12$pkn3.K27RQTZ4LMu3VkruOHDydWvgJ5.ugoU2KhFGUsxwqUjRx8oG', NULL, '2024-06-06 05:44:32', '2024-06-06 05:44:32');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actividades_categoria_id_foreign` (`categoria_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evidencias`
--
ALTER TABLE `evidencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evidencias_user_id_foreign` (`user_id`),
  ADD KEY `evidencias_actividad_id_foreign` (`actividad_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tareas_user_id_foreign` (`user_id`),
  ADD KEY `tareas_categoria_id_foreign` (`categoria_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `evidencias`
--
ALTER TABLE `evidencias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `actividades_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `evidencias`
--
ALTER TABLE `evidencias`
  ADD CONSTRAINT `evidencias_actividad_id_foreign` FOREIGN KEY (`actividad_id`) REFERENCES `actividades` (`id`),
  ADD CONSTRAINT `evidencias_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tareas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
