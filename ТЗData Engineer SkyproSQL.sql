--Script for OLTP
CREATE DATABASE [DataEngineerHW] 
GO 
 USE [DataEngineerHW]

create table stream
(
   id                     integer  IDENTITY(1,1)  primary key,
   course_id              integer,
   start_at               DATETIME,
   end_at                 DATETIME,
   created_at             DATETIME,
   updated_at             DATETIME,
   deleted_at             DATETIME,
   is_open                bit,
   [name]                 varchar(255), --Normalization(Exrternal Table)
   homework_deadline_days integer
);

INSERT INTO stream (course_id,start_at,end_at,created_at,updated_at,deleted_at,is_open,[name],homework_deadline_days)
 VALUES(1,'2021-12-15','2022-12-15','2021-12-10',NULL,NULL,0,'DT_50',10),
	   (1,'2022-12-25',NULL,'2022-12-10',NULL,NULL,1,'DT_51',10)--,
	   --(2,'2021-09-20',NULL,'2021-08-01',NULL,NULL,1,'PYT_22',14),
	   --(3,'2022-03-30',NULL,'2022-03-01',NULL,NULL,1,'DA_05',7),
	   --(4,'2022-09-15',NULL,'2022-07-01',NULL,NULL,1,'WD_02',7)


create table course
(
   id                    integer IDENTITY(1,1)     primary key,
   title                 varchar(255),
   created_at            DATETIME,
   updated_at            DATETIME,
   deleted_at            DATETIME,
   icon_url              varchar(255),
   is_auto_course_enroll bit,
   is_demo_enroll        bit
);


INSERT INTO course (title,created_at,updated_at,deleted_at,icon_url,is_auto_course_enroll,is_demo_enroll)
 VALUES('Data Engineering',DATEADD(MOnth,-17,GETDATE()),NULL,NULL,'https://www.google.com/webhp',1,0)
		--,
	 --  ('Python Developer',DATEADD(MOnth,-20,GETDATE()),GETDATE(),NULL,'https://www.google.com/webhp',0,0),
	 --  ('Data Analyst',DATEADD(MOnth,-15,GETDATE()),NULL,NULL,'https://www.google.com/webhp',1,1),
	 --  ('Web developer',DATEADD(Week,-35,GETDATE()),GETDATE(),NULL,'https://www.google.com/webhp',1,1)


create table stream_module
(
   id  integer IDENTITY(1,1)   primary key,
   stream_id       integer,
   title           varchar(255),
   created_at      DATETIME,
   updated_at      DATETIME,
   order_in_stream integer,
   deleted_at      DATETIME
);

INSERT INTO stream_module (stream_id,title,created_at,updated_at,order_in_stream,deleted_at)
 VALUES(1,'SQL','2021-12-15',null,1,null),
	   (1,'T-SQL','2021-12-15',null,2,null),
	   (1,'SSIS','2021-12-15',null,3,null),
	   (1,'C#','2021-12-15',null,4,null),
	   (2,'SQL','2022-12-25',null,1,null),
	   (2,'Python','2022-12-25',null,2,null),
	   (2,'Airflow','2022-12-25',null,3,null),
	   (2,'Hadoop','2022-12-25',null,4,null),
	   (2,'AWS','2022-12-25',null,5,null)


create table stream_module_lesson
(
   id                          integer IDENTITY(1,1)   primary key,
   title                       varchar(255),
   [description]               nvarchar(max),
   start_at                    DATETIME,
   end_at                      DATETIME,
   homework_url                varchar(500),
   teacher_id                  integer,
   stream_module_id            integer,
   deleted_at                  DATETIME,
   online_lesson_join_url      varchar(255),
   online_lesson_recording_url varchar(255)
);


INSERT INTO stream_module_lesson (title,[description],start_at,end_at,homework_url,teacher_id,stream_module_id,deleted_at,online_lesson_join_url,online_lesson_recording_url)
 VALUES('SQL Query(DQL)','','2021-12-15 00:00:00.000','2022-01-15 00:00:00.000','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,9,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('SQL (DML)','','2022-01-16 00:00:00.000','2022-02-16 00:00:00.000','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,1,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('SQL (DDL)','','2022-02-17 00:00:00.000','2022-03-16 00:00:00.000','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,1,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('SP in T-SQL','','2022-03-17 00:00:00.000','2022-04-17 00:00:00.000','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,2,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('View in T-SQL','','2022-04-18 00:00:00.000','2022-05-17 00:00:00.000','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,2,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('Triggers in T-SQL','','2022-05-17 00:00:00.000','2022-06-17 00:00:00.000','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,2,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('General Packages','','2022-06-18 00:00:00.000','2022-07-18 00:00:00.000','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,3,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('Data Flow','','2022-07-19 00:00:00.000','2022-08-19 00:00:00.000','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,3,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('Connection Manger','','2022-08-20 00:00:00.000','2022-09-20 00:00:00.000','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,3,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('Basic C#','','2022-09-21 00:00:00.000','2022-10-21 00:00:00.000','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,4,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('C# in SSIS','','2022-10-22 00:00:00.000','2022-12-15 00:00:00.000','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,4,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	 
	   ('SQL Query(DQL)','','2022-12-25 00:00:00.000','2023-01-20 00:00:00.000','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,5,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('SQL (DML)','','2023-01-21 00:00:00.000','2023-02-20 00:00:00.000','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,5,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('SQL (DDL)','','2023-02-21 00:00:00.000','2023-03-15 00:00:00.000','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,5,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('Basic Python','','2023-03-16 00:00:00.000','2023-04-16 00:00:00.000','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,6,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('Numpy','','2023-04-17 00:00:00.000',NULL,'https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,6,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('Pandas','',NULL,NULL,'https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,6,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('General Airflow','',NULL,NULL,'https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,7,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('DAGs','','','','https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,7,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   
	   ('Hadoop General','',NULL,NULL,'https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,8,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('Hadoop Detailed','',NULL,NULL,'https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,8,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   
	   ('AWS Cloud','',NULL,NULL,'https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,9,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs'),
	   ('AWS Glue','',NULL,NULL,'https://docs.google.com/document/d/1NFqyNacYf7jTiFoN8AH4kL3auifMcezkDD858xpZZxw/edit',1,9,null,'https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs','https://docs.google.com/document/d/1behG0xwx9H_DB8L89VxeHfKcUAmy2mO-vRDvM9M5YuU/edit#heading=h.gjdgxs')


ALTER TABLE stream
ADD FOREIGN KEY (course_id) REFERENCES course(id);

ALTER TABLE stream_module
ADD FOREIGN KEY (stream_id) REFERENCES stream(id);

ALTER TABLE stream_module_lesson
ADD FOREIGN KEY (stream_module_id) REFERENCES stream_module(id);

--ALTER  TABLE stream DROP CONSTRAINT [FK__stream__course_i__5535A963]
--ALTER  TABLE stream_module DROP CONSTRAINT [FK__stream_mo__strea__5629CD9C]

--Select * from drop table stream
--Select * from drop table course
--Select * from drop table stream_module
--Select * from drop table stream_module_lesson
----------------------------------------------------------------------------------------------------------------------------------------
GO
--Script for DWH Staging DB without keys and constraints
CREATE DATABASE DataEngineerDWHStage
 
 USE DataEngineerDWHStage

 create table stream
(
   id                     integer  ,
   course_id              integer,
   start_at               DATETIME,
   end_at                 DATETIME,
   created_at             DATETIME,
   updated_at             DATETIME,
   deleted_at             DATETIME,
   is_open                bit,
   [name]                 varchar(255), --Normalization(Exrternal Table)
   homework_deadline_days integer
);

create table course
(
   id                    integer ,
   title                 varchar(255),
   created_at            DATETIME,
   updated_at            DATETIME,
   deleted_at            DATETIME,
   icon_url              varchar(255),
   is_auto_course_enroll bit,
   is_demo_enroll        bit
);

create table stream_module
(
   id  integer ,
   stream_id       integer,
   title           varchar(255),
   created_at      DATETIME,
   updated_at      DATETIME,
   order_in_stream integer,
   deleted_at      DATETIME
);

create table stream_module_lesson
(
   id                          integer  ,
   title                       varchar(255),
   [description]               nvarchar(max),
   start_at                    DATETIME,
   end_at                      DATETIME,
   homework_url                varchar(500),
   teacher_id                  integer,
   stream_module_id            integer,
   deleted_at                  DATETIME,
   online_lesson_join_url      varchar(255),
   online_lesson_recording_url varchar(255)
);

------------------------------------------------------------------------------------------------------------------------------------------
GO
--Script for DWH DB  DWH Schema SnowLake. Data model is Conceptual .
CREATE DATABASE DataEngineerDWH

 USE DataEngineerDWH

 create table FStream
(
   Id                    integer Primary Key ,
   CourseKey             integer,
   StartAt               DATETIME,
   EndAt                 DATETIME,
   CreatedAt             DATETIME,
   UpdatedAt             DATETIME,
   DeletedAt             DATETIME,
   IsOpen                bit,
   [Name]                varchar(255), --Normalization(Exrternal Table)
   HomeworkDeadlineDays integer
);

create table DCourse
(
   Id                    integer  Primary Key,
   Title                 varchar(255),
   CreatedAt            DATETIME,
   UpdatedAt            DATETIME,
   DeletedAt            DATETIME,
   IconUrl              varchar(255),
   IsAutoCourseEnroll bit,
   IsDemoEnroll        bit
);

create table FStreamModule
(
   Id             integer Primary Key,
   StreamKey       integer,
   CourseKey	   integer,
   Title           varchar(255),
   CreatedAt      DATETIME,
   UpdatedAt      DATETIME,
   OrderInStream  integer,
   DeletedAt      DATETIME
);

create table FStreamModuleLesson
(
   Id                         integer  Primary Key,
   Title                      varchar(255),
   [Description]              nvarchar(max),
   StartAt                    DATETIME,
   EndAt                      DATETIME,
   HomeworkUrl                varchar(500),
   TeacherId                  integer,
   StreamModuleKey            integer,
   StreamKey				  integer,
   CourseKey				  integer,
   DeletedAt                  DATETIME,
   OnlineLessonJoinUrl        varchar(255),
   OnlineLessonRecordingUrl   varchar(255)
);

ALTER TABLE FStream
ADD FOREIGN KEY (CourseKey) REFERENCES DCourse(id);

ALTER TABLE FStreamModule
ADD FOREIGN KEY (StreamKey) REFERENCES FStream(id);

ALTER TABLE FStreamModule
ADD FOREIGN KEY (CourseKey) REFERENCES DCourse(id);

ALTER TABLE FStreamModuleLesson
ADD FOREIGN KEY (StreamModuleKey) REFERENCES FStreamModule(id);

ALTER TABLE FStreamModuleLesson
ADD FOREIGN KEY (StreamKey) REFERENCES FStream(id);

ALTER TABLE FStreamModuleLesson
ADD FOREIGN KEY (CourseKey) REFERENCES DCourse(id);

-------------------------------------------------------------------------------------------------------------------------------------------

--Merge Scripts From STG to DWH

--Course
GO
MERGE [DataEngineerDWH].dbo.DCourse  t 
    USING 
	(SELECT    [id]
			  ,[title]
			  ,[created_at]
			  ,[updated_at]
			  ,[deleted_at]
			  ,[icon_url]
			  ,[is_auto_course_enroll]
			  ,[is_demo_enroll]
  FROM [DataEngineerDWHStage].[dbo].[course]) s
ON (s.[id] = t.[id])
WHEN MATCHED
    THEN UPDATE SET 
               t.Title                =   s.[title]       
			  ,t.CreatedAt         	  =	  s.[created_at]
			  ,t.UpdatedAt         	  =	  s.[updated_at]
			  ,t.DeletedAt         	  =	  s.[deleted_at]
			  ,t.IconUrl           	  =	  s.[icon_url]
			  ,t.IsAutoCourseEnroll	  =	  s.[is_auto_course_enroll]
			  ,t.IsDemoEnroll      	  =	  s.[is_demo_enroll]

WHEN NOT MATCHED BY TARGET 
    THEN INSERT (Id, Title, CreatedAt,UpdatedAt,DeletedAt,IconUrl,IsAutoCourseEnroll,IsDemoEnroll)
         VALUES (s.Id,s.[title],s.[created_at],s.[updated_at],s.[deleted_at],s.[icon_url],s.[is_auto_course_enroll],s.[is_demo_enroll]);
--WHEN NOT MATCHED BY SOURCE 
--    THEN DELETE;


--Stream

MERGE [DataEngineerDWH].dbo.FStream  t 
    USING 
	(SELECT  [id]
			,[course_id]
			,[start_at]
			,[end_at]
			,[created_at]
			,[updated_at]
			,[deleted_at]
			,[is_open]
			,[name]
			,[homework_deadline_days]
  FROM [DataEngineerDWHStage].[dbo].[stream]) s
ON (s.[id] = t.[id])
WHEN MATCHED
    THEN UPDATE SET      
			 t.CourseKey           	=s.[course_id]
			,t.StartAt             	=s.[start_at]
			,t.EndAt               	=s.[end_at]
			,t.CreatedAt           	=s.[created_at]
			,t.UpdatedAt           	=s.[updated_at]
			,t.DeletedAt           	=s.[deleted_at]
			,t.IsOpen              	=s.[is_open]
			,t.[Name]              	=s.[name]
			,t.HomeworkDeadlineDays  =s.[homework_deadline_days]

WHEN NOT MATCHED BY TARGET 
    THEN INSERT (Id,CourseKey,StartAt,EndAt,CreatedAt,UpdatedAt,DeletedAt,IsOpen,[Name],HomeworkDeadlineDays)
         VALUES (Id,[course_id],[start_at],[end_at],[created_at],[updated_at],[deleted_at],[is_open],[name],[homework_deadline_days]);
--WHEN NOT MATCHED BY SOURCE 
--    THEN DELETE;

--StreamModule

MERGE [DataEngineerDWH].dbo.FStreamModule  t 
    USING 
	(SELECT    sm.[id]
			  ,sm.[stream_id]
			  ,s.[CourseKey]
			  ,sm.[title]
			  ,sm.[created_at]
			  ,sm.[updated_at]
			  ,sm.[order_in_stream]
			  ,sm.[deleted_at]
  FROM [DataEngineerDWHStage].[dbo].[stream_module] sm
		left join [DataEngineerDWH].[dbo].[FStream] s ON sm.[stream_id]=s.Id) s
ON (s.[id] = t.[id])
WHEN MATCHED
    THEN UPDATE SET      
		  t.StreamKey    	  =s.[stream_id]
		 ,t.CourseKey		  =s.[CourseKey]
		 ,t.Title        	  =s.[title]
		 ,t.CreatedAt    	  =s.[created_at]
		 ,t.UpdatedAt    	  =s.[updated_at]
		 ,t.OrderInStream	  =s.[order_in_stream]
		 ,t.DeletedAt    	  =s.[deleted_at]

WHEN NOT MATCHED BY TARGET 
    THEN INSERT (Id,StreamKey,CourseKey,Title,CreatedAt,UpdatedAt,OrderInStream,DeletedAt)
         VALUES (Id,[stream_id],[CourseKey],[title],[created_at],[updated_at],[order_in_stream],[deleted_at]);
--WHEN NOT MATCHED BY SOURCE 
--    THEN DELETE;


--FStreamModuleLesson

MERGE [DataEngineerDWH].dbo.FStreamModuleLesson  t 
    USING 
	(SELECT    sml.[id]
			  ,sml.[title]
			  ,sml.[description]
			  ,sml.[start_at]
			  ,sml.[end_at]
			  ,sml.[homework_url]
			  ,sml.[teacher_id]
			  ,sml.[stream_module_id]
			  ,sm.StreamKey
			  ,sm.CourseKey
			  ,sml.[deleted_at]
			  ,sml.[online_lesson_join_url]
			  ,sml.[online_lesson_recording_url]
  FROM [DataEngineerDWHStage].[dbo].[stream_module_lesson] sml
		left join [DataEngineerDWH].[dbo].[FStreamModule] sm ON sml.[stream_module_id]=sm.Id) s
ON (s.[id] = t.[id])
WHEN MATCHED
    THEN UPDATE SET                           
		    t.Title                     =s.[title]
		   ,t.[Description]             =s.[description]
		   ,t.StartAt                   =s.[start_at]
		   ,t.EndAt                     =s.[end_at]
		   ,t.HomeworkUrl               =s.[homework_url]
		   ,t.TeacherId                 =s.[teacher_id]
		   ,t.StreamModuleKey           =s.[stream_module_id]
		   ,t.StreamKey				    =s.StreamKey
		   ,t.CourseKey				    =s.CourseKey
		   ,t.DeletedAt                 =s.[deleted_at]
		   ,t.OnlineLessonJoinUrl       =s.[online_lesson_join_url]
		   ,t.OnlineLessonRecordingUrl  =s.[online_lesson_recording_url]

WHEN NOT MATCHED BY TARGET 
    THEN INSERT (Id,Title,[Description],StartAt,EndAt,HomeworkUrl,TeacherId,StreamModuleKey,StreamKey,CourseKey,DeletedAt,OnlineLessonJoinUrl,OnlineLessonRecordingUrl)
         VALUES (s.Id,s.[title],s.[description],s.[start_at],s.[end_at],s.[homework_url],s.[teacher_id],s.[stream_module_id],s.StreamKey,s.CourseKey,s.[deleted_at],s.[online_lesson_join_url],s.[online_lesson_recording_url]);
--WHEN NOT MATCHED BY SOURCE 
--    THEN DELETE;


---------------------------------------------------------------------------------------------------------------------------------

--Dmart (Витрина Данных)

Select 
	 sml.Title AS LessonTitle
	,sml.[Description] AS LessonDescription
	,sml.StartAt AS StartDateLEsson
	,sml.EndAt  AS EndDateLesson
	,sm.Title AS StreamModuleTitle
	,sm.OrderInStream
	,sm.CreatedAt AS StreamModuleCreatedDate
	,s.Name AS StreamName
	,s.StartAt AS StreamStartDate
	,s.EndAt AS StreamEndDate
	,s.IsOpen AS StreamOpenClose
	,s.HomeworkDeadlineDays
	,c.Title AS CourseName
	,c.CreatedAt AS CourseCreateDate
	,c.IsAutoCourseEnroll
	,c.IsDemoEnroll
 from FStreamModuleLesson sml
	left join FStreamModule sm ON sml.StreamModuleKey=sm.Id
	left join FStream s ON sml.StreamKey=s.Id
	left join DCourse c ON sml.CourseKey=c.Id
	ORDER BY c.Title,s.Name,sm.OrderInStream,sml.StartAt