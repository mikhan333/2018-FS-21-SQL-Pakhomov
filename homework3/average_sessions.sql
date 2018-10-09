use track_hw;

SELECT AVG(summ)
FROM (
  SELECT us.user_id, IF(ses.user_id IS NULL, 0, COUNT(*)) AS summ
  FROM track_hw.users AS us
  LEFT JOIN track_hw.sessions AS ses ON (us.user_id = ses.user_id)
  GROUP BY us.user_id
) AS tabl;