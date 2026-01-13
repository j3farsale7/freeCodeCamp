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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: data_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.data_table (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.data_table OWNER TO freecodecamp;

--
-- Data for Name: data_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.data_table VALUES ('Jaafar', 1, 10);
INSERT INTO public.data_table VALUES ('user_1768346357855', 2, 206);
INSERT INTO public.data_table VALUES ('user_1768346357856', 5, 34);
INSERT INTO public.data_table VALUES ('user_1768346392615', 2, 177);
INSERT INTO public.data_table VALUES ('user_1768346392616', 5, 47);
INSERT INTO public.data_table VALUES ('user_1768346406786', 2, 684);
INSERT INTO public.data_table VALUES ('user_1768346406787', 5, 188);


--
-- Name: data_table data_table_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.data_table
    ADD CONSTRAINT data_table_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

