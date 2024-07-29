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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    diameter_in_km integer,
    length_of_tail_in_km integer,
    mass_in_kg numeric(7,2),
    is_active boolean,
    has_tail boolean,
    star_id integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years numeric(7,2),
    mass_in_millions_solar integer,
    distance_in_parsecs integer,
    is_interacting boolean,
    is_catalogued boolean,
    star_id integer
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
    name character varying(50) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years numeric(7,2),
    diameter_in_km integer,
    mass_in_kg integer,
    has_water boolean,
    belongs_to_planet boolean,
    planet_id integer
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
    name character varying(50) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years numeric(7,2),
    diameter_in_km integer,
    average_temperature_celcius integer,
    has_life boolean,
    has_atmosphere boolean,
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
    name character varying(50) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years numeric(7,2),
    radius_km integer,
    mass_solar integer,
    is_supergiant boolean,
    has_planets boolean,
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (2, 'Comet Hale-Bopp', 'One of the brightest comets of the 20th century, visible to the naked eye.', 40, 80000, 99999.99, true, true, 2);
INSERT INTO public.comet VALUES (3, 'Encke''s Comet', 'A short-period comet with a 3.3-year orbit around the Sun.', 10, 25000, 50000.00, true, true, 3);
INSERT INTO public.comet VALUES (4, 'Hyakutake', 'A bright comet that passed close to Earth in 1996.', 30, 100000, 75000.00, true, true, 4);
INSERT INTO public.comet VALUES (5, 'C/2012 S1 (ISON)', 'A comet that was visible to the naked eye in late 2013.', 12, 60000, 80000.00, false, true, 5);
INSERT INTO public.comet VALUES (6, 'Comet Lovejoy', 'A series of comets discovered by astronomer Terry Lovejoy.', 20, 50000, 60000.00, true, true, 1);
INSERT INTO public.comet VALUES (7, 'Comet McNaught', 'One of the brightest comets of the 21st century, visible in 2007.', 25, 70000, 90000.00, true, true, 2);
INSERT INTO public.comet VALUES (8, 'Comet 67P/Churyumov-Gerasimenko', 'A comet visited by the Rosetta spacecraft.', 5, 20000, 99999.99, true, true, 3);
INSERT INTO public.comet VALUES (9, 'Comet Tempel 1', 'A comet visited by the Deep Impact spacecraft in 2005.', 8, 30000, 60000.00, false, true, 4);
INSERT INTO public.comet VALUES (10, 'Comet Hartley 2', 'A comet visited by the EPOXI spacecraft.', 7, 15000, 55000.00, true, true, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, containing our Solar System.', 13600.00, 1500, 0, false, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy to the Milky Way and expected to collide with it in about 4.5 billion years.', 10000.00, 1250, 778000, true, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A member of the Local Group and the third-largest galaxy after the Milky Way and Andromeda.', 10000.00, 500, 860000, false, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting grand-design spiral galaxy.', 400.00, 160, 23000000, true, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Notable for its bright nucleus and large central bulge.', 9000.00, 800, 9400000, false, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy located in the constellation Ursa Major.', 10000.00, 1000, 21200000, false, true, NULL);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel', 'Result of a collision between two galaxies.', 500.00, 200, 500000, true, true, NULL);
INSERT INTO public.galaxy VALUES (8, 'Black Eye', 'Named for the dark band of absorbing dust in front of the galaxy''s bright nucleus.', 10000.00, 300, 17000000, false, true, NULL);
INSERT INTO public.galaxy VALUES (9, 'Cigar', 'Cigar-shaped galaxy with high rates of star formation.', 600.00, 250, 12000000, true, true, NULL);
INSERT INTO public.galaxy VALUES (10, 'Messier 87', 'A supergiant elliptical galaxy with a notable jet of energetic plasma.', 13600.00, 6000, 53200000, false, true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (55, 'Ceres', 'The largest object in the asteroid belt, sometimes considered a dwarf planet.', 4500.00, 940, 940000, true, false, NULL);
INSERT INTO public.moon VALUES (43, 'Moon', 'Earth''s only natural satellite.', 4500.00, 3474, 7350000, true, true, 13);
INSERT INTO public.moon VALUES (44, 'Phobos', 'One of Mars'' moons, known for its irregular shape.', 4500.00, 22, 10800000, false, true, 14);
INSERT INTO public.moon VALUES (45, 'Deimos', 'The smaller of Mars'' two moons.', 4500.00, 12, 48000, false, true, 15);
INSERT INTO public.moon VALUES (46, 'Io', 'One of Jupiter''s moons, known for its volcanic activity.', 4500.00, 3643, 42000000, true, true, 16);
INSERT INTO public.moon VALUES (47, 'Europa', 'A moon of Jupiter with a subsurface ocean.', 4500.00, 3122, 4800000, true, true, 21);
INSERT INTO public.moon VALUES (48, 'Ganymede', 'The largest moon in the Solar System, orbiting Jupiter.', 4500.00, 5268, 1480000, true, true, 17);
INSERT INTO public.moon VALUES (49, 'Callisto', 'A moon of Jupiter with a heavily cratered surface.', 4500.00, 4821, 1080000, false, true, 18);
INSERT INTO public.moon VALUES (50, 'Titan', 'Saturn''s largest moon, with a thick atmosphere.', 4500.00, 5150, 13500000, true, true, 19);
INSERT INTO public.moon VALUES (51, 'Rhea', 'A moon of Saturn with a heavily cratered surface.', 4500.00, 1528, 5200, false, true, 20);
INSERT INTO public.moon VALUES (52, 'Enceladus', 'A small moon of Saturn with water geysers.', 4500.00, 504, 11000000, true, true, 21);
INSERT INTO public.moon VALUES (53, 'Triton', 'The largest moon of Neptune, known for its retrograde orbit.', 4500.00, 2707, 2140000000, true, true, 22);
INSERT INTO public.moon VALUES (54, 'Charon', 'Pluto''s largest moon.', 4500.00, 1212, 152000000, false, true, 16);
INSERT INTO public.moon VALUES (56, 'Oberon', 'A moon of Uranus.', 4500.00, 1523, 310000, false, true, 23);
INSERT INTO public.moon VALUES (57, 'Miranda', 'A moon of Uranus with a highly irregular surface.', 4500.00, 472, 660000, false, true, 24);
INSERT INTO public.moon VALUES (58, 'Ganymede II', 'A hypothetical moon of Jupiter, often used in scientific discussions.', 4500.00, 1000, 10000, true, true, 15);
INSERT INTO public.moon VALUES (59, 'Hyperion', 'A moon of Saturn with a spongy appearance.', 4500.00, 270, 56000, false, true, 24);
INSERT INTO public.moon VALUES (60, 'Iapetus', 'A moon of Saturn with a striking two-tone coloration.', 4500.00, 1469, 420000, false, true, 13);
INSERT INTO public.moon VALUES (61, 'Dione', 'A moon of Saturn with a heavily cratered surface.', 4500.00, 1122, 11000000, false, true, 14);
INSERT INTO public.moon VALUES (62, 'Mimas', 'A moon of Saturn, notable for its large impact crater.', 4500.00, 396, 420000, false, true, 15);
INSERT INTO public.moon VALUES (63, 'Umbriel', 'A moon of Uranus with a dark surface.', 4500.00, 1169, 2100000, false, true, 17);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Earth', 'The only planet known to support life.', 4500.00, 12742, 15, true, true, 1);
INSERT INTO public.planet VALUES (14, 'Mars', 'Known as the Red Planet.', 4500.00, 6779, -63, false, true, 1);
INSERT INTO public.planet VALUES (15, 'Proxima b', 'An exoplanet orbiting the red dwarf star Proxima Centauri.', 4500.00, 11400, -39, false, true, 3);
INSERT INTO public.planet VALUES (16, 'Sirius b', 'A white dwarf that is the closest known white dwarf star to Earth.', 242.00, 11600, -128, false, false, 4);
INSERT INTO public.planet VALUES (17, 'Vega b', 'An exoplanet orbiting the star Vega.', 455.00, 12000, -90, false, true, 6);
INSERT INTO public.planet VALUES (18, 'Polaris b', 'A hypothetical exoplanet orbiting Polaris.', 7000.00, 13450, -70, false, true, 7);
INSERT INTO public.planet VALUES (19, 'Alpha Centauri Bb', 'A planet in the Alpha Centauri system.', 4500.00, 11400, 22, false, true, 8);
INSERT INTO public.planet VALUES (20, 'Altair b', 'An exoplanet orbiting the star Altair.', 1400.00, 12100, -10, false, true, 10);
INSERT INTO public.planet VALUES (21, 'Gliese 581g', 'A potentially habitable exoplanet orbiting the star Gliese 581.', 7000.00, 13600, -37, false, true, 5);
INSERT INTO public.planet VALUES (22, 'TRAPPIST-1d', 'One of the seven known planets orbiting the ultra-cool dwarf star TRAPPIST-1.', 1000.00, 12900, -53, false, true, 2);
INSERT INTO public.planet VALUES (23, 'Kepler-22b', 'An exoplanet orbiting within the habitable zone of the star Kepler-22.', 4000.00, 24000, 22, false, true, 9);
INSERT INTO public.planet VALUES (24, 'HD 209458 b', 'An exoplanet in the constellation Pegasus.', 4000.00, 143000, 1100, false, true, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our Solar System.', 4600.00, 695700, 1, false, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'A red supergiant star in the constellation Orion.', 8700.00, 1180, 3, true, false, NULL);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'The closest known star to the Sun.', 4500.00, 200000, 0, false, true, 2);
INSERT INTO public.star VALUES (4, 'Sirius', 'The brightest star in the night sky.', 242.00, 2400000, 2, false, true, 3);
INSERT INTO public.star VALUES (5, 'Rigel', 'A blue supergiant star in the constellation Orion.', 8000.00, 2100000, 21, true, false, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 'A star in the constellation Lyra and one of the most luminous stars in the vicinity of the Sun.', 455.00, 2000000, 2, false, true, 4);
INSERT INTO public.star VALUES (7, 'Polaris', 'The current northern pole star.', 7000.00, 5400000, 5, false, true, 5);
INSERT INTO public.star VALUES (8, 'Alpha Centauri A', 'A star in the closest star system to the Solar System.', 4500.00, 1100000, 1, false, true, 2);
INSERT INTO public.star VALUES (9, 'Antares', 'A red supergiant star in the constellation Scorpius.', 12000.00, 12000000, 12, true, false, NULL);
INSERT INTO public.star VALUES (10, 'Altair', 'The brightest star in the constellation Aquila.', 1400.00, 1790000, 2, false, true, 6);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: star fkey_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fkey_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fkey_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fkey_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy fkey_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fkey_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet fkey_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fkey_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

