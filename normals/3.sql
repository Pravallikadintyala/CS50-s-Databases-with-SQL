SELECT
    "0m" AS "depth_0m",
    "100m" AS "depth_100m",
    "200m" AS "depth_200m"
FROM "normals"
WHERE
    "latitude" = '42.5'
    AND "longitude" = '-69.5';
