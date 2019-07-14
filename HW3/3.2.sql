DROP TABLE IF EXISTS usr;

CREATE TABLE usr (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255),
  updated_at VARCHAR(255))
COMMENT = 'Покупатели';

INSERT INTO usr (name, birthday_at, created_at, updated_at) 
	VALUES
  		('Геннадий', '1990-10-05', '20.10.2017 8:10', '20.10.2017 8:10'),
  		('Наталья', '1984-11-12', '20.10.2017 8:10', '20.10.2017 8:10'),
  		('Александр', '1985-05-20', '20.10.2017 15:10', '20.10.2017 8:10'),
  		('Сергей', '1988-02-14', '20.10.2017 8:10', '20.10.2017 8:10'),
  		('Иван', '1998-01-12', '20.10.2017 13:10', '20.10.2017 8:10'),
  		('Мария', '1992-08-29', '20.10.2017 8:10', '20.10.2017 00:10');

UPDATE usr 
	SET 
		created_at = STR_TO_DATE(created_at, "%d.%m.%Y %H:%i"),
		updated_at = STR_TO_DATE(updated_at, "%d.%m.%Y %H:%i");
	
ALTER TABLE usr
	MODIFY created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	MODIFY updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL;

DESCRIBE usr;

-- не знаю как для многих для меня задачка была крайне сложной - я бился 4 дня как решить ее одним запросом - оказывается такого сделать нельзя.