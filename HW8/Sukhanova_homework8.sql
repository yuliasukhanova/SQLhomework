SELECT m.from_user_id, CONCAT(u.firstname, ' ', u.lastname) AS name, COUNT(*) AS total
FROM messages m
JOIN users u ON m.from_user_id =u.id
WHERE to_user_id=101
GROUP BY from_user_id
ORDER BY COUNT(*) DESC
LIMIT 1;

	 

SELECT COUNT(*) AS cnt_likes
FROM likes_media lm 
	JOIN profiles p ON lm.from_user_id =p.user_id
	WHERE YEAR(CURDATE()) - YEAR(birthday) < 10;
	


SELECT p.gender, COUNT(lm.from_user_id) AS cnt_likes
FROM profiles p
	JOIN likes_media lm 
	ON lm.from_user_id = p.user_id
 WHERE p.gender IS NOT NULL
 GROUP BY p.gender
 ORDER BY COUNT(from_user_id) DESC
 LIMIT 1;
 