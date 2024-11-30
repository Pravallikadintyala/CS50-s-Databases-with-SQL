CREATE VIEW total AS
SELECT
    SUM(census.families) AS families,
    SUM(census.households) AS households,
    SUM(census.population) AS population,
    SUM(census.male) AS male,
    SUM(census.female) AS female
FROM
    census;
