--таблица кинозвезд--
DROP TABLE IF EXISTS persons CASCADE;
CREATE TABLE persons 
(
    person_id int PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL
);

-- таблица профиля кинозвезд--
DROP TABLE IF EXISTS person_profiles;
CREATE TABLE person_profiles 
(
	actor_id int NOT NULL UNIQUE,
	FOREIGN KEY (actor_id) REFERENCES persons(person_id),
	career varchar(100) NOT NULL,
	height real NOT NULL,
	birthday date NOT NULL,
	zodiak varchar(10) NOT NULL,
	birthplace varchar(50) NOT NULL,
	genres varchar(50) NOT NULL,
	filmscount smallint NOT NULL
); 

--таблица фильмов--
DROP TABLE IF EXISTS films CASCADE;
CREATE TABLE films
(
    film_id int PRIMARY KEY,
    movie_title varchar(50) NOT NULL,
    original_title varchar(50) NOT NULL,
    rate real NOT NULL,
    "release" varchar(4) NOT NULL,
    country varchar(50) NOT NULL,
    runtime time NOT NULL
);

--таблица подробной информации фильма--
DROP TABLE IF EXISTS film_details;
CREATE TABLE film_details
(
    film_id int NOT NULL UNIQUE,
    FOREIGN KEY (film_id) REFERENCES films(film_id),
    director varchar(50) NOT NULL,
    writer varchar(50) NOT NULL,
	producer varchar(50) NOT NULL,
	"operator" varchar(50),
	composer varchar(50) NOT NULL,
	designer varchar(50) NOT NULL,
	editor varchar(50) NOT NULL,
    budget bigint NOT NULL,
    box_USA bigint NOT NULL,
    box_world bigint NOT NULL
);

--таблица жанров фильмов--
DROP TABLE IF EXISTS genres CASCADE;
CREATE TABLE genres
(
    film_id int NOT NULL UNIQUE,
    FOREIGN KEY (film_id) REFERENCES films(film_id),
    biography bit varying,
    actions bit varying,
    military bit varying,
    detective bit varying,
    drama bit varying,
    historical bit varying,
    comedy bit varying,
    crime bit varying,
    melodrama bit varying,
    cartoon bit varying,
    musical bit varying,
    adventures bit varying,
    "family" bit varying,
    thriller bit varying,
    fantastic bit varying,
    fantasy bit varying
);

--таблица зрителей по странам--
DROP TABLE IF EXISTS audiences CASCADE;
CREATE TABLE audiences
(
    audience_id int PRIMARY KEY,
    country varchar(50) NOT NULL
);

--таблица связей кинозвезд с фильмами--
DROP TABLE IF EXISTS persons_films;
CREATE TABLE persons_films
(
	film_id int NOT NULL,
	FOREIGN KEY (film_id) REFERENCES films(film_id),
	actor_id int NOT NULL,
	FOREIGN KEY (actor_id) REFERENCES persons(person_id)
);

--таблица связей фильмов со зрителями по странам-- 
DROP TABLE IF EXISTS films_audiences;
CREATE TABLE films_audiences
(
    film_id int REFERENCES films(film_id),
    audience_id int REFERENCES audiences(audience_id),
    CONSTRAINT films_audiences_pkey PRIMARY KEY (film_id, audience_id)
);

--заполнение таблиц данными--

INSERT INTO persons 
VALUES 
	(1,'Том', 'Хэнкс'),
	(2,'Леонардо', 'ДиКаприо'),
	(3,'Тим', 'Роббинс'),
	(4,'Элайджа', 'Вуд'),
	(5,'Иэн', 'Маккеллен'),
	(6,'Шон', 'Эстин'),
	(7,'Робин', 'Райт'),
	(8,'Мэттью', 'Бродерик'),
	(9,'Джейсон', 'Флеминг'),
	(10,'Лиам', 'Нисон');

INSERT INTO person_profiles 
VALUES 
	(1, 'Актер, Продюсер, Режиссер, Сценарист', 1.83 , '1956-07-09' , 'Рак' , 'Конкорд, Калифорния, США', 'Комедия, драма, документальный', 411),
	(2, 'Актер, Продюсер, Сценарист', 1.83, '1974-11-11' , 'Скорпион', 'Голливуд, Лос-Анджелес, Калифорния, США', 'Драма, документальный, триллер', 225),
	(3, 'Актер, Продюсер, Режиссер, Сценарист', 1.96, '1958-10-16', 'Весы', 'Уэст-Ковина, штат Калифорния, США', 'Драма, комедия, мелодрама', 214),
	(4, 'Актер, Продюсер, Режиссер', 1.65, '1981-11-28', 'Водолей', 'Сидар-Рапидс, Айова, США', 'Драма, комедия, приключения', 276),
	(5, 'Актер, Сценарист, Продюсер', 1.83, '1939-05-25', 'Близнецы', 'Бернли, Ланкашир, Англия, Великобритания', 'Драма, комедия, короткометражка', 303),
	(6, 'Актер, Продюсер, Режиссер, Сценарист', 1.68, '1971-02-25', 'Рыбы', 'Санта-Моника, Калифорния, США', 'Комедия, драма, приключения', 268),
	(7, 'Актриса, Продюсер, Режиссер', 1.68, '1966-04-08', 'Овен', 'Даллас, Техас, США', 'Драма, триллер, мелодрама', 126),
	(8, 'Актер, Режиссер, Продюсерт', 1.72, '1962-03-21', 'Овен', 'Нью-Йорк, США', 'Комедия, драма, приключения', 189),
	(9, 'Актер, Продюсер, Режиссер', 1.85, '1966-09-25', 'Весы', 'Лондон, Англия, Великобритания', 'Драма, триллер, комедия', 167),
	(10, 'Актер, Продюсер', 1.92, '1952-06-07', 'Близнецы', 'Беллимен, Северная Ирландия, Великобритания', 'Драма, триллер, боевик', 314);
    
INSERT INTO films 
VALUES 
	(1,'Зеленая миля', 'The Green Mile', 9.1, '1999', 'США', '03:09'),
	(2,'Побег из Шоушенка', 'The Shawshank Redemption', 9.1, '1994', 'США', '02:22'),
	(3,'Властелин колец: Возвращение короля', 'The Lord of the Rings: The Return of the King', 8.6, '2003', 'Новая Зеландия, США', '03:21'),
	(4,'Властелин колец: Две крепости', 'The Lord of the Rings: The Two Towers', 8.6, '2002', 'Новая Зеландия, США', '02:59'),
	(5,'Властелин колец: Братство Кольца', 'The Lord of the Rings: The Fellowship of the Ring', 8.6, '2001', 'Новая Зеландия, США', '02:58'),
	(6,'Форрест Гамп', 'Forrest Gump', 8.9, '1994', 'США', '02:22'),
	(7,'Король Лев', 'The Lion King', 8.8, '1994', 'США', '01:28'),
	(8,'Карты, деньги, два ствола', 'Lock, Stock and Two Smoking Barrels', 8.6, '1998', 'Великобритания', '01:47'),
	(9,'Список Шиндлера', 'Schindler''s List', 8.8, '1993', 'США', '03:15'),
	(10,'Начало', 'Inception', 8.7, '2010', 'США, Великобритания', '02:28');
    
INSERT INTO film_details 
VALUES
	(1, 'Фрэнк Дарабонт', 'Фрэнк Дарабонт', 'Фрэнк Дарабонт', 'Дэвид Тэттерсолл', 'Томас Ньюман', 'Теренс Марш', 'Ричард Фрэнсис-Брюс', 60000000, 136801374, 286801374),
	(2, 'Фрэнк Дарабонт', 'Фрэнк Дарабонт', 'Лиз Глоцер', 'Роджер Дикинс', 'Томас Ньюман', 'Теренс Марш', 'Ричард Фрэнсис-Брюс', 25000000, 28341469, 28418687),
	(3, 'Питер Джексон', 'Фрэн Уолш', 'Питер Джексон', 'Эндрю Лесни', 'Говард Шор', 'Грант Мейджор', 'Джэми Селкирк', 94000000, 378251207, 1146457748),
	(4, 'Питер Джексон', 'Фрэн Уолш', 'Питер Джексон', 'Эндрю Лесни', 'Говард Шор', 'Грант Мейджор', 'Майкл Хортон', 94000000, 342952511, 947944270),
	(5, 'Питер Джексон', 'Фрэн Уолш', 'Питер Джексон', 'Эндрю Лесни', 'Говард Шор', 'Грант Мейджор', 'Джон Гилберт', 93000000, 316115420, 898204420),
	(6, 'Роберт Земекис', 'Эрик Рот', 'Венди Файнерман', 'Дон Бёрджесс', 'Алан Сильвестри', 'Рик Картер', 'Артур Шмидт', 55000000, 329694499, 677387716),
	(7, 'Роджер Аллерс', 'Ирен Меччи', 'Дон Хан', NULL, 'Ханс Циммер', 'Крис Сандерс', 'Иван Биланкио', 45000000, 312855561, 763455561),
	(8, 'Гай Ричи', 'Гай Ричи', 'Мэттью Вон', 'Тим Морис-Джонс', 'Дэвид А. Хьюз', 'Иэн Эндрюс', 'Найвен Хоуи', 960000, 3753929, 3753929),
	(9, 'Стивен Спилберг', 'Стивен Зеллиан', 'Ирвинг Гловин', 'Януш Камински', 'Джон Уильямс', 'Аллан Старски', 'Майкл Кан', 22000000, 96065768, 321306305),
	(10, 'Кристофер Нолан', 'Кристофер Нолан', 'Кристофер Нолан', 'Уолли Пфистер', 'Ханс Циммер', 'Гай Диас', 'Ли Смит', 160000000, 292576195, 828322032);

INSERT INTO genres 
VALUES 
	(1, cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit)),
	(2, cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit)),
	(3, cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit)),
	(4, cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit)),
	(5, cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit)),
	(6, cast(0 AS bit), cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(1 AS bit), cast(1 AS bit), cast(1 AS bit), cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit)),
	(7, cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit), cast(1 AS bit), cast(1 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit)),
	(8, cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit)),
	(9, cast(1 AS bit), cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(1 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit)),
	(10, cast(0 AS bit), cast(1 AS bit), cast(0 AS bit), cast(1 AS bit), cast(1 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(0 AS bit), cast(1 AS bit), cast(1 AS bit), cast(0 AS bit));

INSERT INTO audiences 
VALUES
    (1, 'Великобритания'),
    (2, 'Германия'),
    (3, 'Испания'),
    (4, 'Италия'),
    (5, 'Китай'),
    (6, 'США'),
    (7, 'Франция'),
    (8, 'Швеция');

INSERT INTO persons_films 
VALUES 
    (1, 1),
    (2, 3),
    (3, 4),
    (3, 5),
    (3, 6),
    (4, 4),
    (4, 5),
    (4, 6),
    (5, 4),
    (5, 5),
    (5, 6),
    (6, 1),
    (6, 7),
    (7, 8),
    (8, 9),
    (9, 10),
    (10, 2);

INSERT INTO films_audiences
VALUES
    (1, 6),
    (1, 2),
    (1, 4),
    (2, 6),
    (2, 3),
    (2, 2),
    (3, 6),
    (3, 1),
    (3, 2),
    (4, 6),
    (4, 1),
    (4, 2),
    (5, 6),
    (5, 1),
    (5, 2),
    (6, 6),
    (6, 2),
    (6, 7),
    (7, 6),
    (7, 2),
    (7, 7),
    (8, 1),
    (8, 6),
    (8, 8),
    (9, 6),
    (9, 2),
    (9, 7),
    (10, 6),
    (10, 5),
    (10, 1);

--===============================================================================

-- топ 5 фильмов --
DROP VIEW IF EXISTS top_5films;
CREATE VIEW top_5films AS
    SELECT * 
    FROM films
    ORDER BY rate DESC 
    LIMIT 5;

SELECT original_title AS "Название фильма", rate AS Рейтинг FROM top_5films;

-- выборка информации о фильме --
DROP VIEW IF EXISTS film_info;
CREATE VIEW film_info AS
	SELECT f.movie_title, fd.director, f."release", f.country, f.rate 
	FROM film_details fd 
	JOIN films f ON fd.film_id = f.film_id;
	
SELECT * FROM film_info;

-- список фильмов в которых сыграл актёр --
DROP VIEW IF EXISTS list_films;
CREATE VIEW list_films AS
    SELECT DISTINCT f.movie_title AS "Название фильма", 
                    persons.first_name || ' ' || persons.last_name AS Актер
    FROM films f
    LEFT JOIN persons_films pf ON f.film_id = pf.film_id
    LEFT JOIN persons ON persons.person_id = pf.actor_id
    JOIN persons_films ON f.film_id = pf.film_id AND pf.actor_id = 1;
    
SELECT * FROM list_films;

-- список актеров в фильме --
DROP VIEW IF EXISTS list_actors;
CREATE VIEW list_actors AS
    SELECT DISTINCT f.movie_title AS "Название фильма",
                    persons.first_name || ' ' || persons.last_name AS Актер
    FROM persons
    LEFT JOIN persons_films pf ON persons.person_id = pf.actor_id
    LEFT JOIN films f ON f.film_id = pf.film_id
    JOIN persons_films ON persons.person_id = pf.actor_id AND pf.film_id = 3;
    
SELECT * FROM list_actors;