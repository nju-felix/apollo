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
    "AppId" character varying(500),
    "Name" character varying(500),
    "OrgId" character varying(32),
    "OrgName" character varying(64),
    "OwnerName" character varying(500),
    "OwnerEmail" character varying(500),
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" integer DEFAULT 0
);


ALTER TABLE "App" OWNER TO apollo;

--
-- Name: app_namespace_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE app_namespace_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_namespace_seq OWNER TO apollo;

--
-- Name: AppNamespace; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "AppNamespace" (
    "Id" integer DEFAULT nextval('app_namespace_seq'::regclass) NOT NULL,
    "Name" character varying(32) DEFAULT ''::character varying,
    "AppId" character varying(32) DEFAULT ''::character varying,
    "Format" character varying(32) DEFAULT 'properties'::character varying,
    "IsPublic" integer DEFAULT 0,
    "Comment" character varying(64) DEFAULT ''::character varying,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" integer DEFAULT 0
);


ALTER TABLE "AppNamespace" OWNER TO apollo;

--
-- Name: App_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE "App_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "App_seq" OWNER TO apollo;

--
-- Name: Audit; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "Audit" (
    "Id" integer NOT NULL,
    "EntityName" character varying(50) NOT NULL,
    "EntityId" integer,
    "OpName" character varying(50) NOT NULL,
    "Comment" character varying(500) DEFAULT NULL::character varying,
    "DataChange_CreatedBy" character varying(32) NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" integer DEFAULT 0
);


ALTER TABLE "Audit" OWNER TO apollo;

--
-- Name: cluster_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE cluster_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cluster_seq OWNER TO apollo;

--
-- Name: Cluster; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "Cluster" (
    "Id" integer DEFAULT nextval('cluster_seq'::regclass) NOT NULL,
    "Name" character varying(32) DEFAULT ''::character varying,
    "AppId" character varying(32) DEFAULT ''::character varying,
    "ParentClusterId" integer DEFAULT 0,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" integer DEFAULT 0
);


ALTER TABLE "Cluster" OWNER TO apollo;

--
-- Name: Commit; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "Commit" (
    "Id" integer NOT NULL,
    "ChangeSets" text NOT NULL,
    "AppId" character varying(500) NOT NULL,
    "ClusterName" character varying(500) NOT NULL,
    "NamespaceName" character varying(500) NOT NULL,
    "Comment" character varying(500) DEFAULT NULL::character varying,
    "DataChange_CreatedBy" character varying(32) NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" integer DEFAULT 0
);


ALTER TABLE "Commit" OWNER TO apollo;

--
-- Name: GrayReleaseRule; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "GrayReleaseRule" (
    "Id" integer NOT NULL,
    "AppId" character varying(32) NOT NULL,
    "ClusterName" character varying(32) NOT NULL,
    "NamespaceName" character varying(32) NOT NULL,
    "BranchName" character varying(32) NOT NULL,
    "Rules" character varying(16000) DEFAULT '[]'::character varying,
    "ReleaseId" integer DEFAULT 0 NOT NULL,
    "BranchStatus" integer DEFAULT 1,
    "DataChange_CreatedBy" character varying(32) NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" integer DEFAULT 0
);


ALTER TABLE "GrayReleaseRule" OWNER TO apollo;

--
-- Name: Instance; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "Instance" (
    "Id" integer NOT NULL,
    "AppId" character varying(32) NOT NULL,
    "ClusterName" character varying(32) NOT NULL,
    "DataCenter" character varying(64) NOT NULL,
    "Ip" character varying(32) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastTime" timestamp without time zone DEFAULT now()
);


ALTER TABLE "Instance" OWNER TO apollo;

--
-- Name: InstanceConfig; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "InstanceConfig" (
    "Id" integer NOT NULL,
    "InstanceId" integer,
    "ConfigAppId" character varying(32) NOT NULL,
    "ConfigClusterName" character varying(32) NOT NULL,
    "ConfigNamespaceName" character varying(32) NOT NULL,
    "ReleaseKey" character varying(64) DEFAULT ''::character varying NOT NULL,
    "ReleaseDeliveryTime" timestamp without time zone,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastTime" timestamp without time zone DEFAULT now()
);


ALTER TABLE "InstanceConfig" OWNER TO apollo;

--
-- Name: item_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE item_seq OWNER TO apollo;

--
-- Name: Item; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "Item" (
    "Id" integer DEFAULT nextval('item_seq'::regclass) NOT NULL,
    "NamespaceId" integer DEFAULT 0,
    "Key" character varying(128),
    "Value" character varying(2048),
    "Comment" character varying(1024) DEFAULT ''::character varying,
    "LineNum" integer DEFAULT 0,
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" integer DEFAULT 0
);


ALTER TABLE "Item" OWNER TO apollo;

--
-- Name: namespace_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE namespace_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE namespace_seq OWNER TO apollo;

--
-- Name: Namespace; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "Namespace" (
    "Id" integer DEFAULT nextval('namespace_seq'::regclass) NOT NULL,
    "AppId" character varying(500),
    "ClusterName" character varying(500),
    "NamespaceName" character varying(500),
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" integer DEFAULT 0
);


ALTER TABLE "Namespace" OWNER TO apollo;

--
-- Name: NamespaceLock; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "NamespaceLock" (
    "Id" integer NOT NULL,
    "NamespaceId" integer DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(32) NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32),
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" integer DEFAULT 0
);


ALTER TABLE "NamespaceLock" OWNER TO apollo;

--
-- Name: release_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE release_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE release_seq OWNER TO apollo;

--
-- Name: Release; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "Release" (
    "Id" integer DEFAULT nextval('release_seq'::regclass) NOT NULL,
    "ReleaseKey" character varying(64) DEFAULT ''::character varying,
    "Name" character varying(64),
    "Comment" character varying(256) DEFAULT NULL::character varying,
    "AppId" character varying(500),
    "ClusterName" character varying(500),
    "NamespaceName" character varying(500),
    "Configurations" text,
    "IsAbandoned" integer DEFAULT 0,
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" integer DEFAULT 0
);


ALTER TABLE "Release" OWNER TO apollo;

--
-- Name: release_history_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE release_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE release_history_seq OWNER TO apollo;

--
-- Name: ReleaseHistory; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "ReleaseHistory" (
    "Id" integer DEFAULT nextval('release_history_seq'::regclass) NOT NULL,
    "AppId" character varying(32),
    "ClusterName" character varying(32),
    "NamespaceName" character varying(32),
    "BranchName" character varying(32),
    "ReleaseId" integer DEFAULT 0,
    "PreviousReleaseId" integer DEFAULT 0,
    "Operation" integer DEFAULT 0,
    "OperationContext" text,
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" integer DEFAULT 0
);


ALTER TABLE "ReleaseHistory" OWNER TO apollo;

--
-- Name: ReleaseMessage; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "ReleaseMessage" (
    "Id" integer NOT NULL,
    "Message" character varying(1024) DEFAULT ''::character varying NOT NULL,
    "DataChange_LastTime" timestamp without time zone DEFAULT now()
);


ALTER TABLE "ReleaseMessage" OWNER TO apollo;

--
-- Name: ReleaseMessage_Id_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE "ReleaseMessage_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ReleaseMessage_Id_seq" OWNER TO apollo;

--
-- Name: ReleaseMessage_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apollo
--

ALTER SEQUENCE "ReleaseMessage_Id_seq" OWNED BY "ReleaseMessage"."Id";


--
-- Name: service_config_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE service_config_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE service_config_seq OWNER TO apollo;

--
-- Name: ServerConfig; Type: TABLE; Schema: public; Owner: apollo
--

CREATE TABLE "ServerConfig" (
    "Id" integer DEFAULT nextval('service_config_seq'::regclass) NOT NULL,
    "Key" character varying(64),
    "Cluster" character varying(32),
    "Value" character varying(2048),
    "Comment" character varying(1024) DEFAULT ''::character varying,
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone DEFAULT now(),
    "IsDeleted" integer DEFAULT 0
);


ALTER TABLE "ServerConfig" OWNER TO apollo;

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
-- Name: ReleaseMessage Id; Type: DEFAULT; Schema: public; Owner: apollo
--

ALTER TABLE ONLY "ReleaseMessage" ALTER COLUMN "Id" SET DEFAULT nextval('"ReleaseMessage_Id_seq"'::regclass);


--
-- Name: 18034; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18034');


ALTER LARGE OBJECT 18034 OWNER TO apollo;

--
-- Name: 18035; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18035');


ALTER LARGE OBJECT 18035 OWNER TO apollo;

--
-- Name: 18036; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18036');


ALTER LARGE OBJECT 18036 OWNER TO apollo;

--
-- Name: 18037; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18037');


ALTER LARGE OBJECT 18037 OWNER TO apollo;

--
-- Name: 18038; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18038');


ALTER LARGE OBJECT 18038 OWNER TO apollo;

--
-- Name: 18039; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18039');


ALTER LARGE OBJECT 18039 OWNER TO apollo;

--
-- Name: 18047; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18047');


ALTER LARGE OBJECT 18047 OWNER TO apollo;

--
-- Name: 18048; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18048');


ALTER LARGE OBJECT 18048 OWNER TO apollo;

--
-- Name: 18049; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18049');


ALTER LARGE OBJECT 18049 OWNER TO apollo;

--
-- Name: 18050; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18050');


ALTER LARGE OBJECT 18050 OWNER TO apollo;

--
-- Name: 18051; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18051');


ALTER LARGE OBJECT 18051 OWNER TO apollo;

--
-- Name: 18052; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18052');


ALTER LARGE OBJECT 18052 OWNER TO apollo;

--
-- Name: 18053; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18053');


ALTER LARGE OBJECT 18053 OWNER TO apollo;

--
-- Name: 18054; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18054');


ALTER LARGE OBJECT 18054 OWNER TO apollo;

--
-- Name: 18055; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18055');


ALTER LARGE OBJECT 18055 OWNER TO apollo;

--
-- Name: 18056; Type: BLOB; Schema: -; Owner: apollo
--

SELECT pg_catalog.lo_create('18056');


ALTER LARGE OBJECT 18056 OWNER TO apollo;

--
-- Data for Name: App; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "App" ("Id", "AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (1, 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', NULL, '2019-06-27 14:53:28.274389', '', '2019-06-27 14:53:28.274389', 0);
INSERT INTO "App" ("Id", "AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (2, 'greenhouse-sms', 'greenhouse-sms', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', 'apollo', '2019-06-27 14:56:30.32', 'apollo', '2019-06-27 14:56:30.32', 0);
INSERT INTO "App" ("Id", "AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (9, 'greenhouse-sha', 'greenhouse-sha', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', 'apollo', '2019-06-27 14:57:57.955', 'apollo', '2019-06-27 14:57:57.955', 0);


--
-- Data for Name: AppNamespace; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "AppNamespace" ("Id", "Name", "AppId", "Format", "IsPublic", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (1, 'application', 'SampleApp', 'properties', 0, 'default app namespace', '', '2019-06-27 14:53:28.274389', '', '2019-06-27 14:53:28.274389', 0);
INSERT INTO "AppNamespace" ("Id", "Name", "AppId", "Format", "IsPublic", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (3, 'application', 'greenhouse-sms', 'properties', 0, 'default app namespace', 'apollo', '2019-06-27 14:56:31.016', 'apollo', '2019-06-27 14:56:31.016', 0);
INSERT INTO "AppNamespace" ("Id", "Name", "AppId", "Format", "IsPublic", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (11, 'application', 'greenhouse-sha', 'properties', 0, 'default app namespace', 'apollo', '2019-06-27 14:57:58.162', 'apollo', '2019-06-27 14:57:58.162', 0);


--
-- Name: App_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('"App_seq"', 1, false);


--
-- Data for Name: Audit; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "Audit" ("Id", "EntityName", "EntityId", "OpName", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (2, 'App', 1, 'INSERT', NULL, 'apollo', '2019-06-27 14:56:30.979', NULL, '2019-06-27 14:56:30.979', 0);
INSERT INTO "Audit" ("Id", "EntityName", "EntityId", "OpName", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (4, 'AppNamespace', 3, 'INSERT', NULL, 'apollo', '2019-06-27 14:56:31.017', NULL, '2019-06-27 14:56:31.017', 0);
INSERT INTO "Audit" ("Id", "EntityName", "EntityId", "OpName", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (6, 'Cluster', 5, 'INSERT', NULL, 'apollo', '2019-06-27 14:56:31.062', NULL, '2019-06-27 14:56:31.062', 0);
INSERT INTO "Audit" ("Id", "EntityName", "EntityId", "OpName", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (8, 'Namespace', 7, 'INSERT', NULL, 'apollo', '2019-06-27 14:56:31.154', NULL, '2019-06-27 14:56:31.154', 0);
INSERT INTO "Audit" ("Id", "EntityName", "EntityId", "OpName", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (10, 'App', 9, 'INSERT', NULL, 'apollo', '2019-06-27 14:57:58.159', NULL, '2019-06-27 14:57:58.159', 0);
INSERT INTO "Audit" ("Id", "EntityName", "EntityId", "OpName", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (12, 'AppNamespace', 11, 'INSERT', NULL, 'apollo', '2019-06-27 14:57:58.163', NULL, '2019-06-27 14:57:58.163', 0);
INSERT INTO "Audit" ("Id", "EntityName", "EntityId", "OpName", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (14, 'Cluster', 13, 'INSERT', NULL, 'apollo', '2019-06-27 14:57:58.167', NULL, '2019-06-27 14:57:58.167', 0);
INSERT INTO "Audit" ("Id", "EntityName", "EntityId", "OpName", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (16, 'Namespace', 15, 'INSERT', NULL, 'apollo', '2019-06-27 14:57:58.181', NULL, '2019-06-27 14:57:58.181', 0);
INSERT INTO "Audit" ("Id", "EntityName", "EntityId", "OpName", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (18, 'Release', 17, 'INSERT', NULL, 'apollo', '2019-06-27 14:58:51.504', NULL, '2019-06-27 14:58:51.504', 0);
INSERT INTO "Audit" ("Id", "EntityName", "EntityId", "OpName", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (20, 'ReleaseHistory', 19, 'INSERT', NULL, 'apollo', '2019-06-27 14:58:51.525', NULL, '2019-06-27 14:58:51.525', 0);
INSERT INTO "Audit" ("Id", "EntityName", "EntityId", "OpName", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (22, 'Release', 21, 'INSERT', NULL, 'apollo', '2019-06-27 14:59:01.896', NULL, '2019-06-27 14:59:01.896', 0);
INSERT INTO "Audit" ("Id", "EntityName", "EntityId", "OpName", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (24, 'ReleaseHistory', 23, 'INSERT', NULL, 'apollo', '2019-06-27 14:59:01.897', NULL, '2019-06-27 14:59:01.897', 0);


--
-- Data for Name: Cluster; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "Cluster" ("Id", "Name", "AppId", "ParentClusterId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (1, 'default', 'SampleApp', 0, '', '2019-06-27 14:53:28.274389', '', '2019-06-27 14:53:28.274389', 0);
INSERT INTO "Cluster" ("Id", "Name", "AppId", "ParentClusterId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (5, 'default', 'greenhouse-sms', 0, 'apollo', '2019-06-27 14:56:31.061', 'apollo', '2019-06-27 14:56:31.061', 0);
INSERT INTO "Cluster" ("Id", "Name", "AppId", "ParentClusterId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (13, 'default', 'greenhouse-sha', 0, 'apollo', '2019-06-27 14:57:58.166', 'apollo', '2019-06-27 14:57:58.166', 0);


--
-- Data for Name: Commit; Type: TABLE DATA; Schema: public; Owner: apollo
--



--
-- Data for Name: GrayReleaseRule; Type: TABLE DATA; Schema: public; Owner: apollo
--



--
-- Data for Name: Instance; Type: TABLE DATA; Schema: public; Owner: apollo
--



--
-- Data for Name: InstanceConfig; Type: TABLE DATA; Schema: public; Owner: apollo
--



--
-- Data for Name: Item; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "Item" ("Id", "NamespaceId", "Key", "Value", "Comment", "LineNum", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (1, 1, 'timeout', '100', 'sample timeout配置', 1, NULL, '2019-06-27 14:53:28.274389', '', '2019-06-27 14:53:28.274389', 0);


--
-- Data for Name: Namespace; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "Namespace" ("Id", "AppId", "ClusterName", "NamespaceName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (1, 'SampleApp', 'default', 'application', NULL, '2019-06-27 14:53:28.274389', '', '2019-06-27 14:53:28.274389', 0);
INSERT INTO "Namespace" ("Id", "AppId", "ClusterName", "NamespaceName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (7, 'greenhouse-sms', 'default', 'application', 'apollo', '2019-06-27 14:56:31.153', 'apollo', '2019-06-27 14:56:31.153', 0);
INSERT INTO "Namespace" ("Id", "AppId", "ClusterName", "NamespaceName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (15, 'greenhouse-sha', 'default', 'application', 'apollo', '2019-06-27 14:57:58.179', 'apollo', '2019-06-27 14:57:58.179', 0);


--
-- Data for Name: NamespaceLock; Type: TABLE DATA; Schema: public; Owner: apollo
--



--
-- Data for Name: Release; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "Release" ("Id", "ReleaseKey", "Name", "Comment", "AppId", "ClusterName", "NamespaceName", "Configurations", "IsAbandoned", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (1, '20161009155425-d3a0749c6e20bc15', '20161009155424-release', 'Sample发布', 'SampleApp', 'default', 'application', '{"timeout":"100"}', 0, NULL, '2019-06-27 14:53:28.274389', '', '2019-06-27 14:53:28.274389', 0);
INSERT INTO "Release" ("Id", "ReleaseKey", "Name", "Comment", "AppId", "ClusterName", "NamespaceName", "Configurations", "IsAbandoned", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (17, '20190627145851-fad77e515a245531', '20190627145849-release', '', 'greenhouse-sms', 'default', 'application', '{}', 0, 'apollo', '2019-06-27 14:58:51.488', 'apollo', '2019-06-27 14:58:51.499', 0);
INSERT INTO "Release" ("Id", "ReleaseKey", "Name", "Comment", "AppId", "ClusterName", "NamespaceName", "Configurations", "IsAbandoned", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (21, '20190627145901-1dc57e515a245532', '20190627145900-release', '', 'SampleApp', 'default', 'application', '{"timeout":"100"}', 0, 'apollo', '2019-06-27 14:59:01.893', 'apollo', '2019-06-27 14:59:01.893', 0);


--
-- Data for Name: ReleaseHistory; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "ReleaseHistory" ("Id", "AppId", "ClusterName", "NamespaceName", "BranchName", "ReleaseId", "PreviousReleaseId", "Operation", "OperationContext", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (1, 'SampleApp', 'default', 'application', 'default', 1, 0, 0, '{}', 'apollo', '2019-06-27 14:53:28.274389', 'apollo', '2019-06-27 14:53:28.274389', 0);
INSERT INTO "ReleaseHistory" ("Id", "AppId", "ClusterName", "NamespaceName", "BranchName", "ReleaseId", "PreviousReleaseId", "Operation", "OperationContext", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (19, 'greenhouse-sms', 'default', 'application', 'default', 17, 0, 0, '{"isEmergencyPublish":false}', 'apollo', '2019-06-27 14:58:51.514', 'apollo', '2019-06-27 14:58:51.524', 0);
INSERT INTO "ReleaseHistory" ("Id", "AppId", "ClusterName", "NamespaceName", "BranchName", "ReleaseId", "PreviousReleaseId", "Operation", "OperationContext", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (23, 'SampleApp', 'default', 'application', 'default', 21, 1, 0, '{"isEmergencyPublish":false}', 'apollo', '2019-06-27 14:59:01.897', 'apollo', '2019-06-27 14:59:01.897', 0);


--
-- Data for Name: ReleaseMessage; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "ReleaseMessage" ("Id", "Message", "DataChange_LastTime") VALUES (0, 'greenhouse-sms+default+application', '2019-06-27 14:58:51.541');
INSERT INTO "ReleaseMessage" ("Id", "Message", "DataChange_LastTime") VALUES (0, 'SampleApp+default+application', '2019-06-27 14:59:01.9');


--
-- Name: ReleaseMessage_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('"ReleaseMessage_Id_seq"', 1, false);


--
-- Data for Name: ServerConfig; Type: TABLE DATA; Schema: public; Owner: apollo
--

INSERT INTO "ServerConfig" ("Id", "Key", "Cluster", "Value", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (1, 'eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔', NULL, '2019-06-27 14:53:28.274389', '', '2019-06-27 14:53:28.274389', 0);
INSERT INTO "ServerConfig" ("Id", "Key", "Cluster", "Value", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (2, 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', NULL, '2019-06-27 14:53:28.274389', '', '2019-06-27 14:53:28.274389', 0);
INSERT INTO "ServerConfig" ("Id", "Key", "Cluster", "Value", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (3, 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', NULL, '2019-06-27 14:53:28.274389', '', '2019-06-27 14:53:28.274389', 0);
INSERT INTO "ServerConfig" ("Id", "Key", "Cluster", "Value", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (4, 'config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！', NULL, '2019-06-27 14:53:28.274389', '', '2019-06-27 14:53:28.274389', 0);
INSERT INTO "ServerConfig" ("Id", "Key", "Cluster", "Value", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") VALUES (5, 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', NULL, '2019-06-27 14:53:28.274389', '', '2019-06-27 14:53:28.274389', 0);


--
-- Name: app_namespace_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('app_namespace_seq', 1, true);


--
-- Name: app_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('app_seq', 1, true);


--
-- Name: cluster_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('cluster_seq', 1, true);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('hibernate_sequence', 24, true);


--
-- Name: item_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('item_seq', 1, true);


--
-- Name: namespace_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('namespace_seq', 1, false);


--
-- Name: release_history_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('release_history_seq', 1, true);


--
-- Name: release_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('release_seq', 1, true);


--
-- Name: service_config_seq; Type: SEQUENCE SET; Schema: public; Owner: apollo
--

SELECT pg_catalog.setval('service_config_seq', 5, true);


--
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: 
--

SET search_path = pg_catalog;

BEGIN;

SELECT pg_catalog.lo_open('18034', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18035', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18036', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18037', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18038', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18039', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18047', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18048', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18049', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18050', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18051', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18052', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18053', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18054', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18055', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18056', 131072);
SELECT pg_catalog.lo_close(0);

COMMIT;

--
-- PostgreSQL database dump complete
--

