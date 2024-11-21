USE Project
--1 Admin
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

--2 Admin
GO
CREATE PROC LearnerInfo
@LearnerID INT
AS
BEGIN
SELECT *
FROM PersonalizationProfiles
WHERE LearnerID = @LearnerID
END;

--EXEC LearnerInfo @LearnerID = 1

--3 Admin
GO
CREATE PROC EmotionalState
@LearnerID INT
AS
BEGIN
SELECT emotional_state 
FROM PersonalizationProfiles
WHERE LearnerID = @LearnerID
END;

--4 Admin
GO
CREATE PROC LogDetails
@LearnerID INT
AS
BEGIN
SELECT *
FROM Interaction_logs
WHERE LearnerID = @LearnerID
ORDER BY ILTimestamp DESC
END;

--5 Admin
GO 
CREATE PROC InstructorReview
@InstructorID INT
AS
BEGIN
SELECT *
FROM Emotionalfeedback_review
WHERE InstructorID = @InstructorID
END;


--6 Admin
GO
CREATE PROCEDURE CourseRemove
@courseID INT
AS
BEGIN
DELETE FROM Courses
WHERE CourseID = @courseID;
END;

--SELECT *
--FROM Courses
--WHERE CourseID =1;

--EXEC CourseRemove @courseID = 1

--7 Admin
GO
CREATE VIEW HighestGrade AS
SELECT CourseID, AssessmentID, title, MAX(MaxPoints) AS HighestMaxPoints
FROM Assessments
GROUP BY CourseID, AssessmentID, title;
--THIS WON'T SHOW THE COURSE NAME


--8 Admin
GO
CREATE VIEW InstructorCount AS
SELECT CourseID, COUNT(DISTINCT InstructorID) AS InstructorCount
FROM InstructorsCourses
GROUP BY CourseID
HAVING COUNT(DISTINCT InstructorID) > 1;


-- 9 Admin
GO
CREATE PROCEDURE ViewNot
@LearnerID INT
AS
BEGIN
SELECT *
FROM  Notifications
WHERE LearnerID = @LearnerID;
END;


--10 Admin
GO
CREATE PROCEDURE CreateDiscussion
@ModuleID INT,
@CourseID INT,
@Title VARCHAR(50),
@Description VARCHAR(50)
AS
BEGIN
INSERT INTO DiscussionForums (ModuleID, CourseID, Title, Description)
VALUES (@ModuleID, @CourseID, @Title, @Description);

PRINT 'Discussion forum created successfully.';
END;

--11 Admin
GO
CREATE PROCEDURE RemoveBadge
    @BadgeID INT
AS
BEGIN
IF EXISTS (SELECT 1 FROM Badges WHERE BadgeID = @BadgeID)
BEGIN
DELETE FROM Badges
WHERE BadgeID = @BadgeID;
PRINT 'Badge removed successfully.';
END
ELSE
BEGIN
PRINT 'Badge not found.';
END
END;

--12 Admin
GO
CREATE PROCEDURE CriteriaDelete
    @Criteria VARCHAR(50)
AS
BEGIN
    DELETE FROM Quests
    WHERE Criteria = @Criteria;

    PRINT 'All quests for the given criterion have been deleted.';
END;

--13 Admin
GO
CREATE PROCEDURE NotificationUpdate
    @LearnerID INT,
    @NotificationID INT,
    @ReadStatus BIT = NULL  -- NULL allows for deletion case
AS
BEGIN
    IF @ReadStatus IS NOT NULL
    BEGIN
        -- Mark the notification as read or unread
        UPDATE Notifications
        SET ReadStatus = @ReadStatus
        WHERE LearnerID = @LearnerID
        AND NotificationID = @NotificationID;
    END
    ELSE
    BEGIN
        -- Delete the notification
        DELETE FROM Notifications
        WHERE LearnerID = @LearnerID
        AND NotificationID = @NotificationID;
    END
END;

--14 Admin
GO
CREATE VIEW  EmotionalTrendAnalysis
@CourseID INT,
@ModuleID INT,
@TimePeriod datetime,
AS
BEGIN
SELECT e.emotional_state
FROM Emotional_feedback e
INNER JOIN Modules m ON e.emotional_state
END;

