SELECT
    d.name AS district,
    SUM(e.pupils) AS total_enrollment
FROM
    expenditures AS e
JOIN
    districts AS d ON e.district_id = d.id
GROUP BY
    d.name
ORDER BY
    total_enrollment DESC;
