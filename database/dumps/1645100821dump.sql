/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: authors
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`author`),
  CONSTRAINT `authors_chk_1` CHECK ((char_length(`author`) > 2))
) ENGINE = InnoDB AUTO_INCREMENT = 44 DEFAULT CHARSET = utf8mb3;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: books
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `year` int NOT NULL,
  `size` int NOT NULL,
  `descr` varchar(255) NOT NULL,
  `clicks` int NOT NULL DEFAULT '0',
  `visits` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 27 DEFAULT CHARSET = utf8mb3;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `books_authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `books_authors_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  CONSTRAINT `books_authors_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 44 DEFAULT CHARSET = utf8mb3;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: migrations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `run_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb3;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: my_sessions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `my_sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `user_id` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb3;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: authors
# ------------------------------------------------------------

INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (29, 'Александр Сераков');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (34, 'Александр Уолт');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (1, 'Андрей Богуславский');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (24, 'Белов А. В');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (9, 'Брюс Эккель');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (14, 'Гери Маклин Холл');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (13, 'Девид Флэнаган');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (39, 'Джей Макгаврен');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (15, 'Джеймс Р. Грофф');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (23, 'Джереми Блумм');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (4, 'Джон Форман');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (40, 'Дрю Нейл');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (30, 'Инара Агапова');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (19, 'Лора Томсон');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (18, 'Люк Веллинг ');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (3, 'Марк Саммерфильд');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (38, 'Мартин Фауэр');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (20, 'Мастицкий С.Э');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (6, 'Мухамед Али');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (28, 'Н. Марканд');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (36, 'О. Рейлли');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (32, 'Пол Дейтел');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (16, 'Пол Ен. Вайберг');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (37, 'Прамадкумар Дж. Садаладж');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (35, 'Роберт мартин');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (12, 'Роналд Риверст, Клиффорд Штайн');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (26, 'С.Гринберг');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (25, 'Сэмюэл Грингард');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (31, 'Тим Кедлек');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (10, 'Томас Кормен');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (7, 'Уес Маккини');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (22, 'Уолт  Дриджес');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (5, 'Флойд Майвезер');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (33, 'Харви Дайтел');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (11, 'Чарльз Лейзерсон');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (27, 'Ш. Карпиндейл');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (21, 'Шитиков В.К');
INSERT INTO
  `authors` (`id`, `author`)
VALUES
  (17, 'Эндрю Джо.Оппель');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: books
# ------------------------------------------------------------

INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    1,
    'С++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    '/images/22.jpg',
    2005,
    1000,
    'описание СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    29,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    3,
    'Программирование на языке Go',
    '/images/23.jpg',
    2014,
    567,
    'практическое пособие по внедрению микросервисов на языке Go ',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    4,
    'Толковый словарь сетевых терминов и аббревиатур',
    '/images/25.jpg',
    2004,
    678,
    'список и описание наиболее часто используемых сетевых терминов и аббревиатур',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    5,
    'Python и анализ данных',
    '/images/26.jpg',
    2019,
    457,
    'Применение Python в Big Data анализе',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    6,
    'Философия JAVA',
    '/images/27.jpg',
    2009,
    1589,
    'классика computer science',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    7,
    'Алгоритмы построение и анализ',
    '/images/29.jpg',
    2020,
    289,
    'Описание и применение наиболее используемых алгоритмов',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    8,
    'JAVASCRIPT карманный справочник',
    '/images/31.jpg',
    2004,
    543,
    'Наглядное пособие как делать веб страницы интерактивными',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    9,
    'Адаптивный код на С#',
    '/images/32.jpg',
    2015,
    678,
    'Проектирование классов и интерфейсов, шаблоны и принципы SOLID',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    10,
    'SQL полное руководство третье издание',
    '/images/33.jpg',
    2014,
    1589,
    'собрание всех правил и методов SQL',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    11,
    'Разработка веб-приложений с помощью PHP и MySQL',
    '/images/34.jpg',
    2008,
    765,
    'Библиотека разработчика PHP и MySQL',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    12,
    'Статистический анализ и визуализация данных с помощью R',
    '/images/35.jpg',
    2004,
    678,
    'Современны учебник по языку программирования R',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    13,
    'Программирование для детей',
    '/images/36.jpg',
    2014,
    169,
    'Иллюстрационное руководство по языкам stratch и Python',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    14,
    'Изучаем ARDUINO',
    '/images/37.jpg',
    2010,
    549,
    'Инструменты и методы технического волшебства',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    15,
    'Программирование микроконтроллеров',
    '/images/38.jpg',
    2014,
    876,
    'Программирование микроконтроллеров от а до я',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    16,
    'Интернет вещей',
    '/images/39.jpg',
    2014,
    289,
    'Будущее уже здесь',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    17,
    'Ux дизайн',
    '/images/40.jpg',
    2019,
    567,
    'Идея - эскиз - воплощение',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    18,
    'InDesign CS6',
    '/images/41.jpg',
    2019,
    345,
    'Путь к мастерству',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    19,
    'Адаптивный дизйн',
    '/images/42.jpg',
    2019,
    789,
    'делаем сайты для любых устройств',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    20,
    'Android для разработчиков',
    '/images/43.jpg',
    2014,
    289,
    'android studio\r\nматериальный дизайн\r\nновая модель разрешений\r\n',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    21,
    'Чистый код',
    '/images/44.jpg',
    2019,
    678,
    'Создание анализ и рефакторинг',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    22,
    'Swift карманный',
    '/images/45.jpg',
    2017,
    577,
    'Язык программирования для ios и mac os x',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    23,
    'NO SQL',
    '/images/46.jpg',
    2020,
    567,
    'Новая методология разработки не реляционных баз данных',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    24,
    'Head First изучаем Ruby',
    '/images/47.jpg',
    2004,
    567,
    'изучаем Ruby',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    25,
    'Практическое использование Vim',
    '/images/48.jpg',
    2004,
    289,
    'Редактируйте текст со скоростью мысли',
    2,
    0,
    0
  );
INSERT INTO
  `books` (
    `id`,
    `name`,
    `img`,
    `year`,
    `size`,
    `descr`,
    `clicks`,
    `visits`,
    `deleted`
  )
VALUES
  (
    26,
    'Программирование для детей и не только',
    '/images/36.jpg',
    2014,
    289,
    'фвыафыаывсысыфсфмфс',
    2,
    0,
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (1, 1, 1);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (3, 3, 3);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (4, 4, 4);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (5, 4, 6);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (6, 4, 5);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (7, 5, 7);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (8, 5, 5);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (9, 6, 9);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (10, 7, 12);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (11, 7, 10);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (12, 7, 11);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (13, 8, 13);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (14, 9, 14);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (15, 10, 15);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (16, 10, 16);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (17, 10, 17);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (18, 11, 19);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (19, 11, 18);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (20, 12, 20);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (21, 12, 21);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (22, 13, 22);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (23, 14, 23);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (24, 15, 24);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (25, 16, 25);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (26, 17, 28);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (27, 17, 26);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (28, 17, 27);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (29, 18, 29);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (30, 18, 30);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (31, 19, 31);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (32, 20, 34);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (33, 20, 32);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (34, 20, 33);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (35, 21, 35);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (36, 22, 36);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (37, 23, 38);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (38, 23, 37);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (39, 24, 39);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (40, 25, 40);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (41, 26, 9);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (42, 26, 19);
INSERT INTO
  `books_authors` (`id`, `book_id`, `author_id`)
VALUES
  (43, 26, 28);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: migrations
# ------------------------------------------------------------

INSERT INTO
  `migrations` (`id`, `name`, `run_on`)
VALUES
  (
    2,
    '/20220203224027-library',
    '2022-02-11 20:56:23'
  );


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
