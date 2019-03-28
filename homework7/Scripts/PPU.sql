use track_roads;

WITH RECURSIVE cte AS
(
    SELECT MIN(CAST(payment_dttm AS DATE)) AS dt FROM driveways
        UNION ALL
	SELECT cte.dt + INTERVAL 1 DAY
	  FROM cte
	WHERE cte.dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(payment_dttm AS DATE)) AS dt FROM driveways)
),
pu_for_day AS
(
    SELECT CAST(payment_dttm AS DATE) AS dt,
           COUNT(DISTINCT car_id) as user_pay
      FROM driveways
     GROUP BY dt
),
dau_for_day AS
(
    SELECT CAST(begin_dttm AS DATE) AS dt,
           COUNT(DISTINCT user_id) as user_all
      FROM sessions
     GROUP BY dt
)
SELECT cte.dt, COALESCE(pu.user_pay, 0) / COALESCE(dau.user_all, 1) as ppu
FROM cte
  LEFT JOIN pu_for_day AS pu ON cte.dt = pu.dt
  LEFT JOIN dau_for_day AS dau ON cte.dt = dau.dt;
