SELECT
    AVG(g.graduated) AS average_graduation_rate
FROM
    graduation_rates AS g
JOIN
    schools AS s ON g.school_id = s.id;
