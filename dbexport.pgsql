--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
-- Dumped by pg_dump version 12.7

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
-- Name: app_candidat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_candidat (
    matricule bigint NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL,
    "NumeroTable" character varying(100),
    "dateNaiss" character varying(100) NOT NULL,
    exclu boolean,
    salle character varying(100),
    specialite_id bigint NOT NULL
);


ALTER TABLE public.app_candidat OWNER TO postgres;

--
-- Name: app_candidat_matricule_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_candidat_matricule_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_candidat_matricule_seq OWNER TO postgres;

--
-- Name: app_candidat_matricule_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_candidat_matricule_seq OWNED BY public.app_candidat.matricule;


--
-- Name: app_copie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_copie (
    id bigint NOT NULL,
    code character varying(100) NOT NULL,
    note integer,
    subi3eme boolean,
    idepreuve_id bigint NOT NULL,
    matricule_id bigint NOT NULL
);


ALTER TABLE public.app_copie OWNER TO postgres;

--
-- Name: app_copie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_copie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_copie_id_seq OWNER TO postgres;

--
-- Name: app_copie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_copie_id_seq OWNED BY public.app_copie.id;


--
-- Name: app_correcteur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_correcteur (
    id bigint NOT NULL,
    epreuve character varying(100)
);


ALTER TABLE public.app_correcteur OWNER TO postgres;

--
-- Name: app_correcteur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_correcteur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_correcteur_id_seq OWNER TO postgres;

--
-- Name: app_correcteur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_correcteur_id_seq OWNED BY public.app_correcteur.id;


--
-- Name: app_corrigestype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_corrigestype (
    id bigint NOT NULL,
    "nomFichier" character varying(100) NOT NULL,
    "Epreuve" character varying(100) NOT NULL
);


ALTER TABLE public.app_corrigestype OWNER TO postgres;

--
-- Name: app_corrigestype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_corrigestype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_corrigestype_id_seq OWNER TO postgres;

--
-- Name: app_corrigestype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_corrigestype_id_seq OWNED BY public.app_corrigestype.id;


--
-- Name: app_epreuve; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_epreuve (
    id bigint NOT NULL,
    titre character varying(100) NOT NULL,
    coeff integer NOT NULL
);


ALTER TABLE public.app_epreuve OWNER TO postgres;

--
-- Name: app_epreuve_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_epreuve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_epreuve_id_seq OWNER TO postgres;

--
-- Name: app_epreuve_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_epreuve_id_seq OWNED BY public.app_epreuve.id;


--
-- Name: app_fichiers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_fichiers (
    id bigint NOT NULL,
    filename character varying(100) NOT NULL,
    type character varying(100) NOT NULL
);


ALTER TABLE public.app_fichiers OWNER TO postgres;

--
-- Name: app_fichiers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_fichiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_fichiers_id_seq OWNER TO postgres;

--
-- Name: app_fichiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_fichiers_id_seq OWNED BY public.app_fichiers.id;


--
-- Name: app_listcandidats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_listcandidats (
    id bigint NOT NULL,
    "nomFichier" character varying(100) NOT NULL,
    "idSpecialite_id" bigint NOT NULL
);


ALTER TABLE public.app_listcandidats OWNER TO postgres;

--
-- Name: app_listcandidats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_listcandidats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_listcandidats_id_seq OWNER TO postgres;

--
-- Name: app_listcandidats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_listcandidats_id_seq OWNED BY public.app_listcandidats.id;


--
-- Name: app_resultat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_resultat (
    id bigint NOT NULL,
    resul integer NOT NULL,
    matricule_id bigint NOT NULL
);


ALTER TABLE public.app_resultat OWNER TO postgres;

--
-- Name: app_resultat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_resultat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_resultat_id_seq OWNER TO postgres;

--
-- Name: app_resultat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_resultat_id_seq OWNED BY public.app_resultat.id;


--
-- Name: app_resultat_module; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_resultat_module (
    id bigint NOT NULL,
    ep character varying(100) NOT NULL,
    moy_note double precision NOT NULL,
    matricule_id bigint NOT NULL
);


ALTER TABLE public.app_resultat_module OWNER TO postgres;

--
-- Name: app_resultat_module_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_resultat_module_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_resultat_module_id_seq OWNER TO postgres;

--
-- Name: app_resultat_module_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_resultat_module_id_seq OWNED BY public.app_resultat_module.id;


--
-- Name: app_specialite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_specialite (
    id bigint NOT NULL,
    titre character varying(100) NOT NULL,
    ep1 character varying(100),
    ep2 character varying(100),
    ep3 character varying(100)
);


ALTER TABLE public.app_specialite OWNER TO postgres;

--
-- Name: app_specialite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_specialite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_specialite_id_seq OWNER TO postgres;

--
-- Name: app_specialite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_specialite_id_seq OWNED BY public.app_specialite.id;


--
-- Name: app_sujetthese; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_sujetthese (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    description text NOT NULL,
    enseignant_id integer NOT NULL
);


ALTER TABLE public.app_sujetthese OWNER TO postgres;

--
-- Name: app_sujetthese_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_sujetthese_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_sujetthese_id_seq OWNER TO postgres;

--
-- Name: app_sujetthese_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_sujetthese_id_seq OWNED BY public.app_sujetthese.id;


--
-- Name: app_table_inter_correction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_table_inter_correction (
    id bigint NOT NULL,
    phase character varying(100) NOT NULL,
    note integer,
    id_copie_id bigint NOT NULL,
    id_correcteur_id bigint NOT NULL
);


ALTER TABLE public.app_table_inter_correction OWNER TO postgres;

--
-- Name: app_table_inter_correction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_table_inter_correction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_table_inter_correction_id_seq OWNER TO postgres;

--
-- Name: app_table_inter_correction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_table_inter_correction_id_seq OWNED BY public.app_table_inter_correction.id;


--
-- Name: app_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_type (
    id bigint NOT NULL,
    "Type" integer NOT NULL
);


ALTER TABLE public.app_type OWNER TO postgres;

--
-- Name: app_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_type_id_seq OWNER TO postgres;

--
-- Name: app_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_type_id_seq OWNED BY public.app_type.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: app_candidat matricule; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_candidat ALTER COLUMN matricule SET DEFAULT nextval('public.app_candidat_matricule_seq'::regclass);


--
-- Name: app_copie id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_copie ALTER COLUMN id SET DEFAULT nextval('public.app_copie_id_seq'::regclass);


--
-- Name: app_correcteur id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_correcteur ALTER COLUMN id SET DEFAULT nextval('public.app_correcteur_id_seq'::regclass);


--
-- Name: app_corrigestype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_corrigestype ALTER COLUMN id SET DEFAULT nextval('public.app_corrigestype_id_seq'::regclass);


--
-- Name: app_epreuve id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_epreuve ALTER COLUMN id SET DEFAULT nextval('public.app_epreuve_id_seq'::regclass);


--
-- Name: app_fichiers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_fichiers ALTER COLUMN id SET DEFAULT nextval('public.app_fichiers_id_seq'::regclass);


--
-- Name: app_listcandidats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_listcandidats ALTER COLUMN id SET DEFAULT nextval('public.app_listcandidats_id_seq'::regclass);


--
-- Name: app_resultat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_resultat ALTER COLUMN id SET DEFAULT nextval('public.app_resultat_id_seq'::regclass);


--
-- Name: app_resultat_module id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_resultat_module ALTER COLUMN id SET DEFAULT nextval('public.app_resultat_module_id_seq'::regclass);


--
-- Name: app_specialite id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_specialite ALTER COLUMN id SET DEFAULT nextval('public.app_specialite_id_seq'::regclass);


--
-- Name: app_sujetthese id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_sujetthese ALTER COLUMN id SET DEFAULT nextval('public.app_sujetthese_id_seq'::regclass);


--
-- Name: app_table_inter_correction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_table_inter_correction ALTER COLUMN id SET DEFAULT nextval('public.app_table_inter_correction_id_seq'::regclass);


--
-- Name: app_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_type ALTER COLUMN id SET DEFAULT nextval('public.app_type_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: app_candidat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_candidat (matricule, nom, prenom, "NumeroTable", "dateNaiss", exclu, salle, specialite_id) FROM stdin;
\.


--
-- Data for Name: app_copie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_copie (id, code, note, subi3eme, idepreuve_id, matricule_id) FROM stdin;
\.


--
-- Data for Name: app_correcteur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_correcteur (id, epreuve) FROM stdin;
\.


--
-- Data for Name: app_corrigestype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_corrigestype (id, "nomFichier", "Epreuve") FROM stdin;
\.


--
-- Data for Name: app_epreuve; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_epreuve (id, titre, coeff) FROM stdin;
1	RES	3
2	SYS	3
3	OPTIM	2
4	ANAD	2
5	BDD	3
6	SINF	3
\.


--
-- Data for Name: app_fichiers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_fichiers (id, filename, type) FROM stdin;
\.


--
-- Data for Name: app_listcandidats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_listcandidats (id, "nomFichier", "idSpecialite_id") FROM stdin;
\.


--
-- Data for Name: app_resultat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_resultat (id, resul, matricule_id) FROM stdin;
\.


--
-- Data for Name: app_resultat_module; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_resultat_module (id, ep, moy_note, matricule_id) FROM stdin;
\.


--
-- Data for Name: app_specialite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_specialite (id, titre, ep1, ep2, ep3) FROM stdin;
1	SIQ\n	SYS	RES	OPTIM\n
2	SIT	ANAD	BDD	SINF
\.


--
-- Data for Name: app_sujetthese; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_sujetthese (id, title, description, enseignant_id) FROM stdin;
\.


--
-- Data for Name: app_table_inter_correction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_table_inter_correction (id, phase, note, id_copie_id, id_correcteur_id) FROM stdin;
\.


--
-- Data for Name: app_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_type (id, "Type") FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add sujet these	7	add_sujetthese
26	Can change sujet these	7	change_sujetthese
27	Can delete sujet these	7	delete_sujetthese
28	Can view sujet these	7	view_sujetthese
29	Can add type	8	add_type
30	Can change type	8	change_type
31	Can delete type	8	delete_type
32	Can view type	8	view_type
33	Can add candidat	9	add_candidat
34	Can change candidat	9	change_candidat
35	Can delete candidat	9	delete_candidat
36	Can view candidat	9	view_candidat
37	Can add correcteur	10	add_correcteur
38	Can change correcteur	10	change_correcteur
39	Can delete correcteur	10	delete_correcteur
40	Can view correcteur	10	view_correcteur
41	Can add epreuve	11	add_epreuve
42	Can change epreuve	11	change_epreuve
43	Can delete epreuve	11	delete_epreuve
44	Can view epreuve	11	view_epreuve
45	Can add specialite	12	add_specialite
46	Can change specialite	12	change_specialite
47	Can delete specialite	12	delete_specialite
48	Can view specialite	12	view_specialite
49	Can add list candidats	13	add_listcandidats
50	Can change list candidats	13	change_listcandidats
51	Can delete list candidats	13	delete_listcandidats
52	Can view list candidats	13	view_listcandidats
53	Can add corriges type	14	add_corrigestype
54	Can change corriges type	14	change_corrigestype
55	Can delete corriges type	14	delete_corrigestype
56	Can view corriges type	14	view_corrigestype
57	Can add copie	15	add_copie
58	Can change copie	15	change_copie
59	Can delete copie	15	delete_copie
60	Can view copie	15	view_copie
61	Can add fichiers	16	add_fichiers
62	Can change fichiers	16	change_fichiers
63	Can delete fichiers	16	delete_fichiers
64	Can view fichiers	16	view_fichiers
65	Can add table_inter_correction	17	add_table_inter_correction
66	Can change table_inter_correction	17	change_table_inter_correction
67	Can delete table_inter_correction	17	delete_table_inter_correction
68	Can view table_inter_correction	17	view_table_inter_correction
69	Can add resultat_module	18	add_resultat_module
70	Can change resultat_module	18	change_resultat_module
71	Can delete resultat_module	18	delete_resultat_module
72	Can view resultat_module	18	view_resultat_module
73	Can add resultat	19	add_resultat
74	Can change resultat	19	change_resultat
75	Can delete resultat	19	delete_resultat
76	Can view resultat	19	view_resultat
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	app	sujetthese
8	app	type
9	app	candidat
10	app	correcteur
11	app	epreuve
12	app	specialite
13	app	listcandidats
14	app	corrigestype
15	app	copie
16	app	fichiers
17	app	table_inter_correction
18	app	resultat_module
19	app	resultat
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-06-30 22:15:46.790054+00
2	auth	0001_initial	2021-06-30 22:15:47.887708+00
3	admin	0001_initial	2021-06-30 22:15:48.18149+00
4	admin	0002_logentry_remove_auto_add	2021-06-30 22:15:48.319857+00
5	admin	0003_logentry_add_action_flag_choices	2021-06-30 22:15:48.397065+00
6	app	0001_initial	2021-06-30 22:15:48.766028+00
7	app	0002_userlaureat	2021-06-30 22:15:48.895554+00
8	app	0003_type	2021-06-30 22:15:48.946685+00
9	app	0004_candidat_copie_correcteur_epreuve	2021-06-30 22:15:49.412429+00
10	app	0005_auto_20210615_0140	2021-06-30 22:15:50.219216+00
11	app	0006_auto_20210615_2145	2021-06-30 22:15:50.301132+00
12	app	0007_auto_20210615_2214	2021-06-30 22:15:51.028873+00
13	app	0008_alter_candidat_specialite	2021-06-30 22:15:51.244164+00
14	app	0009_auto_20210616_0118	2021-06-30 22:15:51.322541+00
15	app	0010_alter_corrigestype_idepreuve	2021-06-30 22:15:51.434482+00
16	app	0011_rename_idepreuve_corrigestype_epreuve	2021-06-30 22:15:51.46034+00
17	app	0012_auto_20210616_2056	2021-06-30 22:15:51.545575+00
18	app	0013_remove_copie_isvalidated	2021-06-30 22:15:51.58668+00
19	app	0014_alter_copie_note	2021-06-30 22:15:51.637822+00
20	app	0015_alter_copie_subi3eme	2021-06-30 22:15:51.677929+00
21	app	0013_fichiers	2021-06-30 22:15:51.780263+00
22	app	0016_merge_0013_fichiers_0015_alter_copie_subi3eme	2021-06-30 22:15:51.79731+00
23	app	0017_auto_20210618_1652	2021-06-30 22:15:52.087689+00
24	app	0018_resultat_resultat_module	2021-06-30 22:15:52.407214+00
25	app	0019_alter_resultat_module_moy_note	2021-06-30 22:15:52.551857+00
26	app	0020_auto_20210630_2315	2021-06-30 22:15:52.67213+00
27	contenttypes	0002_remove_content_type_name	2021-06-30 22:15:52.817252+00
28	auth	0002_alter_permission_name_max_length	2021-06-30 22:15:52.878222+00
29	auth	0003_alter_user_email_max_length	2021-06-30 22:15:52.961449+00
30	auth	0004_alter_user_username_opts	2021-06-30 22:15:53.046672+00
31	auth	0005_alter_user_last_login_null	2021-06-30 22:15:53.165989+00
32	auth	0006_require_contenttypes_0002	2021-06-30 22:15:53.184058+00
33	auth	0007_alter_validators_add_error_messages	2021-06-30 22:15:53.270268+00
34	auth	0008_alter_user_username_max_length	2021-06-30 22:15:53.415661+00
35	auth	0009_alter_user_last_name_max_length	2021-06-30 22:15:53.47914+00
36	auth	0010_alter_group_name_max_length	2021-06-30 22:15:53.571388+00
37	auth	0011_update_proxy_permissions	2021-06-30 22:15:53.703739+00
38	auth	0012_alter_user_first_name_max_length	2021-06-30 22:15:53.776941+00
39	sessions	0001_initial	2021-06-30 22:15:53.985495+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Name: app_candidat_matricule_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_candidat_matricule_seq', 1, false);


--
-- Name: app_copie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_copie_id_seq', 1, false);


--
-- Name: app_correcteur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_correcteur_id_seq', 1, false);


--
-- Name: app_corrigestype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_corrigestype_id_seq', 1, false);


--
-- Name: app_epreuve_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_epreuve_id_seq', 1, false);


--
-- Name: app_fichiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_fichiers_id_seq', 1, false);


--
-- Name: app_listcandidats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_listcandidats_id_seq', 1, false);


--
-- Name: app_resultat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_resultat_id_seq', 1, false);


--
-- Name: app_resultat_module_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_resultat_module_id_seq', 1, false);


--
-- Name: app_specialite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_specialite_id_seq', 1, false);


--
-- Name: app_sujetthese_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_sujetthese_id_seq', 1, false);


--
-- Name: app_table_inter_correction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_table_inter_correction_id_seq', 1, false);


--
-- Name: app_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_type_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 76, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 19, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 39, true);


--
-- Name: app_candidat app_candidat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_candidat
    ADD CONSTRAINT app_candidat_pkey PRIMARY KEY (matricule);


--
-- Name: app_copie app_copie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_copie
    ADD CONSTRAINT app_copie_pkey PRIMARY KEY (id);


--
-- Name: app_correcteur app_correcteur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_correcteur
    ADD CONSTRAINT app_correcteur_pkey PRIMARY KEY (id);


--
-- Name: app_corrigestype app_corrigestype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_corrigestype
    ADD CONSTRAINT app_corrigestype_pkey PRIMARY KEY (id);


--
-- Name: app_epreuve app_epreuve_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_epreuve
    ADD CONSTRAINT app_epreuve_pkey PRIMARY KEY (id);


--
-- Name: app_fichiers app_fichiers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_fichiers
    ADD CONSTRAINT app_fichiers_pkey PRIMARY KEY (id);


--
-- Name: app_listcandidats app_listcandidats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_listcandidats
    ADD CONSTRAINT app_listcandidats_pkey PRIMARY KEY (id);


--
-- Name: app_resultat_module app_resultat_module_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_resultat_module
    ADD CONSTRAINT app_resultat_module_pkey PRIMARY KEY (id);


--
-- Name: app_resultat app_resultat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_resultat
    ADD CONSTRAINT app_resultat_pkey PRIMARY KEY (id);


--
-- Name: app_specialite app_specialite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_specialite
    ADD CONSTRAINT app_specialite_pkey PRIMARY KEY (id);


--
-- Name: app_sujetthese app_sujetthese_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_sujetthese
    ADD CONSTRAINT app_sujetthese_pkey PRIMARY KEY (id);


--
-- Name: app_table_inter_correction app_table_inter_correction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_table_inter_correction
    ADD CONSTRAINT app_table_inter_correction_pkey PRIMARY KEY (id);


--
-- Name: app_type app_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_type
    ADD CONSTRAINT app_type_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: app_candidat_specialite_id_eaa8caed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_candidat_specialite_id_eaa8caed ON public.app_candidat USING btree (specialite_id);


--
-- Name: app_copie_idepreuve_id_d1870d87; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_copie_idepreuve_id_d1870d87 ON public.app_copie USING btree (idepreuve_id);


--
-- Name: app_copie_matricule_id_abe94ed7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_copie_matricule_id_abe94ed7 ON public.app_copie USING btree (matricule_id);


--
-- Name: app_listcandidats_idSpecialite_id_5a4a2e4a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "app_listcandidats_idSpecialite_id_5a4a2e4a" ON public.app_listcandidats USING btree ("idSpecialite_id");


--
-- Name: app_resultat_matricule_id_6346ec3f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_resultat_matricule_id_6346ec3f ON public.app_resultat USING btree (matricule_id);


--
-- Name: app_resultat_module_matricule_id_2e882046; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_resultat_module_matricule_id_2e882046 ON public.app_resultat_module USING btree (matricule_id);


--
-- Name: app_sujetthese_enseignant_id_f6ad754a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_sujetthese_enseignant_id_f6ad754a ON public.app_sujetthese USING btree (enseignant_id);


--
-- Name: app_table_inter_correction_id_copie_id_61c7f8de; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_table_inter_correction_id_copie_id_61c7f8de ON public.app_table_inter_correction USING btree (id_copie_id);


--
-- Name: app_table_inter_correction_id_correcteur_id_c6f814d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_table_inter_correction_id_correcteur_id_c6f814d7 ON public.app_table_inter_correction USING btree (id_correcteur_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: app_candidat app_candidat_specialite_id_eaa8caed_fk_app_specialite_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_candidat
    ADD CONSTRAINT app_candidat_specialite_id_eaa8caed_fk_app_specialite_id FOREIGN KEY (specialite_id) REFERENCES public.app_specialite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_copie app_copie_idepreuve_id_d1870d87_fk_app_epreuve_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_copie
    ADD CONSTRAINT app_copie_idepreuve_id_d1870d87_fk_app_epreuve_id FOREIGN KEY (idepreuve_id) REFERENCES public.app_epreuve(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_copie app_copie_matricule_id_abe94ed7_fk_app_candidat_matricule; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_copie
    ADD CONSTRAINT app_copie_matricule_id_abe94ed7_fk_app_candidat_matricule FOREIGN KEY (matricule_id) REFERENCES public.app_candidat(matricule) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_listcandidats app_listcandidats_idSpecialite_id_5a4a2e4a_fk_app_specialite_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_listcandidats
    ADD CONSTRAINT "app_listcandidats_idSpecialite_id_5a4a2e4a_fk_app_specialite_id" FOREIGN KEY ("idSpecialite_id") REFERENCES public.app_specialite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_resultat app_resultat_matricule_id_6346ec3f_fk_app_candidat_matricule; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_resultat
    ADD CONSTRAINT app_resultat_matricule_id_6346ec3f_fk_app_candidat_matricule FOREIGN KEY (matricule_id) REFERENCES public.app_candidat(matricule) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_resultat_module app_resultat_module_matricule_id_2e882046_fk_app_candi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_resultat_module
    ADD CONSTRAINT app_resultat_module_matricule_id_2e882046_fk_app_candi FOREIGN KEY (matricule_id) REFERENCES public.app_candidat(matricule) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_sujetthese app_sujetthese_enseignant_id_f6ad754a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_sujetthese
    ADD CONSTRAINT app_sujetthese_enseignant_id_f6ad754a_fk_auth_user_id FOREIGN KEY (enseignant_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_table_inter_correction app_table_inter_corr_id_correcteur_id_c6f814d7_fk_app_corre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_table_inter_correction
    ADD CONSTRAINT app_table_inter_corr_id_correcteur_id_c6f814d7_fk_app_corre FOREIGN KEY (id_correcteur_id) REFERENCES public.app_correcteur(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_table_inter_correction app_table_inter_correction_id_copie_id_61c7f8de_fk_app_copie_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_table_inter_correction
    ADD CONSTRAINT app_table_inter_correction_id_copie_id_61c7f8de_fk_app_copie_id FOREIGN KEY (id_copie_id) REFERENCES public.app_copie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

