--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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


ALTER TABLE app_seq OWNER TO apollo;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: App; Type: TABLE; Schema: public; Owner: apollo
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
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now()
);


ALTER TABLE "App" OWNER TO apollo;

--
-- Name: app_name_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE app_name_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_name_seq OWNER TO apollo;

--
-- Name: AppNamespace; Type: TABLE; Schema: public; Owner: apollo
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
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" integer DEFAULT 0,
    "IsPublic" integer DEFAULT 0
);


ALTER TABLE "AppNamespace" OWNER TO apollo;

--
-- Name: authorities_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE authorities_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authorities_seq OWNER TO apollo;

--
-- Name: Authorities; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "Authorities" (
    "Id" integer DEFAULT nextval('authorities_seq'::regclass) NOT NULL,
    "Username" character varying(50) NOT NULL,
    "Authority" character varying(50) NOT NULL
);


ALTER TABLE "Authorities" OWNER TO apollo;

--
-- Name: consumer_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE consumer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consumer_seq OWNER TO apollo;

--
-- Name: Consumer; Type: TABLE; Schema: public; Owner: apollo
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
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" character varying DEFAULT 0
);


ALTER TABLE "Consumer" OWNER TO apollo;

--
-- Name: consumer_audit_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE consumer_audit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consumer_audit_seq OWNER TO apollo;

--
-- Name: ConsumerAudit; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "ConsumerAudit" (
    "Id" serial NOT NULL,
    "ConsumerId" integer,
    "Uri" character varying(1024) DEFAULT ''::character varying NOT NULL,
    "Method" character varying(16) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastTime" timestamp without time zone DEFAULT now()
);


ALTER TABLE "ConsumerAudit" OWNER TO apollo;

--
-- Name: consumer_role_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE consumer_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consumer_role_seq OWNER TO apollo;

--
-- Name: ConsumerRole; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "ConsumerRole" (
    "Id" integer DEFAULT nextval('consumer_role_seq'::regclass) NOT NULL,
    "ConsumerId" integer,
    "RoleId" integer,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" character varying DEFAULT 0
);


ALTER TABLE "ConsumerRole" OWNER TO apollo;

--
-- Name: consumer_token_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE consumer_token_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consumer_token_seq OWNER TO apollo;

--
-- Name: ConsumerToken; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "ConsumerToken" (
    "Id" integer DEFAULT nextval('consumer_token_seq'::regclass) NOT NULL,
    "ConsumerId" integer,
    "Token" character varying(128) DEFAULT ''::character varying NOT NULL,
    "Expires" timestamp without time zone DEFAULT '2099-01-01 00:00:00'::timestamp without time zone NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" character varying DEFAULT 0
);


ALTER TABLE "ConsumerToken" OWNER TO apollo;

--
-- Name: favorite_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE favorite_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE favorite_seq OWNER TO apollo;

--
-- Name: Favorite; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "Favorite" (
    "Id" integer DEFAULT nextval('favorite_seq'::regclass) NOT NULL,
    "UserId" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "AppId" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "Position" bigint DEFAULT (10000)::bigint NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" character varying DEFAULT 0
);


ALTER TABLE "Favorite" OWNER TO apollo;

--
-- Name: permission_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE permission_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permission_seq OWNER TO apollo;

--
-- Name: Permission; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "Permission" (
    "Id" integer DEFAULT nextval('permission_seq'::regclass) NOT NULL,
    "PermissionType" character varying(32) DEFAULT ''::character varying NOT NULL,
    "TargetId" character varying(256) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" character varying DEFAULT 0
);


ALTER TABLE "Permission" OWNER TO apollo;

--
-- Name: role_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_seq OWNER TO apollo;

--
-- Name: Role; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "Role" (
    "Id" integer DEFAULT nextval('role_seq'::regclass) NOT NULL,
    "RoleName" character varying(256) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" character varying DEFAULT 0
);


ALTER TABLE "Role" OWNER TO apollo;

--
-- Name: role_permission_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE role_permission_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_permission_seq OWNER TO apollo;

--
-- Name: RolePermission; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "RolePermission" (
    "Id" integer DEFAULT nextval('role_permission_seq'::regclass) NOT NULL,
    "RoleId" integer,
    "PermissionId" integer,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" character varying DEFAULT 0
);


ALTER TABLE "RolePermission" OWNER TO apollo;

--
-- Name: server_config_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE server_config_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE server_config_seq OWNER TO apollo;

--
-- Name: ServerConfig; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "ServerConfig" (
    "Id" integer DEFAULT nextval('server_config_seq'::regclass) NOT NULL,
    "Key" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Value" character varying(2048) DEFAULT 'default'::character varying NOT NULL,
    "Comment" character varying(1024) DEFAULT ''::character varying,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" character varying DEFAULT 0
);


ALTER TABLE "ServerConfig" OWNER TO apollo;

--
-- Name: user_role_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE user_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_role_seq OWNER TO apollo;

--
-- Name: UserRole; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "UserRole" (
    "Id" integer DEFAULT nextval('user_role_seq'::regclass) NOT NULL,
    "UserId" character varying(128) DEFAULT ''::character varying,
    "RoleId" integer,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" character varying DEFAULT 0
);


ALTER TABLE "UserRole" OWNER TO apollo;

--
-- Name: users_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE users_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_seq OWNER TO apollo;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "Users" (
    "Id" integer DEFAULT nextval('users_seq'::regclass) NOT NULL,
    "Username" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Password" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Email" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Enabled" integer DEFAULT 1
);


ALTER TABLE "Users" OWNER TO apollo;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO apollo;

--
-- Data for Name: App; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "App" ("Id", "AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail", "IsDeleted", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") VALUES (1, 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', 0, NULL, '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797');
INSERT INTO "App" ("Id", "AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail", "IsDeleted", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") VALUES (2, 'greenhouse-sms', 'greenhouse-sms', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', 0, 'apollo', '2019-06-27 14:56:30.32', 'apollo', '2019-06-27 14:56:30.32');
INSERT INTO "App" ("Id", "AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail", "IsDeleted", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") VALUES (25, 'greenhouse-sha', 'greenhouse-sha', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', 0, 'apollo', '2019-06-27 14:57:57.955', 'apollo', '2019-06-27 14:57:57.955');


--
-- Data for Name: AppNamespace; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "AppNamespace" ("Id", "Name", "AppId", "Format", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted", "IsPublic") VALUES (1, 'application', 'SampleApp', 'properties', 'default app namespace', '', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', 0, 0);
INSERT INTO "AppNamespace" ("Id", "Name", "AppId", "Format", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted", "IsPublic") VALUES (2, 'application', 'greenhouse-sms', 'properties', 'default app namespace', 'apollo', '2019-06-27 14:56:30.369', 'apollo', '2019-06-27 14:56:30.369', 0, 0);
INSERT INTO "AppNamespace" ("Id", "Name", "AppId", "Format", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted", "IsPublic") VALUES (26, 'application', 'greenhouse-sha', 'properties', 'default app namespace', 'apollo', '2019-06-27 14:57:57.959', 'apollo', '2019-06-27 14:57:57.959', 0, 0);


--
-- Data for Name: Authorities; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "Authorities" ("Id", "Username", "Authority") VALUES (1, 'apollo', 'ROLE_user');


--
-- Data for Name: Consumer; Type: TABLE DATA; Schema: public; Owner: apollo
--



--
-- Data for Name: ConsumerAudit; Type: TABLE DATA; Schema: public; Owner: apollo
--



--
-- Data for Name: ConsumerRole; Type: TABLE DATA; Schema: public; Owner: apollo
--



--
-- Data for Name: ConsumerToken; Type: TABLE DATA; Schema: public; Owner: apollo
--



--
-- Data for Name: Favorite; Type: TABLE DATA; Schema: public; Owner: apollo
--



--
-- Data for Name: Permission; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (1, 'CreateCluster', 'SampleApp', '', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (2, 'CreateNamespace', 'SampleApp', '', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (3, 'AssignRole', 'SampleApp', '', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (4, 'ModifyNamespace', 'SampleApp+application', '', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (5, 'ReleaseNamespace', 'SampleApp+application', '', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (3, 'CreateCluster', 'greenhouse-sms', 'apollo', '2019-06-27 14:56:30.429', 'apollo', '2019-06-27 14:56:30.429', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (4, 'CreateNamespace', 'greenhouse-sms', 'apollo', '2019-06-27 14:56:30.432', 'apollo', '2019-06-27 14:56:30.432', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (5, 'AssignRole', 'greenhouse-sms', 'apollo', '2019-06-27 14:56:30.433', 'apollo', '2019-06-27 14:56:30.433', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (11, 'ModifyNamespace', 'greenhouse-sms+application', 'apollo', '2019-06-27 14:56:30.634', 'apollo', '2019-06-27 14:56:30.634', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (14, 'ReleaseNamespace', 'greenhouse-sms+application', 'apollo', '2019-06-27 14:56:30.66', 'apollo', '2019-06-27 14:56:30.66', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (17, 'ModifyNamespace', 'greenhouse-sms+application+DEV', 'apollo', '2019-06-27 14:56:30.684', 'apollo', '2019-06-27 14:56:30.684', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (20, 'ReleaseNamespace', 'greenhouse-sms+application+DEV', 'apollo', '2019-06-27 14:56:30.708', 'apollo', '2019-06-27 14:56:30.708', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (27, 'CreateNamespace', 'greenhouse-sha', 'apollo', '2019-06-27 14:57:57.967', 'apollo', '2019-06-27 14:57:57.967', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (28, 'AssignRole', 'greenhouse-sha', 'apollo', '2019-06-27 14:57:57.969', 'apollo', '2019-06-27 14:57:57.969', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (29, 'CreateCluster', 'greenhouse-sha', 'apollo', '2019-06-27 14:57:57.969', 'apollo', '2019-06-27 14:57:57.969', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (35, 'ModifyNamespace', 'greenhouse-sha+application', 'apollo', '2019-06-27 14:57:58.017', 'apollo', '2019-06-27 14:57:58.017', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (38, 'ReleaseNamespace', 'greenhouse-sha+application', 'apollo', '2019-06-27 14:57:58.045', 'apollo', '2019-06-27 14:57:58.045', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (41, 'ModifyNamespace', 'greenhouse-sha+application+DEV', 'apollo', '2019-06-27 14:57:58.072', 'apollo', '2019-06-27 14:57:58.072', '0');
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (44, 'ReleaseNamespace', 'greenhouse-sha+application+DEV', 'apollo', '2019-06-27 14:57:58.097', 'apollo', '2019-06-27 14:57:58.097', '0');


--
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (1, 'Master+SampleApp', 'default', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (2, 'ModifyNamespace+SampleApp+application', 'default', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (3, 'ReleaseNamespace+SampleApp+application', 'default', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (6, 'Master+greenhouse-sms', 'apollo', '2019-06-27 14:56:30.45', 'apollo', '2019-06-27 14:56:30.45', '0');
INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (12, 'ModifyNamespace+greenhouse-sms+application', 'apollo', '2019-06-27 14:56:30.64', 'apollo', '2019-06-27 14:56:30.64', '0');
INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (15, 'ReleaseNamespace+greenhouse-sms+application', 'apollo', '2019-06-27 14:56:30.665', 'apollo', '2019-06-27 14:56:30.665', '0');
INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (18, 'ModifyNamespace+greenhouse-sms+application+DEV', 'apollo', '2019-06-27 14:56:30.692', 'apollo', '2019-06-27 14:56:30.692', '0');
INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (21, 'ReleaseNamespace+greenhouse-sms+application+DEV', 'apollo', '2019-06-27 14:56:30.712', 'apollo', '2019-06-27 14:56:30.712', '0');
INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (30, 'Master+greenhouse-sha', 'apollo', '2019-06-27 14:57:57.973', 'apollo', '2019-06-27 14:57:57.973', '0');
INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (36, 'ModifyNamespace+greenhouse-sha+application', 'apollo', '2019-06-27 14:57:58.021', 'apollo', '2019-06-27 14:57:58.021', '0');
INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (39, 'ReleaseNamespace+greenhouse-sha+application', 'apollo', '2019-06-27 14:57:58.048', 'apollo', '2019-06-27 14:57:58.048', '0');
INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (42, 'ModifyNamespace+greenhouse-sha+application+DEV', 'apollo', '2019-06-27 14:57:58.075', 'apollo', '2019-06-27 14:57:58.075', '0');
INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (45, 'ReleaseNamespace+greenhouse-sha+application+DEV', 'apollo', '2019-06-27 14:57:58.102', 'apollo', '2019-06-27 14:57:58.102', '0');


--
-- Data for Name: RolePermission; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (1, 1, 1, '', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (2, 1, 2, '', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (3, 1, 3, '', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (4, 2, 4, '', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (5, 3, 5, '', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (7, 6, 3, 'apollo', '2019-06-27 14:56:30.458', 'apollo', '2019-06-27 14:56:30.458', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (8, 6, 4, 'apollo', '2019-06-27 14:56:30.461', 'apollo', '2019-06-27 14:56:30.461', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (9, 6, 5, 'apollo', '2019-06-27 14:56:30.462', 'apollo', '2019-06-27 14:56:30.462', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (13, 12, 11, 'apollo', '2019-06-27 14:56:30.641', 'apollo', '2019-06-27 14:56:30.641', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (16, 15, 14, 'apollo', '2019-06-27 14:56:30.666', 'apollo', '2019-06-27 14:56:30.666', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (19, 18, 17, 'apollo', '2019-06-27 14:56:30.693', 'apollo', '2019-06-27 14:56:30.693', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (22, 21, 20, 'apollo', '2019-06-27 14:56:30.713', 'apollo', '2019-06-27 14:56:30.713', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (31, 30, 27, 'apollo', '2019-06-27 14:57:57.974', 'apollo', '2019-06-27 14:57:57.974', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (32, 30, 28, 'apollo', '2019-06-27 14:57:57.975', 'apollo', '2019-06-27 14:57:57.975', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (33, 30, 29, 'apollo', '2019-06-27 14:57:57.978', 'apollo', '2019-06-27 14:57:57.978', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (37, 36, 35, 'apollo', '2019-06-27 14:57:58.022', 'apollo', '2019-06-27 14:57:58.022', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (40, 39, 38, 'apollo', '2019-06-27 14:57:58.05', 'apollo', '2019-06-27 14:57:58.05', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (43, 42, 41, 'apollo', '2019-06-27 14:57:58.076', 'apollo', '2019-06-27 14:57:58.076', '0');
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (46, 45, 44, 'apollo', '2019-06-27 14:57:58.104', 'apollo', '2019-06-27 14:57:58.104', '0');


--
-- Data for Name: ServerConfig; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "ServerConfig" ("Id", "Key", "Value", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (1, 'apollo.portal.envs', 'dev', '可支持的环境列表', 'default', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "ServerConfig" ("Id", "Key", "Value", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (2, 'organizations', '[{"orgId":"TEST1","orgName":"样例部门1"},{"orgId":"TEST2","orgName":"样例部门2"}]', '部门列表', 'default', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "ServerConfig" ("Id", "Key", "Value", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (3, 'superAdmin', 'apollo', 'Portal超级管理员', 'default', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "ServerConfig" ("Id", "Key", "Value", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (4, 'api.readTimeout', '10000', 'http接口read timeout', 'default', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "ServerConfig" ("Id", "Key", "Value", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (5, 'consumer.token.salt', 'someSalt', 'consumer token salt', 'default', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "ServerConfig" ("Id", "Key", "Value", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (6, 'admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace', 'default', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "ServerConfig" ("Id", "Key", "Value", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (7, 'configView.memberOnly.envs', 'dev', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔', 'default', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');


--
-- Data for Name: UserRole; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "UserRole" ("Id", "UserId", "RoleId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (1, 'apollo', 1, '', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "UserRole" ("Id", "UserId", "RoleId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (2, 'apollo', 2, '', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "UserRole" ("Id", "UserId", "RoleId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (3, 'apollo', 3, '', '2019-06-27 14:53:06.148797', '', '2019-06-27 14:53:06.148797', '0');
INSERT INTO "UserRole" ("Id", "UserId", "RoleId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (10, 'apollo', 6, 'apollo', '2019-06-27 14:56:30.619', 'apollo', '2019-06-27 14:56:30.619', '0');
INSERT INTO "UserRole" ("Id", "UserId", "RoleId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (23, 'apollo', 12, 'apollo', '2019-06-27 14:56:30.735', 'apollo', '2019-06-27 14:56:30.735', '0');
INSERT INTO "UserRole" ("Id", "UserId", "RoleId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (24, 'apollo', 15, 'apollo', '2019-06-27 14:56:30.748', 'apollo', '2019-06-27 14:56:30.748', '0');
INSERT INTO "UserRole" ("Id", "UserId", "RoleId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (34, 'apollo', 30, 'apollo', '2019-06-27 14:57:58.011', 'apollo', '2019-06-27 14:57:58.011', '0');
INSERT INTO "UserRole" ("Id", "UserId", "RoleId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (47, 'apollo', 36, 'apollo', '2019-06-27 14:57:58.118', 'apollo', '2019-06-27 14:57:58.118', '0');
INSERT INTO "UserRole" ("Id", "UserId", "RoleId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (48, 'apollo', 39, 'apollo', '2019-06-27 14:57:58.14', 'apollo', '2019-06-27 14:57:58.14', '0');


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "Users" ("Id", "Username", "Password", "Email", "Enabled") VALUES (1, 'apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo@acme.com', 1);


--
-- Name: app_name_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('app_name_seq', 1, true);


--
-- Name: app_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('app_seq', 1, true);


--
-- Name: authorities_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('authorities_seq', 1, true);


--
-- Name: consumer_audit_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('consumer_audit_seq', 1, false);


--
-- Name: consumer_role_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('consumer_role_seq', 1, false);


--
-- Name: consumer_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('consumer_seq', 1, false);


--
-- Name: consumer_token_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('consumer_token_seq', 1, false);


--
-- Name: favorite_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('favorite_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('hibernate_sequence', 48, true);


--
-- Name: permission_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('permission_seq', 1, false);


--
-- Name: role_permission_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('role_permission_seq', 5, true);


--
-- Name: role_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('role_seq', 1, false);


--
-- Name: server_config_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('server_config_seq', 7, true);


--
-- Name: user_role_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('user_role_seq', 3, true);


--
-- Name: users_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('users_seq', 1, true);


--
-- PostgreSQL database dump complete
--

