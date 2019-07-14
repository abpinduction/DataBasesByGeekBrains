DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

SELECT
  CASE WEEKDAY(birthday_at)
    WHEN 0 THEN 'Понедельник'
    WHEN 1 THEN 'Вторник'
    WHEN 2 THEN 'Среда'
    WHEN 3 THEN 'Четверг'
    WHEN 4 THEN 'Пятница'
    WHEN 5 THEN 'Суббота'
    WHEN 6 THEN 'Воскресенье'
    ELSE -1
  END as wd,
  COUNT(birthday_at) as num
FROM users
GROUP BY wd
ORDER BY FIELD(wd,'Понедельник','Вторник','Среда','Четверг','Пятница','Суббота','Воскресенье');