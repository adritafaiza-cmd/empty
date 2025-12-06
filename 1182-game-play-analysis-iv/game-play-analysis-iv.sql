# Write your MySQL query statement below
SELECT
    ROUND(
        COUNT(DISTINCT a1.player_id) * 1.0 /
        COUNT(DISTINCT a0.player_id),
        2
    ) AS fraction
FROM (
    -- first login date per player
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) a0
LEFT JOIN Activity a1
    ON a1.player_id = a0.player_id
   AND a1.event_date = DATE_ADD(a0.first_login, INTERVAL 1 DAY);
