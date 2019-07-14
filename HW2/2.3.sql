DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;

USE sample;

DROP TABLE IF EXISTS cat;
CREATE TABLE cat(
	id SERIAL PRIMARY KEY,
  	name VARCHAR(255) UNIQUE COMMENT 'Название раздела'
	)
;

INSERT INTO sample.cat
SELECT * FROM shop.catalogs
ON DUPLICATE KEY UPDATE name = VALUES(name);

SELECT * FROM cat;

-- REPLACE INTO sample.cat SELECT * FROM shop.catalogs;
-- В случае REPLACE команда заменяет первичные ключ на следующий.
