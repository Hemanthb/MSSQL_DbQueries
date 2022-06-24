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

