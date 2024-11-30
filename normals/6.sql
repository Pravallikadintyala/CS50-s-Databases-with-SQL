SELECT
    latitude,
    longitude,
    "50m" AS depth_50m_temperature
FROM normals
WHERE
    latitude BETWEEN 0 AND 20
    AND longitude BETWEEN 55 AND 75;
