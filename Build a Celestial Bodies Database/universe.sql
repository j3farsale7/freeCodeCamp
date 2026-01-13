--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    age_in_millions_of_years numeric(16,4),
    has_life boolean NOT NULL,
    distance_from_earth integer NOT NULL
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
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    hase_life boolean NOT NULL,
    velocity integer NOT NULL,
    mass integer NOT NULL
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
    star_id integer NOT NULL,
    name character varying NOT NULL,
    has_life boolean NOT NULL,
    gravity numeric(8,4),
    radius integer NOT NULL,
    description text
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
-- Name: something; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.something (
    something_id integer NOT NULL,
    name character varying NOT NULL,
    something_int1 integer NOT NULL,
    something_int2 integer NOT NULL,
    something_bool boolean NOT NULL
);


ALTER TABLE public.something OWNER TO freecodecamp;

--
-- Name: something_something_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.something_something_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.something_something_id_seq OWNER TO freecodecamp;

--
-- Name: something_something_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.something_something_id_seq OWNED BY public.something.something_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    star_type character varying,
    mass integer NOT NULL,
    is_spherical boolean,
    temperature integer NOT NULL
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
-- Name: something something_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.something ALTER COLUMN something_id SET DEFAULT nextval('public.something_something_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Zentarus Prime', 'A chaotic spiral galaxy full of neon dust clouds.', 4500.2345, true, 1200000);
INSERT INTO public.galaxy VALUES (2, 'Morlax-7', 'A dim, oddly shaped galaxy rumored to hum at low frequencies.', 9820.5543, false, 3400000);
INSERT INTO public.galaxy VALUES (3, 'Aurelia Cluster', 'Golden-tinted galaxy with unusually dense star formations.', 15000.0001, true, 780000);
INSERT INTO public.galaxy VALUES (4, 'Vorlon Expanse', 'A dark region with almost no visible stars.', 22000.9999, false, 5600000);
INSERT INTO public.galaxy VALUES (5, 'Nebulon Verge', 'A bright, misty galaxy filled with ion storms.', 8700.4444, false, 2100000);
INSERT INTO public.galaxy VALUES (6, 'Crystallis Arc', 'Shimmering crystalline structures orbit its core.', 30500.1234, true, 990000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Aerolune', false, 1200, 9000);
INSERT INTO public.moon VALUES (2, 1, 'Thryxis', true, 800, 4000);
INSERT INTO public.moon VALUES (3, 2, 'Cragspire', false, 600, 2000);
INSERT INTO public.moon VALUES (4, 3, 'Lumora', true, 300, 1500);
INSERT INTO public.moon VALUES (5, 4, 'Frostbyte', false, 100, 500);
INSERT INTO public.moon VALUES (6, 5, 'Dustwhirl', false, 450, 2500);
INSERT INTO public.moon VALUES (7, 6, 'Umbrel', true, 900, 7000);
INSERT INTO public.moon VALUES (8, 1, 'Zephyrion', false, 700, 3000);
INSERT INTO public.moon VALUES (9, 2, 'Gravemoon', false, 500, 1800);
INSERT INTO public.moon VALUES (10, 3, 'Solstice', true, 250, 1200);
INSERT INTO public.moon VALUES (11, 4, 'Shardfall', false, 900, 6000);
INSERT INTO public.moon VALUES (12, 5, 'Cindervale', false, 300, 1400);
INSERT INTO public.moon VALUES (13, 6, 'Nightflare', true, 850, 5000);
INSERT INTO public.moon VALUES (14, 7, 'Rimora', false, 400, 2100);
INSERT INTO public.moon VALUES (15, 8, 'Frostgale', false, 200, 900);
INSERT INTO public.moon VALUES (16, 9, 'Tremora', true, 1000, 8000);
INSERT INTO public.moon VALUES (17, 10, 'Hollowlight', false, 350, 1600);
INSERT INTO public.moon VALUES (18, 11, 'Gloomreach', false, 450, 2300);
INSERT INTO public.moon VALUES (19, 12, 'Starveil', true, 780, 4200);
INSERT INTO public.moon VALUES (20, 12, 'Palecrest', false, 600, 2600);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Kelvaron', true, 9.8123, 6500, 'A lush world with floating islands.');
INSERT INTO public.planet VALUES (2, 1, 'Drathos', false, 3.2211, 3200, 'Rocky, unstable terrain with constant quakes.');
INSERT INTO public.planet VALUES (3, 2, 'Mirellia', true, 11.4421, 7200, 'Covered in purple oceans and bioluminescent forests.');
INSERT INTO public.planet VALUES (4, 3, 'Tarkuun', false, 1.0023, 1500, 'Tiny frozen sphere drifting silently.');
INSERT INTO public.planet VALUES (5, 4, 'Epsilon-4', false, 7.9000, 5400, 'Desert planet with massive dust storms.');
INSERT INTO public.planet VALUES (6, 5, 'Noxaris', true, 14.5000, 9000, 'Dark world with glowing fungal life.');
INSERT INTO public.planet VALUES (7, 2, 'Orvantis', false, 5.2210, 4100, 'A barren world with metallic dunes.');
INSERT INTO public.planet VALUES (8, 3, 'Cryon-12', false, 2.5000, 2800, 'Frozen plains and methane storms.');
INSERT INTO public.planet VALUES (9, 4, 'Virellon', true, 10.0000, 6000, 'Dense jungles and massive rivers.');
INSERT INTO public.planet VALUES (10, 5, 'Neraxis', false, 4.7800, 3500, 'A cracked desert world with deep canyons.');
INSERT INTO public.planet VALUES (11, 6, 'Umbraxis', true, 13.9000, 8200, 'Dark atmosphere with glowing storms.');
INSERT INTO public.planet VALUES (12, 1, 'Pallidora', false, 8.1200, 5000, 'Smooth white surface with no visible features.');


--
-- Data for Name: something; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.something VALUES (1, 'AlphaThing', 10, 20, true);
INSERT INTO public.something VALUES (2, 'BetaNode', 99, 1, false);
INSERT INTO public.something VALUES (3, 'GammaUnit', 1234, 5678, true);
INSERT INTO public.something VALUES (4, 'DeltaCore', 42, 9000, false);
INSERT INTO public.something VALUES (5, 'OmegaSpark', 777, 888, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Xerion', 'Hypergiant', 900000, true, 15000);
INSERT INTO public.star VALUES (2, 1, 'Talmaris', 'Dwarf Star', 120000, false, 4500);
INSERT INTO public.star VALUES (3, 2, 'Gorath', 'Neutron Star', 300000, true, 2200000);
INSERT INTO public.star VALUES (4, 3, 'Solara Minor', 'Yellow Star', 200000, true, 5800);
INSERT INTO public.star VALUES (5, 4, 'Umbraflare', 'Dark Star', 500000, false, 12000);
INSERT INTO public.star VALUES (6, 3, 'Helion Crest', 'Blue Giant', 750000, true, 18000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: something_something_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.something_something_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: something something_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.something
    ADD CONSTRAINT something_name_key UNIQUE (name);


--
-- Name: something something_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.something
    ADD CONSTRAINT something_pkey PRIMARY KEY (something_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

