--------CREATES A TABLE STUDENT DETAILS AND COURSE DETAILS--------
CREATE TABLE Student_Details (StudentId INT NOT NULL PRIMARY KEY IDENTITY(1,1),StudentName VARCHAR(30),Dept VARCHAR(25));

CREATE TABLE Course_Details(StudentId INT NOT NULL,CourseId INT NOT NULL,CourseName VARCHAR(100));

--------INSERTS VALUES INTO TABLES & SELECTS USING PROCEDURE ---------
INSERT INTO Student_Details VALUES('Jairam','IT'),('Sanisha','IT'),('saneesh','Mech'),('shyama','ECE');

GO
CREATE PROCEDURE dbo.spStudentDetails_select
AS
BEGIN
BEGIN TRY
	SELECT * FROM Student_Details;
END TRY
BEGIN CATCH
SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END;

EXEC spStudentDetails_select;

ALTER TABLE Student_Details ADD Age INT;

----------TRIGGER FUNCTIONALITY---------------

CREATE TRIGGER Check_age
ON Student_Details
FOR INSERT AS
BEGIN
Declare @Id int  
  SELECT @Id = StudentId from inserted  
  INSERT INTO Course_Details VALUES (@Id,2,'C#')
END;

INSERT INTO Student_Details VALUES ('jai','IT',19);

select* from Course_Details;

Create table courses (Course_id int not null,Course_name varchar(30))

ALTER TABLE courses ADD CONSTRAINT pk_courseid PRIMARY KEY (Course_id);

alter table Student_Details add Course_id int;

ALTER TABLE Student_Details ADD CONSTRAINT fk_courseid FOREIGN KEY (Course_id) REFERENCES Student_Details(StudentId);

select * from Student_Details;

use StudentDetails;
select * from courses;

insert into courses values(1,'Data structures'),(2,'Design Principles');

-----------------INNER JOIN, LEFT JOIN, RIGHT JOIN ---------------------

select sd.StudentName,cd.CourseName from Student_Details sd inner join Course_Details cd on sd.StudentId=cd.StudentId;

select sd.StudentName,cd.CourseName from Student_Details sd left join Course_Details cd on sd.StudentId=cd.StudentId;

select sd.StudentName,cd.CourseName from Student_Details sd right join Course_Details cd on sd.StudentId=cd.StudentId;

-----VIEWS-----

CREATE VIEW course_view AS
SELECT StudentName
FROM Student_Details;

SELECT * FROM course_view;

--------------------Sub Query --------------------------------

select * from Student_Details where StudentId NOT IN (select StudentId from Course_Details);