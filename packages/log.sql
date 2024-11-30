
-- *** The Devious Delivery ****


SELECT
       pa.contents,
       a.type AS address_type
FROM packages p
JOIN (
    SELECT p.id AS package_id,
           MAX(s_pick.timestamp) AS latest_pickup_timestamp,
           MAX(s_drop.timestamp) AS latest_dropoff_timestamp
    FROM packages p
    LEFT JOIN scans s_pick ON p.id = s_pick.package_id AND s_pick.action = 'Pick'
    LEFT JOIN scans s_drop ON p.id = s_drop.package_id AND s_drop.action = 'Drop'
    GROUP BY p.id
    HAVING latest_pickup_timestamp > COALESCE(latest_dropoff_timestamp, '0000-00-00 00:00:00')
) AS missing_packages ON p.id = missing_packages.package_id
JOIN packages pa ON p.id = pa.id
JOIN addresses a ON pa.to_address_id = a.id;



-- -- *** The Lost Letter ***
--  THE FORGOTTEN GIFT

-- --QUERY TO FIND DRIVER NAME
-- SELECT * FROM "drivers"
--     WHERE "id" = 17;
-- -- QUERY TO FIND TYPE OF ACTION OF FORGOTTEN GIFT

-- SELECT * FROM "scans"
--     WHERE "package_id" IN (
--         SELECT "id" FROM "packages"
--             WHERE "from_address_id" =(
--             SELECT "id" FROM "addresses"
--             WHERE "address" LIKE '%109% Tileston% Street%'
--     )

--     );


-- --QUERY TO FIND CONTENTS OF FORGOTTEN GIFT
-- SELECT * FROM "packages"
-- WHERE "from_address_id" = (
--     SELECT "id" FROM "addresses"
--     WHERE "address" LIKE '%109% Tileston% Street%'
-- ) AND "to_address_id" = (
--     SELECT "id" FROM "addresses"
--     WHERE "address" LIKE '728 Maple Place'
-- );





--SELECT * FROM packages WHERE contents LIKE '%duck%' OR contents LIKE '%quack%';
/*SELECT * FROM "addresses"
    WHERE "id" IS NULL;
SELECT * FROM "packages"
    WHERE "from_address_id" IS NULL;


/*SELECT * FROM "packages"
    WHERE "from_address_id" IS NULL;


SELECT * FROM "addresses"
    WHERE "id" IN (
        SELECT "to_address_id" FROM "packages"
            WHERE "from_address_id"IS NULL
            );



-- SELECT * FROM "drivers" LIMIT 10;
-- SELECT * FROM "packages" LIMIT 10;
-- SELECT * FROM "scans" LIMIT 10;



-- *** The Lost Letter ***

-- -- Find the ID of the address 900 Somerville Avenue (Anneke's address)
-- SELECT id FROM addresses WHERE address = '900 Somerville Avenue';

-- -- Find the ID of the address 2 Finnegan Street (Varsha's address)
-- SELECT id FROM addresses WHERE address = '2 Finnigan Street';



-- -- Find the package ID of the letter sent from Anneke to Varsha
-- SELECT id FROM packages
-- WHERE from_address_id = (SELECT id FROM addresses WHERE address = '900 Somerville Avenue')
--   AND to_address_id = (SELECT id FROM addresses WHERE address = '2 Finnigan Street')
--   AND contents = 'Congratulatory letter';

-- -- Find the latest scan of the package to determine its last known location
-- SELECT package_id,address_id, action, timestamp FROM scans
-- WHERE package_id = (SELECT id FROM packages
--                     WHERE from_address_id = (SELECT id FROM addresses WHERE address = '900 Somerville Avenue')
--                       AND to_address_id = (SELECT id FROM addresses WHERE address = '2 Finnigan Street')
--                       AND contents = 'Congratulatory letter')
-- ORDER BY timestamp DESC
-- LIMIT 1;

-- -- -- Get the type and address of the last known location
-- SELECT type, address FROM addresses
-- WHERE id = (SELECT address_id FROM scans
--             WHERE package_id = (SELECT id FROM packages
--                                 WHERE from_address_id = (SELECT id FROM addresses WHERE address = '900 Somerville Avenue')
--                                   AND to_address_id = (SELECT id FROM addresses WHERE address = '2 Finnigan Street')
--                                   AND contents = 'Congratulatory letter')
--             ORDER BY timestamp DESC
--             LIMIT 1);

-- -- --query to find from address
-- -- SELECT * FROM "packages"
-- --     WHERE "from_address_id" =(SELECT "id" FROM "addresses" WHERE "address" LIKE '%900% Somerville% Avenue');

-- --query to find type of address

-- SELECT * FROM "addresses"
-- WHERE "id" = (
--     SELECT "id" FROM "addresses" WHERE "address" LIKE '%900% Somerville% Avenue'
-- );

-- -- Query to find scans related to this package
-- SELECT * FROM scans
-- WHERE package_id IN (
--     SELECT id FROM packages
--     WHERE from_address_id = (SELECT id FROM addresses WHERE address LIKE '%900 Somerville Avenue%')
-- );

-- --Query to find the address where the lost letter ends up

-- SELECT "address","type"
-- FROM "addresses"
-- WHERE "id" IN (
--     SELECT "address_id"
--     FROM "scans"
--     WHERE package_id = (
--         SELECT id
--         FROM packages
--         WHERE from_address_id = (SELECT id FROM addresses WHERE address LIKE '%900 Somerville Avenue%')
--     )
-- );



-- -- *** The Devious Delivery ***

