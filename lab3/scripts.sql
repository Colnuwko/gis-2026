INSTALL spatial;
LOAD spatial;

INSTALL httpfs;
LOAD httpfs;

CREATE OR REPLACE TABLE user_buildings AS
SELECT
    geom::GEOMETRY AS geom,
    id,
    building,
    user
FROM ST_Read('C:\Users\Colnuwko\source\repos\Colnuwko\gis-2026\lab3\GeoJson.geojson');


SELECT COUNT(*) FROM user_buildings;

SELECT
    ST_XMin(ST_Extent_Agg(geom)) AS xmin,
    ST_YMin(ST_Extent_Agg(geom)) AS ymin,
    ST_XMax(ST_Extent_Agg(geom)) AS xmax,
    ST_YMax(ST_Extent_Agg(geom)) AS ymax
FROM user_buildings;


SET s3_region='us-west-2';
SET http_timeout = 300000;
SET http_retries = 5;
SET threads = 4;

CREATE OR REPLACE TABLE overture_raw AS
SELECT
    id,
    names,
    sources,
    subtype,
    class,
    geometry
FROM read_parquet(
    's3://overturemaps-us-west-2/release/2026-04-15.0/theme=buildings/type=building/*.zstd.parquet'
)
WHERE
    bbox.xmin <= 50.5192718
    AND bbox.xmax >= 50.4576249
    AND bbox.ymin <= 54.3473813
    AND bbox.ymax >= 54.2641987;

SELECT COUNT(*) FROM overture_raw;

CREATE OR REPLACE TABLE overture_buildings AS
SELECT
    o.id,
    o.geometry AS geom,
    o.subtype,
    o.class,

    CASE
        WHEN EXISTS (
            SELECT 1
            FROM user_buildings u
            WHERE ST_Intersects(o.geometry, u.geom) AND u.user = 'Colnuwko'
        )
        THEN 'my'

        WHEN LOWER(CAST(o.sources AS VARCHAR)) LIKE '%osm%'
        THEN 'osm'

        ELSE 'ml'
    END AS source_type

FROM overture_raw o;

COPY (
    SELECT
        id,
        source_type,
        subtype,
        class,
        geom
    FROM overture_buildings
)
TO 'C:\Users\Colnuwko\source\repos\Colnuwko\gis-2026\lab2\client\client_gis\public\overture.geojson'
WITH (
    FORMAT GDAL,
    DRIVER 'GeoJSON'
);