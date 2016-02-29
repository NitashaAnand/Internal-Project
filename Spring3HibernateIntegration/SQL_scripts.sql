/* Creating database TimeLogDB */
CREATE DATABASE "TimeLogDB"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'English_United States.1252'
       LC_CTYPE = 'English_United States.1252'
       CONNECTION LIMIT = -1;
       
/*Create sequence for casedetails table*/
CREATE SEQUENCE public.case_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.case_seq
  OWNER TO postgres;

  
/* Create table casedetails*/
CREATE TABLE public.casedetails
(
  id integer NOT NULL DEFAULT nextval('case_seq'::regclass),
  casenumber character varying(30),
  clientname character varying(30),
  assignedon character varying(50),
  assignedto character varying(100),
  issuesummary character varying(50),
  comment character varying(100),
  timespent character varying(50),
  ticketstatus character varying(30),
  ticketpriority character varying(30),
  mydate character varying(50),
  CONSTRAINT p_key PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.casedetails
  OWNER TO postgres;

  
/*Create sequence of employee table */
CREATE SEQUENCE public.employee_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 2
  CACHE 1;
ALTER TABLE public.employee_seq
  OWNER TO postgres;

/* Create table employee */
CREATE TABLE public.employee
(
  id bigint NOT NULL,
  firstname character varying(255),
  lastname character varying(255),
  email character varying(255),
  username character varying(100),
  password character varying(50),
  active boolean DEFAULT true,
  telephone character varying(255),
  CONSTRAINT uniq_id UNIQUE (id),
  CONSTRAINT uniq_username UNIQUE (username)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.employee
  OWNER TO postgres;
  
 /*Create trigger function*/
CREATE OR REPLACE FUNCTION public.function_copy()
  RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO
        user_role(userid,role)
        VALUES(new.id,'ROLE_USER');
        

           RETURN new;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.function_copy()
  OWNER TO postgres;
   
/* Create trigger */
CREATE TRIGGER trig_copy
  AFTER INSERT
  ON public.employee
  FOR EACH ROW
  EXECUTE PROCEDURE public.function_copy();

/*Create table user_role*/
CREATE TABLE public.user_role
(
  userid bigint,
  role character varying(50),
  CONSTRAINT fk_userid FOREIGN KEY (userid)
      REFERENCES public.employee (id) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT user_role_userid_key UNIQUE (userid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.user_role
  OWNER TO postgres;

/* Insert one employee in employee table */
 insert into employee values(1,'Nitasha','Anand','nanand@qasource.com','nitasha','nitasha','t','8699503459')
 
 /* Trigger is enabled so entry of id in employee table is copied to the userid of user_role table and role is set ROLE_USER by default automatically by enabling trigger
  * .No need of inserting manually */
 
 
 /* For adding details of admin..Trigger should be disabled first. So we need to do insertion manually. and after doing this trigger should be enabled..This should be 
  * done in only one transaction */
 
BEGIN  /* Transaction Starts */
    ALTER TABLE employee DISABLE TRIGGER trig_copy; /* disabling trigger */
    insert into employee values(4,'Admin','Admin','admin@qasource.com','admin','admin','t','9988231234') /** Insertion for admin **/   														
    insert into user_role values(4,'ROLE_ADMIN') /** Done Manually **/
    ALTER TABLE employee ENABLE TRIGGER trig_copy;/** Enabling trigger **/   
END; /* Transaction Ends */
  LANGUAGE plpgsql VOLATILE
  COST 100;
  
  /* Insert one detail of case in casedetails table */
  insert into casedetails values(1,'45567','James','01/15/2016','Nitasha Anand','Error in DB','Test it and Submit it on Time','65 minutes','Open','P2','Fri Jan 15 11:32:56 IST 2016')

