USE vk;

/*
2.	Пусть задан некоторый пользователь. user id = 20
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
*/

-- Пусть этот пользователь user id = 20

SELECT * FROM users
WHERE 
	id = (
SELECT
	friend_id
FROM
	friendship
WHERE
	request_type_id = 1
    AND user_id = 20
    AND confirmed_at IS NOT NULL
    AND friend_id = (SELECT from_user_id  FROM messages
WHERE to_user_id = 20 GROUP BY from_user_id ORDER BY Count(1) DESC LIMIT 1));


/*
3.	Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
*/

SELECT 
	SUM(likes)
FROM
(SELECT 
    (SELECT birthday FROM profiles WHERE user_id=users.id) birthday, 
    (SELECT COUNT(1) FROM likes_to_users WHERE user_id=users.id GROUP BY user_id) likes  
FROM users
ORDER BY birthday LIMIT 10) AS young_users;




/*
4.	Определить кто больше поставил лайков (всего) - мужчины или женщины?
*/
SELECT 
	(SELECT gender FROM profiles WHERE user_id = like_user_id) gender,
    COUNT(1) likes
FROM
	(SELECT like_user_id FROM likes_to_media
	UNION ALL
	SELECT like_user_id FROM likes_to_users
	UNION ALL
	SELECT like_user_id FROM likes_to_posts) likes_tbl
GROUP BY gender;

-- женщины поставили больше лайков

/*
5.	Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
*/

-- активность в сети будем замерять лайками
SELECT 
	(SELECT id FROM users WHERE id = like_user_id) user_id,
    COUNT(1) likes
FROM
	(SELECT like_user_id FROM likes_to_media
	UNION ALL
	SELECT like_user_id FROM likes_to_users
	UNION ALL
	SELECT like_user_id FROM likes_to_posts) likes_tbl
GROUP BY user_id
ORDER BY likes
LIMIT 10;


