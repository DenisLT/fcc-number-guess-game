--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: user_record; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_record (
    id integer NOT NULL,
    username character varying,
    games_played integer DEFAULT 0,
    guesses integer DEFAULT 99999
);


ALTER TABLE public.user_record OWNER TO freecodecamp;

--
-- Name: user_record_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_record_id_seq OWNER TO freecodecamp;

--
-- Name: user_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_record_id_seq OWNED BY public.user_record.id;


--
-- Name: user_record id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_record ALTER COLUMN id SET DEFAULT nextval('public.user_record_id_seq'::regclass);


--
-- Data for Name: user_record; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_record VALUES (2, 'user_1672793360025', 0, 99999);
INSERT INTO public.user_record VALUES (3, 'user_1672793360024', 0, 99999);
INSERT INTO public.user_record VALUES (5, 'user_1672793623282', 2, 163);
INSERT INTO public.user_record VALUES (4, 'user_1672793623283', 5, 134);
INSERT INTO public.user_record VALUES (7, 'user_1672793649142', 2, 20);
INSERT INTO public.user_record VALUES (6, 'user_1672793649143', 5, 244);
INSERT INTO public.user_record VALUES (1, 'denis', 1, 14);
INSERT INTO public.user_record VALUES (9, 'user_1672793723216', 2, 160);
INSERT INTO public.user_record VALUES (8, 'user_1672793723217', 5, 65);
INSERT INTO public.user_record VALUES (11, 'user_1672793743485', 2, 61);
INSERT INTO public.user_record VALUES (10, 'user_1672793743486', 5, 132);
INSERT INTO public.user_record VALUES (13, 'user_1672793781117', 2, 610);
INSERT INTO public.user_record VALUES (12, 'user_1672793781118', 5, 322);


--
-- Name: user_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_record_id_seq', 13, true);


--
-- Name: user_record user_record_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_record
    ADD CONSTRAINT user_record_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

