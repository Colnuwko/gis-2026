
-- ===================== DDL: Таблицы =====================
CREATE EXTENSION IF NOT EXISTS postgis;
-- Здания (полигональные объекты)
DROP TABLE IF EXISTS buildings CASCADE;
CREATE TABLE buildings (
    id SERIAL PRIMARY KEY,
    osm_id TEXT UNIQUE NOT NULL,
    addr_city TEXT,
    addr_street TEXT,
    addr_housenumber TEXT,
    addr_place TEXT,
    building TEXT,
    building_levels TEXT,
    source_addr TEXT,
    name TEXT,
    geom GEOMETRY(MultiPolygon, 4326) NOT NULL
);

-- Дороги (линейные объекты)
DROP TABLE IF EXISTS roads CASCADE;
CREATE TABLE roads (
    id SERIAL PRIMARY KEY,
    osm_id TEXT UNIQUE NOT NULL,
    name TEXT,
    highway TEXT,
    route TEXT,
    ref TEXT,
    surface TEXT,
    lanes TEXT,
    maxspeed TEXT,
    distance TEXT,
    network TEXT,
    geom GEOMETRY(MultiLineString, 4326) NOT NULL
);

-- POI (точечные объекты)
DROP TABLE IF EXISTS poi CASCADE;
CREATE TABLE poi (
    id SERIAL PRIMARY KEY,
    osm_id TEXT UNIQUE NOT NULL,
    name TEXT,
    category TEXT,
    geom GEOMETRY(Point, 4326) NOT NULL
);

-- ===================== Пространственные индексы =====================

CREATE INDEX idx_buildings_geom ON buildings USING gist (geom);
CREATE INDEX idx_roads_geom ON roads USING gist (geom);
CREATE INDEX idx_poi_geom ON poi USING gist (geom);

-- ===================== DML: Здания =====================

INSERT INTO buildings (osm_id, addr_city, addr_street, addr_housenumber, addr_place, building, building_levels, source_addr, name, geom) VALUES
('way/849458021', 'сельское поселение Большая Романовка', 'Автомобильная дорога по ул. Шоссейная', '6', NULL, 'apartments', '1', NULL, 'Жилой дом', ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((50.4821384 54.2919382, 50.4823791 54.2920354, 50.4822617 54.2921345, 50.4820209 54.2920373, 50.4821384 54.2919382))'), 4326)))

INSERT INTO buildings (osm_id, addr_city, addr_street, addr_housenumber, addr_place, building, building_levels, source_addr, name, geom) VALUES
('way/1489080348', 'сельское поселение Большая Романовка', 'Автомобильная дорога по ул. Шоссейная', '5', NULL, 'apartments', '1', NULL, 'Жилой дом', ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((50.4830924 54.2922626, 50.4830401 54.2923073, 50.4830508 54.2923127, 50.4830052 54.2923495, 50.482969 54.2923331, 50.4829274 54.2923668, 50.4827061 54.2922736, 50.4828402 54.292164, 50.4830924 54.2922626))'), 4326)))

INSERT INTO buildings (osm_id, addr_city, addr_street, addr_housenumber, addr_place, building, building_levels, source_addr, name, geom) VALUES
('way/1489080347', 'сельское поселение Большая Романовка', 'Автомобильная дорога по ул. Шоссейная', '4', NULL, 'apartments', '1', NULL, 'Жилой дом', ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((50.4831274 54.2924273, 50.4832442 54.2923312, 50.4834555 54.2924007, 50.483334 54.2925173, 50.4831274 54.2924273))'), 4326)))

INSERT INTO buildings (osm_id, addr_city, addr_street, addr_housenumber, addr_place, building, building_levels, source_addr, name, geom) VALUES
('way/1489080343', 'сельское поселение Большая Романовка', 'Автомобильная дорога по ул. Шоссейная', '1', NULL, 'apartments', '1', NULL, 'Жилой дом', ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((50.4843715 54.291707, 50.4844136 54.291673, 50.4844895 54.2917077, 50.4846307 54.2915946, 50.4848024 54.2916662, 50.4846109 54.291812, 50.4843715 54.291707))'), 4326)))

INSERT INTO buildings (osm_id, addr_city, addr_street, addr_housenumber, addr_place, building, building_levels, source_addr, name, geom) VALUES
('way/1489080342', 'сельское поселение Большая Романовка', 'Автомобильная дорога по ул. Шоссейная', '2', NULL, 'apartments', '1', NULL, 'Жилой дом', ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((50.4841259 54.2920007, 50.4843217 54.2918458, 50.4844732 54.2919272, 50.4843217 54.2920532, 50.4842413 54.2920193, 50.4842158 54.2920383, 50.4841259 54.2920007))'), 4326)))

INSERT INTO buildings (osm_id, addr_city, addr_street, addr_housenumber, addr_place, building, building_levels, source_addr, name, geom) VALUES
('way/1489080341', 'сельское поселение Большая Романовка', 'Автомобильная дорога по ул. Шоссейная', '3', NULL, 'apartments', '1', NULL, 'Жилой дом', ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((50.4838567 54.2922168, 50.4839444 54.292151, 50.4840395 54.292077, 50.4841951 54.2921553, 50.4840341 54.2922743, 50.4839587 54.292242, 50.4839414 54.2922555, 50.4838567 54.2922168))'), 4326)))


-- ===================== DML: Дороги =====================

INSERT INTO roads (osm_id, name, highway, route, ref, surface, lanes, maxspeed, distance, network, geom) VALUES
('way/1489080346', 'Дорога к полю', 'track', NULL, NULL, 'earth', NULL, NULL, NULL, NULL, ST_Multi(ST_SetSRID(ST_GeomFromText('LINESTRING(50.4925147 54.2997926, 50.4926714 54.2998245, 50.4928417 54.2998519, 50.493035 54.299856)'), 4326)))

INSERT INTO roads (osm_id, name, highway, route, ref, surface, lanes, maxspeed, distance, network, geom) VALUES
('way/1489080345', 'Дорога к полю', 'track', NULL, NULL, 'earth', NULL, NULL, NULL, NULL, ST_Multi(ST_SetSRID(ST_GeomFromText('LINESTRING(50.4924255 54.2996508, 50.4923693 54.2996573, 50.4922415 54.2996456, 50.4920181 54.2996483, 50.4918038 54.299719)'), 4326)))

INSERT INTO roads (osm_id, name, highway, route, ref, surface, lanes, maxspeed, distance, network, geom) VALUES
('way/1489080344', 'Дорога к полю', 'track', NULL, NULL, 'earth', NULL, NULL, NULL, NULL, ST_Multi(ST_SetSRID(ST_GeomFromText('LINESTRING(50.4847548 54.2923156, 50.4850417 54.292478, 50.4855106 54.2928756, 50.486851 54.2941348, 50.4886195 54.2957577, 50.4892162 54.2963108, 50.4895435 54.2967052, 50.4897956 54.2970809, 50.4906807 54.2978604, 50.4915628 54.298608, 50.492216 54.2991582, 50.4923824 54.2993128, 50.4923885 54.2994782, 50.4924255 54.2996508, 50.4925173 54.29979, 50.4925147 54.2997926, 50.4922344 54.3000757)'), 4326)))

INSERT INTO roads (osm_id, name, highway, route, ref, surface, lanes, maxspeed, distance, network, geom) VALUES
('way/35634330', NULL, 'tertiary', NULL, '36К-327', 'asphalt', '2', NULL, NULL, NULL, ST_Multi(ST_SetSRID(ST_GeomFromText('LINESTRING(50.498527 54.2641987, 50.4992528 54.2648928, 50.4994055 54.2650943, 50.4994493 54.2652181, 50.499457 54.2653618, 50.4994493 54.2654956, 50.4993954 54.2656274, 50.4991223 54.2658863, 50.4987602 54.2660567, 50.4982971 54.2662131, 50.4973378 54.2665274, 50.4931147 54.2677408, 50.4889311 54.2689534, 50.4883536 54.2692255, 50.4878902 54.2695012, 50.4874524 54.2698871, 50.487152 54.2703232, 50.487049 54.2708043, 50.4870599 54.2710768, 50.4870662 54.2712354, 50.4872893 54.2716764, 50.4875125 54.2719621, 50.4916753 54.2759214, 50.4939465 54.2780499, 50.4964679 54.2804127, 50.497014 54.2809927, 50.4972199 54.2812884, 50.4973113 54.281612, 50.4972523 54.2818987, 50.4969499 54.2822926, 50.4933747 54.2852969, 50.4882506 54.2894603, 50.4875025 54.2900713, 50.4847548 54.2923156, 50.4839382 54.2929825, 50.4830493 54.2937084, 50.4797788 54.2963867, 50.4776849 54.2981013, 50.4725694 54.3022935, 50.4717131 54.3029912, 50.4701986 54.3042252, 50.4678058 54.3061748, 50.4654025 54.3081528, 50.4651536 54.3084532, 50.4650334 54.3087637, 50.4650334 54.3090792, 50.4652738 54.3095899, 50.4656514 54.3099905, 50.4660033 54.3102559, 50.4715051 54.313856, 50.4770068 54.3174959, 50.4791612 54.3189277, 50.4794015 54.319168, 50.4795131 54.3193232, 50.4795388 54.3195485, 50.4793757 54.3198038, 50.4765433 54.3234731, 50.4733009 54.3277319, 50.4707927 54.3310261, 50.4648618 54.3389279, 50.4616463 54.3432982, 50.4615225 54.343468, 50.4598037 54.3458418, 50.4595865 54.3462129, 50.4594432 54.346548, 50.4594225 54.3467112, 50.4594716 54.3470133, 50.4594855 54.3470759, 50.4595534 54.3473813)'), 4326)))

-- ===================== DML: POI =====================

--select * from poi
INSERT INTO poi (osm_id, name, category, geom) VALUES
('node/5270874737', 'Малая Романовка', NULL, ST_SetSRID(ST_GeomFromText('POINT(50.472071 54.291821)'), 4326))

INSERT INTO poi (osm_id, name, category, geom) VALUES
('node/336525559', 'Большая Романовка', NULL, ST_SetSRID(ST_GeomFromText('POINT(50.4839445 54.290981)'), 4326))

INSERT INTO poi (osm_id, name, category, geom) VALUES
('node/8239478089', 'Памятник, мемориал', 'memorial', ST_SetSRID(ST_GeomFromText('POINT(50.4801613 54.2919433)'), 4326))