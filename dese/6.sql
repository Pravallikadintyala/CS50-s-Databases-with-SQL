SELECT
    s.name
FROM
    schools AS s
JOIN
    graduation_rates AS g ON s.id = g.school_id
WHERE
    g.graduated = 100;
