--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(50) NOT NULL,
    birth_year integer NOT NULL,
    death_year integer,
    nationality character varying(30) NOT NULL,
    height numeric(4,2)
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomer_astronomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomer_astronomer_id_seq OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomer_astronomer_id_seq OWNED BY public.astronomer.astronomer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    planet_type character varying(30),
    galaxy_type character varying(30),
    age_in_millions_of_years numeric(10,6),
    estimated_population integer,
    number_of_planets integer,
    distance_from_earth integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    planet_id integer,
    age_in_millions_of_years numeric(10,6)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    planet_type character varying(30),
    galaxy_type character varying(30),
    age_in_millions_of_years numeric(10,6),
    estimated_population integer,
    distance_from_earth integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,6),
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: astronomer astronomer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer ALTER COLUMN astronomer_id SET DEFAULT nextval('public.astronomer_astronomer_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer VALUES (7, 'Galileo Galilei', 1564, 1642, 'Italian', 1.67);
INSERT INTO public.astronomer VALUES (8, 'Johannes Kepler', 1571, 1630, 'German', 1.75);
INSERT INTO public.astronomer VALUES (9, 'Isaac Newton', 1642, 1727, 'English', 1.78);
INSERT INTO public.astronomer VALUES (10, 'Albert Einstein', 1879, 1955, 'German-American', 1.81);
INSERT INTO public.astronomer VALUES (11, 'Stephen Hawking', 1942, 2018, 'British', 1.72);
INSERT INTO public.astronomer VALUES (12, 'Carl Sagan', 1934, 1996, 'American', 1.80);
INSERT INTO public.astronomer VALUES (13, 'Neil deGrasse Tyson', 1958, NULL, 'American', 1.85);
INSERT INTO public.astronomer VALUES (14, 'Edwin Hubble', 1889, 1953, 'American', 1.70);
INSERT INTO public.astronomer VALUES (15, 'Annie Jump Cannon', 1863, 1941, 'American', 1.60);
INSERT INTO public.astronomer VALUES (16, 'Maria Mitchell', 1818, 1889, 'American', 1.50);
INSERT INTO public.astronomer VALUES (17, 'Kip Thorne', 1940, NULL, 'American', 1.83);
INSERT INTO public.astronomer VALUES (18, 'Vera Rubin', 1928, 2016, 'American', 1.68);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing our Solar System', true, true, 'Various', 'Spiral', 4500.000000, 8000000, 100, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest large galaxy to the Milky Way', false, true, 'Various', 'Spiral', 9000.000000, 0, 150, 2500);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small galaxy near the Andromeda galaxy', false, true, 'Various', 'Spiral', 9200.000000, 0, 40, 3000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way', false, true, 'Various', 'Irregular', 1000.000000, 0, 30, 160);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'A smaller satellite galaxy of the Milky Way', false, true, 'Various', 'Irregular', 800.000000, 0, 20, 200);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A giant elliptical galaxy with a supermassive black hole', false, true, 'Various', 'Elliptical', 9500.000000, 0, 200, 53000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (39, 'Luna', 'Earth moon', false, true, 1, 4500.000000);
INSERT INTO public.moon VALUES (40, 'Titan', 'A large moon of Saturn', false, true, 5, 4500.000000);
INSERT INTO public.moon VALUES (41, 'Europa', 'A moon of Jupiter', false, true, 4, 4500.000000);
INSERT INTO public.moon VALUES (42, 'Ganymede', 'Largest moon of Jupiter', false, true, 4, 4500.000000);
INSERT INTO public.moon VALUES (43, 'Io', 'A volcanic moon of Jupiter', false, true, 4, 4500.000000);
INSERT INTO public.moon VALUES (44, 'Callisto', 'A moon of Jupiter', false, true, 4, 4500.000000);
INSERT INTO public.moon VALUES (45, 'Titania', 'A moon of Uranus', false, true, 7, 4500.000000);
INSERT INTO public.moon VALUES (46, 'Oberon', 'A moon of Uranus', false, true, 7, 4500.000000);
INSERT INTO public.moon VALUES (47, 'Rhea', 'A moon of Saturn', false, true, 5, 4500.000000);
INSERT INTO public.moon VALUES (48, 'Iapetus', 'A moon of Saturn', false, true, 5, 4500.000000);
INSERT INTO public.moon VALUES (49, 'Mimas', 'A moon of Saturn', false, true, 5, 4500.000000);
INSERT INTO public.moon VALUES (50, 'Enceladus', 'A moon of Saturn with water geysers', false, true, 5, 4500.000000);
INSERT INTO public.moon VALUES (51, 'Miranda', 'A moon of Uranus with extreme topography', false, true, 7, 4500.000000);
INSERT INTO public.moon VALUES (52, 'Ariel', 'A moon of Uranus', false, true, 7, 4500.000000);
INSERT INTO public.moon VALUES (53, 'Phoebe', 'A moon of Saturn', false, true, 5, 4500.000000);
INSERT INTO public.moon VALUES (54, 'Charon', 'A moon of Pluto', false, true, 8, 4500.000000);
INSERT INTO public.moon VALUES (55, 'Nereid', 'A moon of Neptune', false, true, 6, 4500.000000);
INSERT INTO public.moon VALUES (56, 'Triton', 'A moon of Neptune', false, true, 6, 4500.000000);
INSERT INTO public.moon VALUES (57, 'Proteus', 'A moon of Neptune', false, true, 6, 4500.000000);
INSERT INTO public.moon VALUES (58, 'Luna 2', 'Earth moon', false, false, 1, 4500.000000);
INSERT INTO public.moon VALUES (59, 'Titan 5', 'A large moon of Saturn', false, true, 5, 4500.000000);
INSERT INTO public.moon VALUES (60, 'Europa 7', 'A moon of Jupiter', true, true, 4, 4500.000000);
INSERT INTO public.moon VALUES (61, 'Ganymede 88', 'Largest moon of Jupiter', false, true, 4, 4500.000000);
INSERT INTO public.moon VALUES (62, 'Io Io', 'A volcanic moon of Jupiter', false, true, 4, 4500.000000);
INSERT INTO public.moon VALUES (63, 'Callisto pakakisi', 'A moon of Jupiter', false, true, 4, 4500.000000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet', true, true, 'Terrestrial', 'Spiral', 4500.000000, 8000, 0, 5);
INSERT INTO public.planet VALUES (2, 'Mars', 'The Red Planet', false, true, 'Terrestrial', 'Spiral', 4500.000000, 0, 225, 10);
INSERT INTO public.planet VALUES (3, 'Venus', 'The hottest planet', false, true, 'Terrestrial', 'Spiral', 4500.000000, 0, 41, 7);
INSERT INTO public.planet VALUES (5, 'Saturn', 'The ringed planet', false, true, 'Gas Giant', 'Spiral', 4500.000000, 0, 1200, 9);
INSERT INTO public.planet VALUES (6, 'Mercury', 'The smallest planet', false, true, 'Terrestrial', 'Spiral', 4500.000000, 0, 92, 5);
INSERT INTO public.planet VALUES (8, 'Uranus', 'An icy planet', false, true, 'Ice Giant', 'Spiral', 4500.000000, 0, 2900, 8);
INSERT INTO public.planet VALUES (9, 'Pluto', 'A dwarf planet', false, true, 'Dwarf', 'Spiral', 4500.000000, 0, 5910, 6);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'An exoplanet', false, true, 'Exoplanet', 'Elliptical', 6000.000000, NULL, 635, 5);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 'Closest exoplanet', false, true, 'Exoplanet', 'Elliptical', 5000.000000, NULL, 4000, 7);
INSERT INTO public.planet VALUES (12, 'Gliese 581d', 'A rocky exoplanet', false, true, 'Exoplanet', 'Elliptical', 7000.000000, NULL, 20000, 9);
INSERT INTO public.planet VALUES (7, 'Neptune', 'A blue planet', false, true, 'Ice Giant', 'Spiral', 4500.000000, 0, 4300, 9);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'The largest planet', false, true, 'Gas Giant', 'Spiral', 4500.000000, 0, 628, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (5, 'Sun', 'The center of our Solar System', 4600.000000, true, false, 0, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'The closest star to the Sun', 4500.000000, true, false, 4, 2);
INSERT INTO public.star VALUES (7, 'Sirius', 'The brightest star in the night sky', 250.000000, true, false, 8, 1);
INSERT INTO public.star VALUES (8, 'Alpha Centauri A', 'Part of a binary star system', 4600.000000, true, false, 5, 2);
INSERT INTO public.star VALUES (9, 'Betelgeuse', 'A red supergiant in Orion', 9999.000000, true, false, 642, 3);
INSERT INTO public.star VALUES (10, 'Rigel', 'A blue supergiant in Orion', 8000.000000, true, false, 864, 3);


--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomer_astronomer_id_seq', 18, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 63, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: astronomer astronomer_height_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_height_key UNIQUE (height);


--
-- Name: astronomer astronomer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_name_key UNIQUE (name);


--
-- Name: astronomer astronomer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_pkey PRIMARY KEY (astronomer_id);


--
-- Name: galaxy galaxy_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_distance_from_earth_key UNIQUE (distance_from_earth);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_distance_from_earth_key UNIQUE (distance_from_earth);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_distance_from_earth_key UNIQUE (distance_from_earth);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

