-- ДЗ
-- Организацию лайков от пользователе реализую таким образом:
-- таблтца содержит в себе каждый лайк.
CREATE TABLE approves(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_users INT NOT NULL,
	id_media INT NOT NULL,
	value_like INT NOT NULL,
	created_like DATETIME DEFAULT NOW()
	);
	
-- Попробую частично описать проект GeekBrains.
-- пока представлена общая структура думаю будут еще не малые доработки и изменения.
CREATE DATABASES geekbrains;
USE geekbrins;
CREATE TABLE faculty (
	id_faculty INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name_faculty VARCHAR (250),
	descrition_faculty TEXT,
	visibility
	icon_faculty INT NOT NULL
	)
	
CREATE TABLE course (
	id_course INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name_course VARCHAR (250),
	descrition_course TEXT,
	teacher
	visibility
	icon_course INT NOT NULL
	)

CREATE TABLE groups_gb (
	id_group
	faculty_group
	curator
	created_at
	)

CREATE TABLE users (
	id_users
	first_name_users
	last_name_users
	email
	phone
	gender
	status_users
	cours_users
	groups_gb_users
	photo_users
	created_at
	update_at
	last_visit
	)

CREATE TABLE media (
	id_media
	type_media
	link_media
	id_lessons
	created_at
	update_at
	)

CREATE TABLE media_types (
	id_media_types
	name_media_types
	)
	
CREATE TABLE photo_users (
	id_photo_users
	link_photo_users
	created_at
	update_at
	)

CREATE TABLE status_user (
	id_status
	discrition_status
	)	
	
CREATE TABLE news (
	id_news
	faculty_id
	body_news
	autor_news
	created_at
	update_at
	)

CREATE TABLE lessons (
	id_lessons
	id_media
	groups_gb
	)





-- проработка урока 
SHOW DATABASES;
USE vk;
SHOW tables;
-- обработка таблицы сообществ
SELECT * FROM communities;
-- проверка таблицы пользователей
SELECT * FROM users LIMIT 10;
-- добиваемся коректных номеров телефонов
UPDATE users SET phone = FLOOR (1+ RAND()*10000000);
UPDATE users SET phone = CONCAT (7, phone);
-- Исправляем поле пол
DESC profiles;
SELECT * FROM profiles LIMIT 10;
CREATE TEMPORARY TABLE gender (gender CHAR(1));
INSERT INTO gender VALUES ('m'), ('f');
SELECT * FROM gender;
UPDATE profiles SET gender = (SELECT gender FROM gender ORDER BY RAND() LIMIT 1);
-- удаляем не верно созданое поле, создаем и заполняем его 
ALTER TABLE profiles DROP photo_id;
ALTER TABLE profiles 
	ADD COLUMN photo_id INT;
UPDATE profiles SET photo_id = FLOOR (1+ RAND()*100);
-- Изменяем связи сообщений
SELECT * FROM messages LIMIT 10;
UPDATE messages SET from_user_id = FLOOR (1+ RAND()*100);
UPDATE messages SET to_user_id = FLOOR (1+ RAND()*100);
-- Работаем с типами медиа
SELECT * FROM media_types;
DELETE FROM media_types;
INSERT INTO media_types (name) VALUES
   ('photo'),
   ('video'),
   ('audio');
TRUNCATE media_types;
-- таблица медиа
SELECT * FROM media;
UPDATE media SET media_type_id = FLOOR (1 +RAND()*3);
UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}');
ALTER TABLE media MODIFY COLUMN metadata JSON;
-- Исправляем статусы дружбы
SELECT * FROM friendship_statuses;
TRUNCATE friendship_statuses; 
INSERT INTO friendship_statuses (name) VALUES
    ('Requsted'),
    ('Confirmed'),
    ('Rejected');
-- Обрабатываем таблицу дружбы  
SELECT * FROM friendship LIMIT 10;
UPDATE friendship SET
    user_id = FLOOR(1 + (RAND() * 100)), 
    friend_id = FLOOR(1+(RAND() *100)),
    status_id  = FLOOR(1+(RAND()*3));
-- Обработка таблицы групп
SELECT * FROM communities;
SELECT * FROM communities_users;
