--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: app_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE app_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_seq OWNER TO apollo;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: App; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "App" (
    "Id" integer DEFAULT nextval('app_seq'::regclass) NOT NULL,
    "AppId" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "Name" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "OrgId" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "OrgName" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "OwnerName" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "OwnerEmail" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "IsDeleted" integer DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now()
);


ALTER TABLE public."App" OWNER TO apollo;

--
-- Name: app_name_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE app_name_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_name_seq OWNER TO apollo;

--
-- Name: AppNamespace; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "AppNamespace" (
    "Id" integer DEFAULT nextval('app_name_seq'::regclass) NOT NULL,
    "Name" character varying(32) DEFAULT ''::character varying NOT NULL,
    "AppId" character varying(32) DEFAULT ''::character varying NOT NULL,
    "Format" character varying(32) DEFAULT 'properties'::character varying NOT NULL,
    "Comment" character varying(64) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" integer default 0,
    "IsPublic" integer default 0
);


ALTER TABLE public."AppNamespace" OWNER TO apollo;

--
-- Name: authorities_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE authorities_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authorities_seq OWNER TO apollo;

--
-- Name: Authorities; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "Authorities" (
    "Id" integer DEFAULT nextval('authorities_seq'::regclass) NOT NULL,
    "Username" character varying(50) NOT NULL,
    "Authority" character varying(50) NOT NULL
);


ALTER TABLE public."Authorities" OWNER TO apollo;

--
-- Name: consumer_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE consumer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consumer_seq OWNER TO apollo;

--
-- Name: Consumer; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "Consumer" (
    "Id" integer DEFAULT nextval('consumer_seq'::regclass) NOT NULL,
    "AppId" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "Name" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "OrgId" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "OrgName" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "OwnerName" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "OwnerEmail" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" character varying default 0
);


ALTER TABLE public."Consumer" OWNER TO apollo;

--
-- Name: consumer_audit_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE consumer_audit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consumer_audit_seq OWNER TO apollo;

--
-- Name: ConsumerAudit; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "ConsumerAudit" (
    "Id" integer DEFAULT nextval('consumer_audit_seq'::regclass) NOT NULL,
    "ConsumerId" integer,
    "Uri" character varying(1024) DEFAULT ''::character varying NOT NULL,
    "Method" character varying(16) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastTime" timestamp without time zone default now()
);


ALTER TABLE public."ConsumerAudit" OWNER TO apollo;

--
-- Name: consumer_role_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE consumer_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consumer_role_seq OWNER TO apollo;

--
-- Name: ConsumerRole; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "ConsumerRole" (
    "Id" integer DEFAULT nextval('consumer_role_seq'::regclass) NOT NULL,
    "ConsumerId" integer,
    "RoleId" integer,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" character varying default 0
);


ALTER TABLE public."ConsumerRole" OWNER TO apollo;

--
-- Name: consumer_token_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE consumer_token_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consumer_token_seq OWNER TO apollo;

--
-- Name: ConsumerToken; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "ConsumerToken" (
    "Id" integer DEFAULT nextval('consumer_token_seq'::regclass) NOT NULL,
    "ConsumerId" integer,
    "Token" character varying(128) DEFAULT ''::character varying NOT NULL,
    "Expires" timestamp without time zone DEFAULT '2099-01-01 00:00:00'::timestamp without time zone NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" character varying default 0
);


ALTER TABLE public."ConsumerToken" OWNER TO apollo;

--
-- Name: favorite_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE favorite_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorite_seq OWNER TO apollo;

--
-- Name: Favorite; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "Favorite" (
    "Id" integer DEFAULT nextval('favorite_seq'::regclass) NOT NULL,
    "UserId" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "AppId" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "Position" bigint DEFAULT 10000::bigint NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" character varying default 0
);


ALTER TABLE public."Favorite" OWNER TO apollo;

--
-- Name: permission_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE permission_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_seq OWNER TO apollo;

--
-- Name: Permission; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "Permission" (
    "Id" integer DEFAULT nextval('permission_seq'::regclass) NOT NULL,
    "PermissionType" character varying(32) DEFAULT ''::character varying NOT NULL,
    "TargetId" character varying(256) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" character varying default 0
);


ALTER TABLE public."Permission" OWNER TO apollo;

--
-- Name: role_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_seq OWNER TO apollo;

--
-- Name: Role; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "Role" (
    "Id" integer DEFAULT nextval('role_seq'::regclass) NOT NULL,
    "RoleName" character varying(256) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" character varying default 0
);


ALTER TABLE public."Role" OWNER TO apollo;

--
-- Name: role_permission_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE role_permission_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_permission_seq OWNER TO apollo;

--
-- Name: RolePermission; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "RolePermission" (
    "Id" integer DEFAULT nextval('role_permission_seq'::regclass) NOT NULL,
    "RoleId" integer,
    "PermissionId" integer,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" character varying default 0
);


ALTER TABLE public."RolePermission" OWNER TO apollo;

--
-- Name: server_config_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE server_config_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.server_config_seq OWNER TO apollo;

--
-- Name: ServerConfig; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "ServerConfig" (
    "Id" integer DEFAULT nextval('server_config_seq'::regclass) NOT NULL,
    "Key" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Value" character varying(2048) DEFAULT 'default'::character varying NOT NULL,
    "Comment" character varying(1024) DEFAULT ''::character varying,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" character varying default 0
);


ALTER TABLE public."ServerConfig" OWNER TO apollo;

--
-- Name: user_role_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE user_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_role_seq OWNER TO apollo;

--
-- Name: UserRole; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "UserRole" (
    "Id" integer DEFAULT nextval('user_role_seq'::regclass) NOT NULL,
    "UserId" character varying(128) DEFAULT ''::character varying,
    "RoleId" integer,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" character varying default 0
);


ALTER TABLE public."UserRole" OWNER TO apollo;

--
-- Name: users_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE users_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_seq OWNER TO apollo;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "Users" (
    "Id" integer DEFAULT nextval('users_seq'::regclass) NOT NULL,
    "Username" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Password" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Email" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Enabled" integer default 1
);


ALTER TABLE public."Users" OWNER TO apollo;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO apollo;


-- Config

INSERT INTO "ServerConfig" ("Key", "Value", "Comment")
VALUES
    ('apollo.portal.envs', 'dev', '可支持的环境列表'),
    ('organizations', '[{"orgId":"TEST1","orgName":"样例部门1"},{"orgId":"TEST2","orgName":"样例部门2"}]', '部门列表'),
    ('superAdmin', 'apollo', 'Portal超级管理员'),
    ('api.readTimeout', '10000', 'http接口read timeout'),
    ('consumer.token.salt', 'someSalt', 'consumer token salt'),
    ('admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace'),
    ('configView.memberOnly.envs', 'dev', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔');

INSERT INTO "Users" ("Username", "Password", "Email", "Enabled")
VALUES
    ('apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo@acme.com', 1);

INSERT INTO "Authorities" ("Username", "Authority") VALUES ('apollo', 'ROLE_user');

-- Sample Data

INSERT INTO "App" ("AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail")
VALUES
    ('SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com');

INSERT INTO "AppNamespace" ("Name", "AppId", "Format", "IsPublic", "Comment")
VALUES
    ('application', 'SampleApp', 'properties', 0, 'default app namespace');

INSERT INTO "Permission" ("Id", "PermissionType", "TargetId")
VALUES
    (1, 'CreateCluster', 'SampleApp'),
    (2, 'CreateNamespace', 'SampleApp'),
    (3, 'AssignRole', 'SampleApp'),
    (4, 'ModifyNamespace', 'SampleApp+application'),
    (5, 'ReleaseNamespace', 'SampleApp+application');

INSERT INTO "Role" ("Id", "RoleName")
VALUES
    (1, 'Master+SampleApp'),
    (2, 'ModifyNamespace+SampleApp+application'),
    (3, 'ReleaseNamespace+SampleApp+application');

INSERT INTO "RolePermission" ("RoleId", "PermissionId")
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (3, 5);

INSERT INTO "UserRole" ("UserId", "RoleId")
VALUES
    ('apollo', 1),
    ('apollo', 2),
    ('apollo', 3);