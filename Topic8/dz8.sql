/* Задачи необходимо решить с использованием объединения таблиц (JOIN)
 * 
 * Пусть задан некоторый пользователь. user id = 20
 * Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
 * 
 */
USE vk;

SELECT 
	first_name, last_name
FROM 
	users u 
INNER JOIN
	(SELECT 
		id_user, COUNT(1) cnt
	FROM
		(SELECT from_user_id AS id_user FROM messages m WHERE to_user_id = 20
		UNION ALL
		SELECT to_user_id AS id_user FROM messages m WHERE from_user_id = 20)id_user_tbl
	GROUP BY id_user ORDER BY cnt DESC LIMIT 1) id_u
ON 
	u.id = id_u.id_user;


-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

SELECT 
	SUM(cnt) sum_likes
FROM 
	users u 
INNER JOIN
	profiles p 
ON
	u.id = p.user_id
	AND TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10
INNER JOIN
	(SELECT 
		user_id, COUNT(1) cnt
	FROM
		likes_to_users
	GROUP BY user_id) like_tbl
ON
	u.id = like_tbl.user_id
;


-- Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT 
	gender,
	SUM(cnt) sum_u 
FROM
	users u 
INNER JOIN
	profiles p 
ON
	u.id = p.user_id
INNER JOIN 
	(SELECT 
		like_user_id, COUNT(1) cnt
	FROM 
		(SELECT like_user_id FROM likes_to_media
		UNION ALL
		SELECT like_user_id FROM likes_to_posts
		UNION ALL
		SELECT like_user_id FROM likes_to_users) like_user_tbl
	GROUP BY like_user_id) l
ON
	u.id = l.like_user_id
GROUP BY gender;

-- опять победили женщины 