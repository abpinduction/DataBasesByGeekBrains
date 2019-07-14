DROP DATABASE IF EXISTS media_lib;
CREATE DATABASE media_lib;

USE media_lib;
 
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT UNSIGNED NOT NULL PRIMARY KEY,
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	email VARCHAR(120) NOT NULL UNIQUE,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
	INDEX users_firstname_lastname_idx (firstname, lastname),
	INDEX users_email_idx (email)
	)
;

DROP TABLE IF EXISTS type_meadia;
CREATE TABLE type_media (
	id INT UNSIGNED NOT NULL PRIMARY KEY,
	type_name VARCHAR(50) NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
	INDEX type_media_type_name_idx (type_name)
	)
;

DROP TABLE IF EXISTS fmedia;
CREATE TABLE fmedia(
	id SERIAL PRIMARY KEY,
	fpath VARCHAR(255) NOT NULL UNIQUE COMMENT 'Путь к файлу',
	fname VARCHAR(255) NOT NULL UNIQUE COMMENT 'Имя файла',
	fdescription TEXT COMMENT 'Описание файла',
	fteg VARCHAR(100) COMMENT 'Тэг',
	user_id INT UNSIGNED NOT NULL COMMENT 'Принадлежность к пользователю',
	type_media_id INT UNSIGNED NOT NULL COMMENT 'Принадлежность к типу медиа (кино, фотографии, музыка, диктофон, видео камеры и др.)',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  	INDEX fmedia_user_id_idx(user_id),
  	INDEX fmedia_fname_idx(fname),
  	CONSTRAINT fmedia_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id),
  	CONSTRAINT fmedia_type_media_id_fk FOREIGN KEY (type_media_id) REFERENCES type_media(id)
  	)
;

SHOW TABLES;