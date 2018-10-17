
WITH RECURSIVE cte AS
(
    SELECT MIN(CAST(begin_dttm AS DATE)) AS dt FROM sessions
        UNION ALL
	SELECT dt + INTERVAL 1 WEEK
      FROM cte
     WHERE dt + INTERVAL 1 WEEK <= (SELECT MAX(CAST(begin_dttm AS DATE)) FROM sessions)
)
SELECT cte.dt AS WeekStart, COUNT(DISTINCT user_id) AS wau
  FROM cte LEFT JOIN sessions ON cte.dt <= CAST(begin_dttm AS DATE) AND cte.dt + INTERVAL 6 DAY >= CAST(begin_dttm AS DATE)
 GROUP BY cte.dt
 ORDER BY cte.dt;
 