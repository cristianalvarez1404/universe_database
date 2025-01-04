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

--
-- Name: comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_id_seq OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer DEFAULT nextval('public.comet_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_year integer,
    distance_from_earth integer,
    temperature numeric(5,2),
    description text,
    has_life boolean,
    is_spherical boolean
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
    name character varying(50),
    age_in_millions_of_year integer,
    distance_from_earth integer,
    temperature numeric(5,2),
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_id integer NOT NULL
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
    name character varying(255),
    age_in_millions_of_year integer,
    distance_from_earth integer,
    temperature numeric(5,2),
    description text,
    has_life boolean,
    is_spherical boolean,
    star_id integer NOT NULL
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
    name character varying(50),
    age_in_millions_of_year integer,
    distance_from_earth integer,
    temperature numeric(4,2),
    description text,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer NOT NULL
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Cometa Halley', 'Es uno de los cometas más famosos y visibles desde la Tierra, con un período orbital de aproximadamente 76 años. Se ha observado desde hace más de 2,000 años. El último paso cercano a la Tierra fue en 1986.');
INSERT INTO public.comet VALUES (2, 'Cometa Hale-Bopp', 'Fue uno de los cometas más brillantes y visibles a simple vista en el siglo XX. Fue descubierto en 1995 y se acercó a la Tierra en 1997. Tiene un período orbital de más de 2,400 años.');
INSERT INTO public.comet VALUES (3, 'Cometa NEOWISE (C/2020 F3)', 'Descubierto en marzo de 2020 por el satélite NEOWISE, este cometa fue visible a simple vista desde la Tierra en el verano de 2020. Su paso cercano a la Tierra fue uno de los más espectaculares en años recientes.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'via lactea', 13, 0, -270.00, 'Nuestra galaxia, compuesta por miles de millones de estrellas', true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10, 2537, -270.00, 'La galaxia más cercana a la Vía Láctea, se espera que colisione con ella en unos 4.5 mil millones de años.', false, false);
INSERT INTO public.galaxy VALUES (3, 'Galaxia de sombrero', 10, 28, -270.00, 'Galaxia espiral con un gran bulbo central, visible en el cielo como una estructura de sombrero.', false, false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87 (M87)', 13, 53, -270.00, 'Una galaxia elíptica gigante en el centro del cúmulo Virgo, conocida por su agujero negro supermasivo.', false, false);
INSERT INTO public.galaxy VALUES (5, 'NGC 1300', 10, 61, -270.00, 'Una galaxia espiral barrada, visible desde la Tierra en la constelación de Eridanus.', false, false);
INSERT INTO public.galaxy VALUES (6, 'IC 1101', 13, 1004, -270.00, 'Una de las galaxias más grandes conocidas, con un tamaño mucho mayor que la Vía Láctea.', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna hipotética de Sirio', 100, 9, NULL, 'Sería una luna en el sistema de Sirio B, una enana blanca. Las lunas en este tipo de sistemas pueden ser frías y posiblemente no tener atmósfera.', false, false, 1);
INSERT INTO public.moon VALUES (2, 'Exoluna en Andrómeda', 1000, 3, NULL, 'Andrómeda I hace referencia a la galaxia de Andrómeda. Las exolunas en esta galaxia podrían ser similares a las lunas de nuestro Sistema Solar, dependiendo de los planetas que las rodeen.', false, false, 2);
INSERT INTO public.moon VALUES (3, 'Luna en M104 (Galaxia Sombrero)', 1000, 50, NULL, 'El sistema de M104 podría tener planetas con lunas, aunque aún no se ha confirmado una luna específica. La temperatura de la luna dependería del planeta y la estrella.', false, false, 3);
INSERT INTO public.moon VALUES (4, 'Luna hipotética en M87 (cúmulos globulares)', 1000, 55, NULL, 'Los cúmulos globulares no favorecen la formación de lunas, pero si existieran, serían lunas frías orbitando planetas en sistemas viejos.', false, false, 4);
INSERT INTO public.moon VALUES (5, 'Luna en el sistema de NGC 2244 (Nebulosa Rosetta)', 4, 4500, NULL, 'NGC 2244 es un cúmulo joven con estrellas calientes. Las lunas en este sistema podrían estar en formación y ser muy jóvenes.', false, false, 5);
INSERT INTO public.moon VALUES (6, 'Luna en el sistema de IC 1101', 1000, 1, NULL, 'IC 1101 es una galaxia gigante. Si tuviera planetas con lunas, estas lunas podrían estar en sistemas estelares viejos y ser frías o lejanas.', false, false, 6);
INSERT INTO public.moon VALUES (21, 'Luna (Tierra)', 5, 1, -53.00, 'La luna de la Tierra, la única luna natural de nuestro planeta.', false, true, 1);
INSERT INTO public.moon VALUES (22, 'Ío', 5, 628, -143.00, 'Luna volcánica de Júpiter, con actividad geotérmica intensa.', false, true, 2);
INSERT INTO public.moon VALUES (23, 'Europa', 5, 628, -160.00, 'Luna de Júpiter con un océano subterráneo, considerada candidata para vida.', true, true, 3);
INSERT INTO public.moon VALUES (24, 'Ganímedes', 5, 628, -163.00, 'La luna más grande del sistema solar, tiene un océano subterráneo.', false, true, 4);
INSERT INTO public.moon VALUES (25, 'Calisto', 5, 628, -139.00, 'Luna de Júpiter con una superficie helada, con posibilidad de océanos subterráneos.', false, true, 5);
INSERT INTO public.moon VALUES (26, 'Titán', 5, 1222, -179.00, 'Luna de Saturno, con atmósfera densa y lagos de metano líquido.', false, true, 6);
INSERT INTO public.moon VALUES (27, 'Encelado', 5, 1267, -201.00, 'Luna de Saturno, famosa por sus géiseres que podrían sugerir actividad biológica.', true, true, 8);
INSERT INTO public.moon VALUES (28, 'Mimas', 5, 1222, -193.00, 'Luna de Saturno, conocida por su gran cráter Herschel.', false, true, 8);
INSERT INTO public.moon VALUES (29, 'Rea', 5, 1222, -220.00, 'Luna de Saturno, cubierta de hielo, es una de las lunas más grandes.', false, true, 9);
INSERT INTO public.moon VALUES (30, 'Tritón', 5, 4, -235.00, 'Luna de Neptuno, tiene una órbita retrógrada, lo que sugiere que podría haber sido capturada.', false, true, 10);
INSERT INTO public.moon VALUES (31, 'Lunas de Marte (Fobos)', 5, 10, -50.00, 'Luna irregular de Marte, se acerca cada vez más al planeta.', false, false, 11);
INSERT INTO public.moon VALUES (32, 'Lunas de Marte (Deimos)', 5, 24, -50.00, 'Luna irregular de Marte, más alejada que Fobos.', false, false, 12);
INSERT INTO public.moon VALUES (33, 'Oberón', 5, 4, -214.00, 'Luna de Urano, cubierta de hielo y con grandes cañones.', false, true, 1);
INSERT INTO public.moon VALUES (34, 'Titania', 5, 4, -224.00, 'Luna de Urano, la más grande de este planeta, tiene una atmósfera tenue.', false, true, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Sirio B (Planeta potencial alrededor de Sirio)', 100, 9, NULL, 'Sirio B es una enana blanca que podría haber tenido planetas, aunque no se ha confirmado la existencia de uno.', false, false, 1);
INSERT INTO public.planet VALUES (2, 'Andrómeda I (M31),', 1000, 3, NULL, 'Andrómeda I hace referencia a la galaxia de Andrómeda, donde se han encontrado exoplanetas en varios sistemas.', false, false, 2);
INSERT INTO public.planet VALUES (3, 'Planeta en el Sistema de HD 100215 (Galaxia Sombrero),', 1000, 50, NULL, 'No se ha confirmado un planeta específico alrededor de HD 100215, pero se ha sugerido la posibilidad de exoplanetas en M104.', false, false, 3);
INSERT INTO public.planet VALUES (4, 'Planetas en M87 (cúmulos globulares),', 1000, 55, NULL, 'Los planetas en los cúmulos globulares que rodean M87 son hipotéticos, ya que no se han confirmado planetas alrededor de M87 específicamente.', false, false, 4);
INSERT INTO public.planet VALUES (5, 'Exoplaneta en el Cúmulo NGC 2244 (Nebulosa Rosetta),', 4, 4500, NULL, 'El cúmulo NGC 2244 es joven y contiene estrellas calientes, lo que sugiere que algunos planetas en este sistema podrían ser muy calientes.', false, false, 5);
INSERT INTO public.planet VALUES (6, 'Planeta en el Sistema de IC 1101', 1000, 100, NULL, 'IC 1101 es una galaxia elíptica gigante, y aunque no se han confirmado planetas específicos, se cree que podrían existir planetas alrededor de estrellas en su periferia.', false, false, 6);
INSERT INTO public.planet VALUES (8, 'Kepler-452b', 6, 1, 30.00, 'Planeta similar a la Tierra, potencialmente habitable, en zona habitable de su estrella.', true, true, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 5, 4, 40.00, 'Planeta rocoso, en la zona habitable de la estrella enana roja Proxima Centauri.', true, true, 2);
INSERT INTO public.planet VALUES (10, 'HD 100215 b', 1, 300, 120.00, 'Planeta gigante gaseoso en la zona habitable de una estrella de tipo K.', false, true, 3);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 3, 620, 22.00, 'Exoplaneta con clima templado, dentro de la zona habitable de su estrella.', true, true, 4);
INSERT INTO public.planet VALUES (12, 'HD 46223 b', 3, 300, 90.00, 'Exoplaneta gaseoso, con una atmósfera densa, orbita una estrella tipo G.', false, true, 5);
INSERT INTO public.planet VALUES (13, 'WASP-12b', 500, 2, 2.00, 'Planeta gigante caliente, con temperaturas extremas, cercano a su estrella.', false, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirio (α Canis Majoris)', 120, 7, 10.00, 'Es una estrella binaria, con una gigante blanca y una enana blanca. Es la más brillante del cielo nocturno.', false, false, 1);
INSERT INTO public.star VALUES (2, 'Alpheratz (α Andromedae)', 300, 97, 10.00, 'Estrella gigante azul en la constelación de Andrómeda, parte de la galaxia M31.', false, false, 2);
INSERT INTO public.star VALUES (3, 'HD 100215 (Galaxia Sombrero)', 400, 50, 5.00, 'Estrella de tipo espectral G5V, perteneciente a la galaxia M104, también conocida como la Galaxia del Sombrero.', false, false, 3);
INSERT INTO public.star VALUES (4, 'NGC 4486A (Messier 87)', 13, 55, 5.00, 'Estrella ubicada en el cúmulo globular en la galaxia M87, una galaxia elíptica gigante.', false, false, 4);
INSERT INTO public.star VALUES (5, 'HD 46223 (NGC 2244, Nebulosa Rosetta)', 5, 4500, 35.00, 'Estrella masiva, joven y caliente que forma parte de un cúmulo estelar en la Nebulosa Rosetta.', false, false, 5);
INSERT INTO public.star VALUES (6, 'IC 1101-1 (Galaxia IC 1101)', 10, 2000, 6.00, 'Estrella ubicada en la galaxia elíptica gigante IC 1101, una de las galaxias más grandes conocidas.', false, false, 6);


--
-- Name: comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 34, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_description_key UNIQUE (description);


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
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


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

