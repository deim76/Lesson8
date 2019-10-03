USE vk;

# 1.Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим 
-- пользователем.

SELECT  count(DISTINCT m.id) as count,concat(users.first_name, ' ', users.last_name) AS friend FROM
messages as m
JOIN  users ON m.from_user_id=users.id
JOIN friendship AS fr ON (fr.user_id=m.to_user_id OR fr.friend_id=m.to_user_id)
WHERE m.to_user_id=20
GROUP BY  friend
ORDER BY count DESC LIMIT 1;


# 2. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
# target_types users=3
SELECT sum(t_count) AS total_likes 
FROM 
(SELECT pr.user_id,count(ls.id) AS t_count 
FROM profiles AS pr
left join likes AS ls
ON pr.user_id=target_id AND target_type_id=3
GROUP BY pr.user_id
ORDER BY YEAR(pr.birthday) DESC LIMIT 10) AS tab;


# 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT count(likes.id) as count, sex
FROM likes
JOIN profiles
ON profiles.user_id=likes.user_id
GROUP BY sex
ORDER BY count DESC limit 1;


- # 4. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной
-- сети.    
SELECT CONCAT(first_name, ' ', last_name) AS user,  (COUNT(Distinct likes.id)+ COUNT(Distinct media.id)+Count(Distinct messages.id)) as count
 FROM users
 LEFT JOIN likes ON users.id=likes.user_id 
 LEFT JOIN media ON media.user_id = users.id
 LEFT JOIN messages ON messages.from_user_id = users.id
GROUP BY user 
ORDER BY count  LIMIT 10;

