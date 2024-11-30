SELECT city, COUNT(*) AS "number of public schools"
FROM schools
WHERE type LIKE '%Public School%'
GROUP BY city
HAVING COUNT(*) <= 3
ORDER BY "number of public schools" DESC, city;
