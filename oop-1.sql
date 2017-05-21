-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Май 21 2017 г., 13:41
-- Версия сервера: 10.1.16-MariaDB
-- Версия PHP: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `oop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `albums`
--

CREATE TABLE `albums` (
  `id` int(3) UNSIGNED NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `dir` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `albums`
--

INSERT INTO `albums` (`id`, `name`, `date`, `dir`) VALUES
(1, 'album1', '2017-05-10', 'img-repo/album1/'),
(2, 'album2', '2017-05-07', 'img-repo/album2/'),
(3, 'album3', '2017-05-03', 'img-repo/album3/');

-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE `events` (
  `id` int(3) UNSIGNED NOT NULL,
  `name` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `location` varchar(500) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `tags` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `events`
--

INSERT INTO `events` (`id`, `name`, `date`, `location`, `text`, `tags`) VALUES
(1, 'выфолрафыолвралдфывралдфхуй', '2017-05-02', 'фждваопфждвапофдпаофдпохуй', 'мылаждывладфывладжфвы', 'ЯМЧьЯДМОджчсОМджосмждчяомсж'),
(2, 'ХУЙ', '2017-05-18', 'Иван', 'ewfwefwefwef', 'wefwefwefwe'),
(5, 'укпукпку', '2017-05-18', 'Иван', 'укукпукпукп', 'кпукпукпу');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(3) UNSIGNED NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `author` varchar(32) DEFAULT NULL,
  `text` varchar(3200) DEFAULT NULL,
  `tags` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `name`, `date`, `author`, `text`, `tags`) VALUES
(1, 'новость1skjjhksdfbgslhk', '2017-05-17', 'Иван', 'blablabladfsdffd', 'tag1'),
(3, 'hrentitleAdminffgg', '2017-05-17', 'Иван', 'textAdminergre', 'tagsAdmin5464'),
(29, 'hrentitleAdminffgg', '2017-05-17', 'Иван', 'textAdminergre', 'tagsAdmin5464'),
(34, 'errr', '2017-05-17', 'Иван', 'errrererer', 'ererererer'),
(38, 'errr45', '2017-05-17', 'Иван', 'errrererer', 'ererererer'),
(39, 'errr45', '2017-05-17', 'Иван', 'errrererer', 'ererererer'),
(40, 'fdgdggfd', '2017-05-17', 'Иван', 'sdfsdfsdfe', 'erterter'),
(43, '454354354', '2017-05-17', 'Иван', '4534534534', '43534534');

-- --------------------------------------------------------

--
-- Структура таблицы `photos`
--

CREATE TABLE `photos` (
  `id` int(3) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `id_album` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `photos`
--

INSERT INTO `photos` (`id`, `url`, `id_album`) VALUES
(1, 'hot-air-balloon-valley-sky-99551.jpeg', 1),
(2, 'landmark-bridge-cliff-california.jpeg', 1),
(3, 'grasshopper-insect-nature-animal-59981.jpeg', 2),
(4, 'pexels-photo-129922.jpeg', 2),
(5, 'field-summer-sun-meadow.jpg', 3),
(6, 'lights-night-dark-abstract.jpeg', 3),
(7, 'pexels-photo-54278.jpeg', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id_user` int(3) UNSIGNED NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `surname` varchar(32) DEFAULT NULL,
  `login` varchar(32) NOT NULL,
  `pass` char(32) NOT NULL,
  `mode` varchar(32) DEFAULT NULL,
  `user_session` varchar(32) DEFAULT NULL,
  `user_token` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id_user`, `name`, `surname`, `login`, `pass`, `mode`, `user_session`, `user_token`) VALUES
(1, 'Иван', 'Иванов', 'login', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', '0eb1uomad0pqk6u8qbllnm1vb5', 'vprlhuli5fmth65ylc2x1lp5w6vmtsxu'),
(2, 'Никита', 'Назаров', 'niknaz', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'nm1ul28spfer10b9enuu72s7k5', 'jx0g8xthpf5wdk9j7yuspm4fu8uv2u6x'),
(3, 'имя имя', 'фамилия фамилия', 'loginlogin', '9dbb300e28bc21c8dab41b01883918eb', 'user', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `events`
--
ALTER TABLE `events`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT для таблицы `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
