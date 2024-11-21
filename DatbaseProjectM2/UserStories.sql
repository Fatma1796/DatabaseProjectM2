USE Project
--1 in Admin
GO
CREATE PROC ViewInfo 
@LearnerID INT
AS
BEGIN
SELECT *
FROM Learner
WHERE LearnerID = @LearnerID
END;


--EXEC ViewInfo @LearnerID = 1

GO
CREATE PROC LearnerInfo
@LearnerID INT
AS
BEGIN
SELECT *
FROM PersonalizationProfiles
WHERE LearnerID = @LearnerID
END;

