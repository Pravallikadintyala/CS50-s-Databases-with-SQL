SELECT latitude, longitude, "0m" AS "Surface Temperature"
FROM normals
ORDER BY "Surface Temperature" DESC, latitude
LIMIT 10;

