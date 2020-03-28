-- 1. Проанализировать какие запросы могут выполняться наиболее часто в процессе работы приложения и добавить необходимые индексы.




-- 2. Задание на оконные функции.
-- Провести аналитику в разрезе групп.
Построить запрос, который будет выводить следующие столбцы:
имя группы
среднее количество пользователей в группах -
самый молодой пользователь в группе +
самый пожилой пользователь в группе +
количество пользователей в группе +
всего пользователей в системе +
отношение в процентах (количество пользователей в группе / всего пользователей в системе) * 100 +

SELECT DISTINCT communities.name AS name_group,
	COUNT(communities_users.user_id) OVER(PARTITION BY communities_users.community_id) AS total_in_group,
	COUNT(communities_users.user_id) OVER() AS total_users,
	MIN(profiles.birthday) OVER (PARTITION BY communities_users.community_id) AS old_user, 
	MAX(profiles.birthday) OVER (PARTITION BY communities_users.community_id) AS young_user,
	COUNT(communities_users.user_id) OVER(PARTITION BY communities_users.community_id) / COUNT(communities_users.user_id) OVER() * 100 AS "%%"
	FROM communities_users
	LEFT JOIN communities
	  ON communities.id = communities_users.community_id
	LEFT JOIN profiles
      ON communities_users.user_id = profiles.user_id;
