-- Write your own SQL object definition here, and it'll be included in your package.
CREATE DATABASE Project

-- 1 Creation of Learner
CREATE TABLE Learner(
    int LearnerID PRIMARY KEY IDENTITY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    gender VARCHAR(20),
    birth_date DATE,
    country VARCHAR(20),
    cultural_background VARCHAR(20)
);

-- 1 Learners multivaled attributes
CREATE TABLE Skills(
   int LearnerID PRIMARY KEY IDENTITY,
   skill VARCHAR(20),
   PRIMARY KEY (LearnerID, skill),
   FOREIGN KEY (LearnerID) REFERENCES Learner(LearnerID) ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE LearningPreference(
   int LearnerID PRIMARY KEY IDENTITY,
   preference VARCHAR(20),
   PRIMARY KEY (LearnerID, preference),
   FOREIGN KEY (LearnerID) REFERENCES Learner(LearnerID) ON DELETE CASCADE ON UPDATE CASCADE 
);

-- 2 Creation of Personalization Profiles
CREATE TABLE PersonalizationProfileS(
    LearnerID INT IDENTITY,
    ProfileID INT IDENTITY,
    Prefered_content_type VARCHAR(20),
    emotional_state VARCHAR(20),
    personality_type VARCHAR(20),
    PRIMARY KEY (LearnerID,ProfileID),
    FOREIGN KEY (LearnerID) REFERENCES Learner (LearnerID) ON DELETE CASCADE ON UPDATE CASCADE 
); 
-- 2 PersonalizationProfileS multivalued attribute
 CREATE TABLE HealthCondition(
    LearnerID INT IDENTITY,
    ProfileID INT IDENTITY,
    Condition VARCHAR (20),
    PRIMARY KEY (LearnerID,ProfileID,condition),
    FOREIGN KEY (LearnerID,ProfileID) REFERENCES PersonalizationProfileS(LearnerID,ProfileID)
 );

--3 Creation of Courses
    --Enter code here

--4 Creation of Modulesgit
    --Enter code here

--stfu
--comment tania fu


--rabena yostor
   CREATE TABLE Learning_activities(
        int ActivityID PRIMARY KEY IDENTITY,
        activity_type VARCHAR(20),
        instruction_details VARCHAR(20),
        Max_points INT,
        ModuleID INT,
        FOREIGN KEY (ModuleID) REFERENCES Modules(ModuleID) ON DELETE CASCADE ON UPDATE CASCADE ,
        CourseID INT,
        FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE ON UPDATE CASCADE 
    );




--5 Creation of Learning Activities
    CREATE TABLE Learning_activities(
        int ActivityID PRIMARY KEY IDENTITY,
        activity_type VARCHAR(20),
        instruction_details VARCHAR(20),
        Max_points INT,
        ModuleID INT,
        FOREIGN KEY (ModuleID) REFERENCES Modules(ModuleID) ON DELETE CASCADE ON UPDATE CASCADE ,
        CourseID INT,
        FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE ON UPDATE CASCADE 
    );

--6 Creation of Course Enrollment
    CREATE TABLE Course_enrollment(
        EnrollmentID INT PRIMARY KEY IDENTITY,
        CourseID INT,
        LearnerID INT,
        completion_date DATE,
        enrollment_date DATE,
        status VARCHAR(20),  --status is an attribute
        FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
        FOREIGN KEY (LearnerID) REFERENCES Learner(LearnerID)
    )

--7 Creation of Achievements
CREATE TABLE Achievements(
    AchievementID INT PRIMARY KEY IDENTITY,
    Adescription VARCHAR(20), -- A KEYWORD
    date_earned DATE,
    Atype VARCHAR(20),-- A KEYWORD
    FOREIGN KEY(LearnerID) REFERENCES Learner(LearnerID),
    FOREIGN KEY(BadgesID) REFERENCES Badges(BadgesID),
   );
--8 Creation of Badges
    --Enter code here

--9 Creation of Leaderboards
    CREATE TABLE Leaderboard(
        int BoardID PRIMARY KEY IDENTITY,
        season VARCHAR(20)
    );
    

--10 Creation of Learning Paths
    CREATE TABLE Learning_path (
        pathID INT PRIMARY KEY IDENTITY, 
        LearnerID INT,
        ProfileID INT,
        completion_status VARCHAR(20), 
        custom_content VARCHAR(20), --this needs many characters
        adaptive_rules VARCHAR(20), --this needs many characters
        FOREIGN KEY (LearnerID) REFERENCES PersonalizationProfiles(LearnerID),
        FOREIGN KEY (ProfileID) REFERENCES PersonalizationProfiles(ProfileID)
);


--11 Creation of Interaction Logs
    CREATE TABLE Interaction_logs(
        LogID INT PRIMARY KEY IDENTITY,
        Duration INT ,
        ILTimestamp DATE, -- is this right?, IL KEYWORD
        action_type VARCHAR(20),
        FOREIGN KEY (ActivityID) REFERENCES Learning_activities(ActivityID),
        FOREIGN KEY (LearnerID) REFERENCES Learner(LearnerID),
    );


--12 Creation of Emotional Feedback
    --Enter code here

--13 Creation of Quest
     CREATE TABLE Quest(
        int QuestID PRIMARY KEY IDENTITY,
        difficulty_level VARCHAR(20),
        criteria VARCHAR(20),
        Qdescription VARCHAR(20), --I added the Q as description is a keyword
        title VARCHAR(20),
     );

-- 13 Quest Inheritance
    CREATE TABLE Skill_Mastery(
         int QuestID PRIMARY KEY IDENTITY,
         skill VARCHAR(20),
         PRIMARY KEY (QuestID, skill),
         FOREIGN KEY (QuestID) REFERENCES Quest ON DELETE CASCADE ON UPDATE CASCADE 
    );

    CREATE TABLE Collaborative(
         int QuestID PRIMARY KEY IDENTITY,
         deadline DATE,
         max_num_participants INT,
        FOREIGN KEY (QuestID) REFERENCES Quest ON DELETE CASCADE ON UPDATE CASCADE 
    );

--14 Creation of Rewards
    CREATE TABLE Reward (
        RewardID INT PRIMARY KEY IDENTITY, 
        value INT,
        description VARCHAR(20), ----this needs many characters
        type VARCHAR(20) 
);


--15 Creation of Skill Progression
     CREATE TABLE Skill_Progression(
    SkillProgression_ID INT PRIMARY KEY IDENTITY,
    Proficiency_level VARCHAR(20),
    SKPtimestamp DATE, -- SKP KEYWORD
    FOREIGN KEY (LearnerID) REFERENCES Learner(LearnerID),
    FOREIGN KEY (skill) REFERENCES Skills(skill),


   );


--16 Creation of Assesments
    --Enter code here

--17 Creation of Instructor
    CREATE TABLE Instructor(
        int InstructorID PRIMARY KEY IDENTITY,
        InstructorName VARCHAR(20), --Cahnged to InstructorName as name is a keyword
        latest_qualification VARCHAR(20),
        expertise_area VARCHAR(20),
        email VARCHAR(20)
    );

--17 Relation between the LearningPath and Instructor
    CREATE TABLE Pathreview(
        InstructorID INT,
        PathID INT, 
        Feedback VARCHAR(20),
        PRIMARY KEY (InstructorID, PathID),
        FOREIGN KEY (InstructorID) REFERENCES Instructor ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (PathID) REFERENCES Learning_path ON DELETE CASCADE ON UPDATE CASCADE 
    );

--17 Relation between Emotional Feedback and Instructor
    CREATE TABLE Emotionalfeedback_review(
        FeedbackID INT,
        InstructorID INT,
        feedback VARCHAR(20),
        PRIMARY KEY (FeedbackID, InstructorID),
        FOREIGN KEY (FeedbackID) REFERENCES Emotional_feedback ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (InstructorID) REFERENCES Instructor ON DELETE CASCADE ON UPDATE CASCADE
    );

--18 Creation of Content Library
    CREATE TABLE ContentLibrary (
        ID INT PRIMARY KEY IDENTITY, 
        ModuleID INT,
        CourseID INT,
        Title VARCHAR(20),
        description VARCHAR(20),
        metadata VARCHAR(20),
        type VARCHAR(20), 
        content_URL VARCHAR(20), 
        FOREIGN KEY (ModuleID) REFERENCES Modules(ModuleID),
        FOREIGN KEY (CourseID) REFERENCES Modules(CourseID)
);


--19 Creation of Notifications
     CREATE TABLE Notifications (
    notificationID INT PRIMARY KEY IDENTITY,
    Ntimestamp DATE,-- N KEYWORD
    Nmessage VARCHAR(20),-- N KEYWORD
    urgency_level VARCHAR(20),

   )
   -- creation of received notifications ( relationship between learners and notifications)
   CREATE TABLE receivedNotifications(
notificationID INT,
LearnerID INT,
PRIMARY KEY(notificationID),
PRIMARY KEY(LearnerID),
FOREIGN KEY (LearnerID) REFERENCES Learner(LearnerID),
FOREIGN KEY (notificationID) REFERENCES Notifications(notificationID),

   );


--20 Creation of Disscusion Forums
    --Enter code here

--21 Creation of Learning Goals
    CREATE TABLE Learning_goal(
         int ID PRIMARY KEY IDENTITY,
         status VARCHAR(20),
         deadline DATE,
         Gdescription VARCHAR(20) --Wrote Gdescription instead of description(keyword)
    );

--21 Relation between Learning goals and Learner
    CREATE TABLE LearnersGoals(
        GoalID INT,
        LearnerID INT,
        PRIMARY KEY (GoalID, LearnerID),
        FOREIGN KEY (GoalID) REFERENCES Learning_goal ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (LearnerID) REFERENCES Learner ON DELETE CASCADE ON UPDATE CASCADE
    );

--22 Creation of Surveys
    CREATE TABLE Survey (
        ID INT PRIMARY KEY IDENTITY,
        Title VARCHAR(20)
);

--22 creation of survey multivalued attribute
    CREATE TABLE SurveyQuestions (
        SurveyID INT,
        Question VARCHAR(20), 
        PRIMARY KEY (SurveyID, Question), 
        FOREIGN KEY (SurveyID) REFERENCES Survey(ID) 
);

--relation between surveys and learner
    CREATE TABLE FilledSurvey (
        SurveyID INT,
        Question VARCHAR(20),
        LearnerID INT,
        Answer VARCHAR(20),
        PRIMARY KEY (SurveyID, Question, LearnerID), 
        FOREIGN KEY (SurveyID, Question) REFERENCES SurveyQuestions(SurveyID, Question),
        FOREIGN KEY (LearnerID) REFERENCES Learner(LearnerID)
);