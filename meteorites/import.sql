
CREATE TABLE meteorites(
    "name" TEXT,
    "id" TEXT,
    "class" TEXT,
    "mass" TEXT,
    "discovery" TEXT,
    "year" TEXT,
    "lat" TEXT,
    "long" TEXT
);

.import --csv --skip 1 meteorites.csv meteorites


UPDATE meteorites
SET "discovery" = '021.0'
WHERE "id" = 1 AND "mass" = 'L5';



UPDATE meteorites
SET "mass" = NULL
WHERE "mass" = '';

UPDATE meteorites
SET "year" = NULL
WHERE "year" = '';

UPDATE meteorites
SET "lat" = NULL
WHERE "lat" = '';

UPDATE meteorites
SET "long" = NULL
WHERE "long" = '';
