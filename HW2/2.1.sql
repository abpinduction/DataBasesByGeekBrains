DROP TABLE IF EXISTS catalogs
;

CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела'
  -- UNIQUE unique_name(name(10)) 
  -- исключим уникальность поскольку в условии изначально исключают наличие уникальности поля name.
) COMMENT = 'Разделы интернет-магазина'
;

INSERT INTO catalogs VALUES
  (DEFAULT, 'Процессоры'),
  (DEFAULT, ''),
  (DEFAULT, NULL),
  (DEFAULT, 'Мат.платы'),
  (DEFAULT, 'Видеокарты')
;

SELECT name FROM catalogs
WHERE  name = '' OR name IS NULL
;

UPDATE catalogs
SET name = 'empty'
WHERE name = '' OR name IS NULL
;
--  Проверка
SELECT name FROM catalogs
WHERE  name = '' OR name IS NULL
;