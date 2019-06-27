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
    "AppId" character varying(500),
    "Name" character varying(500),
    "OrgId" character varying(32),
    "OrgName" character varying(64),
    "OwnerName" character varying(500),
    "OwnerEmail" character varying(500),
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone default now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" integer default 0
);


ALTER TABLE public."App" OWNER TO apollo;

--
-- Name: app_namespace_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE app_namespace_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_namespace_seq OWNER TO apollo;

--
-- Name: AppNamespace; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "AppNamespace" (
    "Id" integer DEFAULT nextval('app_namespace_seq'::regclass) NOT NULL,
    "Name" character varying(32) DEFAULT ''::character varying,
    "AppId" character varying(32) DEFAULT ''::character varying,
    "Format" character varying(32) DEFAULT 'properties'::character varying,
    "IsPublic" integer DEFAULT 0,
    "Comment" character varying(64) DEFAULT ''::character varying,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_CreatedTime" timestamp without time zone default now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" integer default 0
);


ALTER TABLE public."AppNamespace" OWNER TO apollo;

--
-- Name: App_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE "App_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."App_seq" OWNER TO apollo;

--
-- Name: Audit; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "Audit" (
    "Id" integer NOT NULL,
    "EntityName" character varying(50) NOT NULL,
    "EntityId" integer,
    "OpName" character varying(50) NOT NULL,
    "Comment" character varying(500) DEFAULT NULL::character varying,
    "DataChange_CreatedBy" character varying(32) NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone NOT NULL default now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" integer default 0
);


ALTER TABLE public."Audit" OWNER TO apollo;

--
-- Name: cluster_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE cluster_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_seq OWNER TO apollo;

--
-- Name: Cluster; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "Cluster" (
    "Id" integer DEFAULT nextval('cluster_seq'::regclass) NOT NULL,
    "Name" character varying(32) DEFAULT ''::character varying,
    "AppId" character varying(32) DEFAULT ''::character varying,
    "ParentClusterId" integer DEFAULT 0,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_CreatedTime" timestamp without time zone default now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" integer default 0
);


ALTER TABLE public."Cluster" OWNER TO apollo;

--
-- Name: Commit; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "Commit" (
    "Id" integer NOT NULL,
    "ChangeSets" text NOT NULL,
    "AppId" character varying(500) NOT NULL,
    "ClusterName" character varying(500) NOT NULL,
    "NamespaceName" character varying(500) NOT NULL,
    "Comment" character varying(500) DEFAULT NULL::character varying,
    "DataChange_CreatedBy" character varying(32) NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone NOT NULL default now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" integer default 0
);


ALTER TABLE public."Commit" OWNER TO apollo;

--
-- Name: GrayReleaseRule; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
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
    "DataChange_CreatedTime" timestamp without time zone NOT NULL default now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" integer default 0
);


ALTER TABLE public."GrayReleaseRule" OWNER TO apollo;

--
-- Name: Instance; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "Instance" (
    "Id" integer NOT NULL,
    "AppId" character varying(32) NOT NULL,
    "ClusterName" character varying(32) NOT NULL,
    "DataCenter" character varying(64) NOT NULL,
    "Ip" character varying(32) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone NOT NULL default now(),
    "DataChange_LastTime" timestamp without time zone default now()
);


ALTER TABLE public."Instance" OWNER TO apollo;

--
-- Name: InstanceConfig; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "InstanceConfig" (
    "Id" integer NOT NULL,
    "InstanceId" integer,
    "ConfigAppId" character varying(32) NOT NULL,
    "ConfigClusterName" character varying(32) NOT NULL,
    "ConfigNamespaceName" character varying(32) NOT NULL,
    "ReleaseKey" character varying(64) DEFAULT ''::character varying NOT NULL,
    "ReleaseDeliveryTime" timestamp without time zone,
    "DataChange_CreatedTime" timestamp without time zone NOT NULL default now(),
    "DataChange_LastTime" timestamp without time zone default now()
);


ALTER TABLE public."InstanceConfig" OWNER TO apollo;

--
-- Name: item_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_seq OWNER TO apollo;

--
-- Name: Item; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "Item" (
    "Id" integer DEFAULT nextval('item_seq'::regclass) NOT NULL,
    "NamespaceId" integer DEFAULT 0,
    "Key" character varying(128),
    "Value" character varying(2048),
    "Comment" character varying(1024) DEFAULT ''::character varying,
    "LineNum" integer DEFAULT 0,
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone default now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" integer default 0
);


ALTER TABLE public."Item" OWNER TO apollo;

--
-- Name: namespace_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE namespace_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.namespace_seq OWNER TO apollo;

--
-- Name: Namespace; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "Namespace" (
    "Id" integer DEFAULT nextval('namespace_seq'::regclass) NOT NULL,
    "AppId" character varying(500),
    "ClusterName" character varying(500),
    "NamespaceName" character varying(500),
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone default now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" integer default 0
);


ALTER TABLE public."Namespace" OWNER TO apollo;

--
-- Name: NamespaceLock; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "NamespaceLock" (
    "Id" integer NOT NULL,
    "NamespaceId" integer DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(32) NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone NOT NULL default now(),
    "DataChange_LastModifiedBy" character varying(32),
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" integer default 0
);


ALTER TABLE public."NamespaceLock" OWNER TO apollo;

--
-- Name: release_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE release_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.release_seq OWNER TO apollo;

--
-- Name: Release; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
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
    "DataChange_CreatedTime" timestamp without time zone default now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" integer default 0
);


ALTER TABLE public."Release" OWNER TO apollo;

--
-- Name: release_history_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE release_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.release_history_seq OWNER TO apollo;

--
-- Name: ReleaseHistory; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
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
    "DataChange_CreatedTime" timestamp without time zone default now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" integer default 0
);


ALTER TABLE public."ReleaseHistory" OWNER TO apollo;

--
-- Name: ReleaseMessage; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "ReleaseMessage" (
    "Id" serial NOT NULL,
    "Message" character varying(1024) DEFAULT ''::character varying NOT NULL,
    "DataChange_LastTime" timestamp without time zone default now()
);


ALTER TABLE public."ReleaseMessage" OWNER TO apollo;

--
-- Name: service_config_seq; Type: SEQUENCE; Schema: public; Owner: apollo
--

CREATE SEQUENCE service_config_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_config_seq OWNER TO apollo;

--
-- Name: ServerConfig; Type: TABLE; Schema: public; Owner: apollo; Tablespace:
--

CREATE TABLE "ServerConfig" (
    "Id" integer DEFAULT nextval('service_config_seq'::regclass) NOT NULL,
    "Key" character varying(64),
    "Cluster" character varying(32),
    "Value" character varying(2048),
    "Comment" character varying(1024) DEFAULT ''::character varying,
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone default now(),
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone default now(),
    "IsDeleted" integer default 0
);


ALTER TABLE public."ServerConfig" OWNER TO apollo;

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



INSERT INTO "ServerConfig" ("Key", "Cluster", "Value", "Comment")
VALUES
    ('eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔'),
    ('namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关'),
    ('item.value.length.limit', 'default', '20000', 'item value最大长度限制'),
    ('config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！'),
    ('item.key.length.limit', 'default', '128', 'item key 最大长度限制');


INSERT INTO "App" ("AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail")
VALUES
    ('SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com');

INSERT INTO "AppNamespace" ("Name", "AppId", "Format", "IsPublic", "Comment")
VALUES
    ('application', 'SampleApp', 'properties', 0, 'default app namespace');

INSERT INTO "Cluster" ("Name", "AppId")
VALUES
    ('default', 'SampleApp');

INSERT INTO "Namespace" ("Id", "AppId", "ClusterName", "NamespaceName")
VALUES
    (1, 'SampleApp', 'default', 'application');


INSERT INTO "Item" ("NamespaceId", "Key", "Value", "Comment", "LineNum")
VALUES
    (1, 'timeout', '100', 'sample timeout配置', 1);

INSERT INTO "Release" ("ReleaseKey", "Name", "Comment", "AppId", "ClusterName", "NamespaceName", "Configurations")
VALUES
    ('20161009155425-d3a0749c6e20bc15', '20161009155424-release', 'Sample发布', 'SampleApp', 'default', 'application', '{"timeout":"100"}');

INSERT INTO "ReleaseHistory" ("AppId", "ClusterName", "NamespaceName", "BranchName", "ReleaseId", "PreviousReleaseId", "Operation", "OperationContext", "DataChange_CreatedBy", "DataChange_LastModifiedBy")
VALUES
  ('SampleApp', 'default', 'application', 'default', 1, 0, 0, '{}', 'apollo', 'apollo');
