-- Количество друзей у пользователя с сортировкой
-- (проверьте, верный ли подсчёт и скорректируйте запрос)

SELECT id, first_name, last_name, COUNT(*) AS total_friends
  FROM users
    LEFT JOIN friendship friendship1
      ON users.id = friendship1.user_id or users.id = friendship1.friend_id
  GROUP BY users.id
  ORDER BY total_friends DESC;


-- Количество друзей у пользователя (статус - активный) с сортировкой
-- (проверьте, верный ли подсчёт и скорректируйте запрос)
SELECT id, first_name, last_name, COUNT(users.id) AS total_friends
  FROM users
	LEFT JOIN friendship friendship1
      ON (users.id = friendship1.user_id OR friendship1.friend_id=users.id)
        AND friendship1.status_id = 1
  GROUP BY users.id;
  #ORDER BY total_friends DESC
  
  SELECT * FROM friendship WHERE user_id = 10 OR friend_id = 10;
