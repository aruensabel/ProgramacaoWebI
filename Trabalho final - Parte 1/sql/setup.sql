--
-- PostgreSQL database dump
--

\restrict g0GCQjVkWfTHcb5wsM9iE5ikacgh9WPRYdkt1YrnRVNsZuXT3xmGz5t11QHPgGt

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.0

-- Started on 2025-11-13 16:52:07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5015 (class 1262 OID 24580)
-- Name: avaliacao; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE avaliacao WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE avaliacao OWNER TO postgres;

\unrestrict g0GCQjVkWfTHcb5wsM9iE5ikacgh9WPRYdkt1YrnRVNsZuXT3xmGz5t11QHPgGt
\connect avaliacao
\restrict g0GCQjVkWfTHcb5wsM9iE5ikacgh9WPRYdkt1YrnRVNsZuXT3xmGz5t11QHPgGt

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 226 (class 1259 OID 24683)
-- Name: avaliacoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avaliacoes (
    id_avaliacao integer NOT NULL,
    id_setor integer,
    id_pergunta integer,
    id_dispositivo integer,
    resposta integer,
    feedback text,
    data_hora timestamp without time zone DEFAULT now(),
    CONSTRAINT avaliacoes_resposta_check CHECK (((resposta >= 0) AND (resposta <= 10)))
);


ALTER TABLE public.avaliacoes OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24682)
-- Name: avaliacoes_id_avaliacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.avaliacoes_id_avaliacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.avaliacoes_id_avaliacao_seq OWNER TO postgres;

--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 225
-- Name: avaliacoes_id_avaliacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.avaliacoes_id_avaliacao_seq OWNED BY public.avaliacoes.id_avaliacao;


--
-- TOC entry 222 (class 1259 OID 24661)
-- Name: dispositivos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dispositivos (
    id_dispositivo integer NOT NULL,
    nome character varying(100) NOT NULL,
    status boolean DEFAULT true
);


ALTER TABLE public.dispositivos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24660)
-- Name: dispositivos_id_dispositivo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dispositivos_id_dispositivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dispositivos_id_dispositivo_seq OWNER TO postgres;

--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 221
-- Name: dispositivos_id_dispositivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dispositivos_id_dispositivo_seq OWNED BY public.dispositivos.id_dispositivo;


--
-- TOC entry 224 (class 1259 OID 24671)
-- Name: perguntas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perguntas (
    id_pergunta integer NOT NULL,
    texto text NOT NULL,
    status boolean DEFAULT true
);


ALTER TABLE public.perguntas OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24670)
-- Name: perguntas_id_pergunta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perguntas_id_pergunta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.perguntas_id_pergunta_seq OWNER TO postgres;

--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 223
-- Name: perguntas_id_pergunta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perguntas_id_pergunta_seq OWNED BY public.perguntas.id_pergunta;


--
-- TOC entry 220 (class 1259 OID 24652)
-- Name: setores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setores (
    id_setor integer NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE public.setores OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24651)
-- Name: setores_id_setor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.setores_id_setor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.setores_id_setor_seq OWNER TO postgres;

--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 219
-- Name: setores_id_setor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.setores_id_setor_seq OWNED BY public.setores.id_setor;


--
-- TOC entry 228 (class 1259 OID 24710)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    login character varying(50) NOT NULL,
    senha character varying(255) NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24709)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 227
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- TOC entry 4834 (class 2604 OID 24686)
-- Name: avaliacoes id_avaliacao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacoes ALTER COLUMN id_avaliacao SET DEFAULT nextval('public.avaliacoes_id_avaliacao_seq'::regclass);


--
-- TOC entry 4830 (class 2604 OID 24664)
-- Name: dispositivos id_dispositivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dispositivos ALTER COLUMN id_dispositivo SET DEFAULT nextval('public.dispositivos_id_dispositivo_seq'::regclass);


--
-- TOC entry 4832 (class 2604 OID 24674)
-- Name: perguntas id_pergunta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perguntas ALTER COLUMN id_pergunta SET DEFAULT nextval('public.perguntas_id_pergunta_seq'::regclass);


--
-- TOC entry 4829 (class 2604 OID 24655)
-- Name: setores id_setor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setores ALTER COLUMN id_setor SET DEFAULT nextval('public.setores_id_setor_seq'::regclass);


--
-- TOC entry 4836 (class 2604 OID 24713)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 5007 (class 0 OID 24683)
-- Dependencies: 226
-- Data for Name: avaliacoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (2, NULL, 1, NULL, 10, '', '2025-11-13 15:56:03.046235');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (3, NULL, 2, NULL, 10, '', '2025-11-13 15:56:03.053294');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (4, NULL, 3, NULL, 10, '', '2025-11-13 15:56:03.054617');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (5, NULL, 4, NULL, 10, '', '2025-11-13 15:56:03.055393');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (6, NULL, 5, NULL, 10, '', '2025-11-13 15:56:03.056134');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (7, NULL, 6, NULL, 10, '', '2025-11-13 15:56:03.056888');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (8, NULL, 7, NULL, 10, '', '2025-11-13 15:56:03.05734');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (9, NULL, 1, NULL, 8, '', '2025-11-13 16:08:48.826806');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (10, NULL, 2, NULL, 8, '', '2025-11-13 16:08:48.836608');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (11, NULL, 3, NULL, 9, '', '2025-11-13 16:08:48.837044');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (12, NULL, 4, NULL, 4, '', '2025-11-13 16:08:48.837359');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (13, NULL, 5, NULL, 3, '', '2025-11-13 16:08:48.837627');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (14, NULL, 6, NULL, 6, '', '2025-11-13 16:08:48.837885');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (15, NULL, 7, NULL, 5, '', '2025-11-13 16:08:48.83815');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (16, NULL, 1, NULL, 8, '', '2025-11-13 16:11:35.856872');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (17, NULL, 2, NULL, 8, '', '2025-11-13 16:11:35.860478');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (18, NULL, 3, NULL, 9, '', '2025-11-13 16:11:35.861404');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (19, NULL, 4, NULL, 4, '', '2025-11-13 16:11:35.862285');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (20, NULL, 5, NULL, 3, '', '2025-11-13 16:11:35.863137');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (21, NULL, 6, NULL, 6, '', '2025-11-13 16:11:35.864042');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (22, NULL, 7, NULL, 5, '', '2025-11-13 16:11:35.864834');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (23, NULL, 1, NULL, 9, '', '2025-11-13 16:22:57.588252');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (24, NULL, 2, NULL, 9, '', '2025-11-13 16:22:57.605016');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (25, NULL, 3, NULL, 7, '', '2025-11-13 16:22:57.605958');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (26, NULL, 4, NULL, 2, '', '2025-11-13 16:22:57.606819');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (27, NULL, 5, NULL, 8, '', '2025-11-13 16:22:57.60761');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (28, NULL, 6, NULL, 10, '', '2025-11-13 16:22:57.60833');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (29, NULL, 7, NULL, 5, '', '2025-11-13 16:22:57.609022');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (30, NULL, 1, NULL, 9, 'hnfilsbf', '2025-11-13 16:25:07.750757');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (31, NULL, 2, NULL, 9, 'hnfilsbf', '2025-11-13 16:25:07.758405');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (32, NULL, 3, NULL, 10, 'hnfilsbf', '2025-11-13 16:25:07.759483');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (33, NULL, 4, NULL, 5, 'hnfilsbf', '2025-11-13 16:25:07.760306');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (34, NULL, 5, NULL, 10, 'hnfilsbf', '2025-11-13 16:25:07.761139');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (35, NULL, 6, NULL, 10, 'hnfilsbf', '2025-11-13 16:25:07.761986');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (36, NULL, 7, NULL, 10, 'hnfilsbf', '2025-11-13 16:25:07.762855');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (37, NULL, 1, NULL, 10, '', '2025-11-13 16:39:49.228767');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (38, NULL, 2, NULL, 10, '', '2025-11-13 16:39:49.236929');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (39, NULL, 3, NULL, 10, '', '2025-11-13 16:39:49.238009');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (40, NULL, 4, NULL, 10, '', '2025-11-13 16:39:49.238883');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (41, NULL, 5, NULL, 10, '', '2025-11-13 16:39:49.239726');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (42, NULL, 6, NULL, 10, '', '2025-11-13 16:39:49.240813');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (43, NULL, 7, NULL, 2, '', '2025-11-13 16:39:49.24176');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (44, NULL, 1, NULL, 8, '', '2025-11-13 16:40:42.498645');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (45, NULL, 2, NULL, 5, '', '2025-11-13 16:40:42.504389');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (46, NULL, 3, NULL, 7, '', '2025-11-13 16:40:42.504919');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (47, NULL, 4, NULL, 7, '', '2025-11-13 16:40:42.505326');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (48, NULL, 5, NULL, 7, '', '2025-11-13 16:40:42.50565');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (49, NULL, 6, NULL, 8, '', '2025-11-13 16:40:42.505958');
INSERT INTO public.avaliacoes (id_avaliacao, id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora) VALUES (50, NULL, 7, NULL, 6, '', '2025-11-13 16:40:42.506229');


--
-- TOC entry 5003 (class 0 OID 24661)
-- Dependencies: 222
-- Data for Name: dispositivos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5005 (class 0 OID 24671)
-- Dependencies: 224
-- Data for Name: perguntas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.perguntas (id_pergunta, texto, status) VALUES (1, 'Como você avalia o atendimento neste setor?', true);
INSERT INTO public.perguntas (id_pergunta, texto, status) VALUES (2, 'O tempo de espera foi adequado?', true);
INSERT INTO public.perguntas (id_pergunta, texto, status) VALUES (3, 'A limpeza e organização do ambiente estavam satisfatórias?', true);
INSERT INTO public.perguntas (id_pergunta, texto, status) VALUES (4, 'Você encontrou facilidade para acessar o serviço?', true);
INSERT INTO public.perguntas (id_pergunta, texto, status) VALUES (5, 'Os colaboradores demonstraram cortesia e profissionalismo?', true);
INSERT INTO public.perguntas (id_pergunta, texto, status) VALUES (6, 'A qualidade do serviço atendeu às suas expectativas?', true);
INSERT INTO public.perguntas (id_pergunta, texto, status) VALUES (7, 'Você recomendaria este serviço a outras pessoas?', true);


--
-- TOC entry 5001 (class 0 OID 24652)
-- Dependencies: 220
-- Data for Name: setores; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5009 (class 0 OID 24710)
-- Dependencies: 228
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios (id_usuario, login, senha) VALUES (1, 'admin', '123');


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 225
-- Name: avaliacoes_id_avaliacao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.avaliacoes_id_avaliacao_seq', 50, true);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 221
-- Name: dispositivos_id_dispositivo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dispositivos_id_dispositivo_seq', 1, false);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 223
-- Name: perguntas_id_pergunta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perguntas_id_pergunta_seq', 7, true);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 219
-- Name: setores_id_setor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.setores_id_setor_seq', 1, false);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 227
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 1, true);


--
-- TOC entry 4845 (class 2606 OID 24693)
-- Name: avaliacoes avaliacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacoes
    ADD CONSTRAINT avaliacoes_pkey PRIMARY KEY (id_avaliacao);


--
-- TOC entry 4841 (class 2606 OID 24669)
-- Name: dispositivos dispositivos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dispositivos
    ADD CONSTRAINT dispositivos_pkey PRIMARY KEY (id_dispositivo);


--
-- TOC entry 4843 (class 2606 OID 24681)
-- Name: perguntas perguntas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perguntas
    ADD CONSTRAINT perguntas_pkey PRIMARY KEY (id_pergunta);


--
-- TOC entry 4839 (class 2606 OID 24659)
-- Name: setores setores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setores
    ADD CONSTRAINT setores_pkey PRIMARY KEY (id_setor);


--
-- TOC entry 4847 (class 2606 OID 24720)
-- Name: usuarios usuarios_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_login_key UNIQUE (login);


--
-- TOC entry 4849 (class 2606 OID 24718)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4850 (class 2606 OID 24704)
-- Name: avaliacoes avaliacoes_id_dispositivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacoes
    ADD CONSTRAINT avaliacoes_id_dispositivo_fkey FOREIGN KEY (id_dispositivo) REFERENCES public.dispositivos(id_dispositivo);


--
-- TOC entry 4851 (class 2606 OID 24699)
-- Name: avaliacoes avaliacoes_id_pergunta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacoes
    ADD CONSTRAINT avaliacoes_id_pergunta_fkey FOREIGN KEY (id_pergunta) REFERENCES public.perguntas(id_pergunta);


--
-- TOC entry 4852 (class 2606 OID 24694)
-- Name: avaliacoes avaliacoes_id_setor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacoes
    ADD CONSTRAINT avaliacoes_id_setor_fkey FOREIGN KEY (id_setor) REFERENCES public.setores(id_setor);


-- Completed on 2025-11-13 16:52:08

--
-- PostgreSQL database dump complete
--

\unrestrict g0GCQjVkWfTHcb5wsM9iE5ikacgh9WPRYdkt1YrnRVNsZuXT3xmGz5t11QHPgGt

