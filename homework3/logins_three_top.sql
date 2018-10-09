use track_hw;


SELECT us.login, SUM(pay.payment_sum) AS summary
FROM track_hw.users AS us
JOIN track_hw.payments AS pay ON (us.user_id = pay.user_id)
GROUP BY us.user_id
ORDER BY summary DESC
LIMIT 3;