USE Project

-- Insert data into Learner table
INSERT INTO Learner (first_name, last_name, gender, birth_date, country, cultural_background)
VALUES 
('Alice', 'Smith', 'Female', '1995-05-12', 'Germany', 'Western'),
('Bob', 'Johnson', 'Male', '1990-08-22', 'USA', 'Western'),
('Charlie', 'Brown', 'Male', '2000-03-15', 'India', 'Asian'),
('Diana', 'Williams', 'Female', '1998-10-10', 'Canada', 'Western');

-- Insert data into Skills table
INSERT INTO Skills (LearnerID, skill)
VALUES 
(1, 'Programming'),
(1, 'Data Analysis'),
(2, 'Machine Learning'),
(3, 'Cybersecurity'),
(4, 'Web Development'),
(4, 'UI/UX Design');

-- Insert data into LearningPreference table
INSERT INTO LearningPreference (LearnerID, preference)
VALUES 
(1, 'Visual'),
(2, 'Textual'),
(3, 'Hands-On'),
(4, 'Auditory');

-- Insert data into PersonalizationProfiles table
INSERT INTO PersonalizationProfiles (LearnerID, Prefered_content_type, emotional_state, personality_type)
VALUES 
(1, 'Video', 'Happy', 'Introvert'),
(2, 'Text', 'Neutral', 'Extrovert'),
(3, 'Interactive', 'Anxious', 'Ambivert'),
(4, 'Audio', 'Excited', 'Introvert');

-- Insert data into HealthCondition table
INSERT INTO HealthCondition (LearnerID, ProfileID, Condition)
VALUES
(1, 1, 'Asthma'),
(2, 2, 'None'),
(3, 3, 'Diabetes'),
(4, 4, 'Allergies');

-- Insert data into Courses table
INSERT INTO Courses (Title, learning_objective, credit_points, difficulty_level, pre_requisites, Cdescription)
VALUES
('Introduction to Programming', 'Learn basic programming concepts', 5, 'Beginner', NULL, 'Covers Python basics'),
('Data Science', 'Analyze data effectively', 8, 'Intermediate', 'Introduction to Programming', 'Advanced data analysis techniques'),
('Cybersecurity Basics', 'Understand cybersecurity', 6, 'Beginner', NULL, 'Covers basic security principles'),
('Web Development', 'Build modern websites', 7, 'Intermediate', 'Introduction to Programming', 'Frontend and backend web development');

-- Insert data into Modules table
INSERT INTO Modules (Title, difficulty, CourseID, contentURL)
VALUES
('Python Basics', 'Beginner', 1, 'https://example.com/python'),
('Data Cleaning', 'Intermediate', 2, 'https://example.com/datacleaning'),
('Network Security', 'Beginner', 3, 'https://example.com/networksecurity'),
('Frontend Development', 'Intermediate', 4, 'https://example.com/frontend');

-- Insert data into Target_traits table
INSERT INTO Target_traits (ModuleID, CourseID, Trait)
VALUES
(1, 1, 'Logical Thinking'),
(2, 2, 'Attention to Detail'),
(3, 3, 'Problem Solving'),
(4, 4, 'Creativity');

-- Insert data into ModuleContent table
INSERT INTO ModuleContent (ModuleID, CourseID, content, type)
VALUES
(1, 1, 'Python Introduction', 'Text'),
(2, 2, 'Data Wrangling Techniques', 'Video'),
(3, 3, 'Network Protocols Overview', 'Interactive'),
(4, 4, 'HTML and CSS Basics', 'Hands-On');

-- Insert data into Learning_activities table
INSERT INTO Learning_activities (activity_type, instruction_details, Max_points, ModuleID, CourseID)
VALUES
('Quiz', 'Answer 10 questions', 10, 1, 1),
('Assignment', 'Clean a dataset', 20, 2, 2),
('Lab', 'Secure a network', 15, 3, 3),
('Project', 'Build a portfolio website', 25, 4, 4);

-- Insert data into Course_enrollment table
INSERT INTO Course_enrollment (CourseID, LearnerID, completion_date, enrollment_date, status)
VALUES
(1, 1, NULL, '2024-01-10', 'Enrolled'),
(2, 2, NULL, '2024-02-15', 'Enrolled'),
(3, 3, '2024-05-12', '2024-03-01', 'Completed'),
(4, 4, NULL, '2024-04-20', 'Enrolled');

-- Insert data into Badge table
INSERT INTO Badge (title, Bdescription, criteria, points)
VALUES
('Python Mastery', 'Awarded for mastering Python', 'Complete all Python modules', 50),
('Data Scientist', 'Awarded for completing Data Science course', 'Score > 90% in the course', 100),
('Cybersecurity Expert', 'Awarded for mastering cybersecurity', 'Complete all cybersecurity modules', 75),
('Web Developer', 'Awarded for building a portfolio website', 'Submit project on time', 80);

-- Insert data into Achievements table
INSERT INTO Achievements (Adescription, date_earned, Atype, LearnerID, BadgeID)
VALUES
('Completed Python Basics', '2024-06-01', 'Module', 1, 1),
('Completed Data Science', '2024-07-10', 'Course', 2, 2),
('Completed Cybersecurity Basics', '2024-05-15', 'Course', 3, 3),
('Completed Web Development', '2024-08-20', 'Course', 4, 4);

-- Insert data into Leaderboard table
INSERT INTO Leaderboard (season)
VALUES
('Spring 2024'),
('Summer 2024');

-- Insert data into Learning_path table
INSERT INTO Learning_path (LearnerID, ProfileID, completion_status, custom_content, adaptive_rules)
VALUES
(1, 1, 'In Progress', 'Python Tutorials', 'Adaptive based on quiz results'),
(2, 2, 'Completed', 'Data Science Projects', 'Fixed structure'),
(3, 3, 'In Progress', 'Network Labs', 'Adaptive based on feedback'),
(4, 4, 'In Progress', 'Web Development Exercises', 'Dynamic updates');

-- Insert data into Interaction_logs table
INSERT INTO Interaction_logs (Duration, ILTimestamp, action_type, ActivityID, LearnerID)
VALUES
(30, '2024-05-01', 'Quiz Submission', 1, 1),
(45, '2024-06-01', 'Assignment Submission', 2, 2),
(60, '2024-07-01', 'Lab Completion', 3, 3),
(90, '2024-08-01', 'Project Submission', 4, 4);

-- Insert data into Instructor table
INSERT INTO Instructor (InstructorName, latest_qualification, expertise_area, email)
VALUES
('Dr. Smith', 'PhD in Computer Science', 'Programming', 'smith@example.com'),
('Dr. Brown', 'PhD in Data Science', 'Data Analysis', 'brown@example.com'),
('Dr. Taylor', 'PhD in Cybersecurity', 'Security', 'taylor@example.com'),
('Dr. Wilson', 'PhD in Web Development', 'Frontend', 'wilson@example.com');

-- Insert data into Emotional_feedback table
INSERT INTO Emotional_feedback (emotional_state, LearnerID)
VALUES
('Happy', 1),
('Neutral', 2),
('Anxious', 3),
('Excited', 4);

-- Insert data into Emotionalfeedback_review table
INSERT INTO Emotionalfeedback_review (FeedbackID, InstructorID, feedback)
VALUES
(1, 1, 'Encouraging'),
(2, 2, 'Motivational'),
(3, 3, 'Supportive'),
(4, 4, 'Positive');

-- Insert data into Quest table
INSERT INTO Quest (difficulty_level, criteria, Qdescription, title)
VALUES
('Easy', 'Solve Python Basics', 'Python Challenge', 'Python Quest'),
('Medium', 'Clean a Dataset', 'Data Science Challenge', 'Data Quest'),
('Hard', 'Secure a Network', 'Cybersecurity Challenge', 'Security Quest'),
('Hard', 'Build a Website', 'Web Development Challenge', 'Web Quest');

-- Insert data into Skill_Mastery table
INSERT INTO Skill_Mastery (QuestID, skill)
VALUES
(1, 'Programming'),
(2, 'Data Analysis'),
(3, 'Cybersecurity'),
(4, 'Web Development');

-- Insert data into Collaborative table
INSERT INTO Collaborative (QuestID, deadline, max_num_participants)
VALUES
(1, '2024-12-01', 10),
(2, '2024-12-15', 20),
(3, '2024-11-30', 5),
(4, '2024-12-20', 15);

-- Insert data into Reward table
INSERT INTO Reward (Rvalue, Rdescription, Rtype)
VALUES
(100, 'Python Reward', 'Achievement'),
(200, 'Data Science Reward', 'Achievement'),
(150, 'Cybersecurity Reward', 'Achievement'),
(250, 'Web Development Reward', 'Achievement');

-- Insert data into Skill_Progression table
INSERT INTO Skill_Progression (Proficiency_level, SKPtimestamp, LearnerID, skill_name)
VALUES
('Beginner', '2024-05-01', 1, 'Programming'),
('Intermediate', '2024-06-01', 2, 'Data Analysis'),
('Advanced', '2024-07-01', 3, 'Cybersecurity'),
('Expert', '2024-08-01', 4, 'Web Development');

-- Insert data into Assessments table
INSERT INTO Assessments (type, total_marks, passing_marks, criteria, weightage, description, title, ModuleID, CourseID)
VALUES
('Quiz', 10, 5, 'Basic Knowledge', 20, 'Python Quiz', 'Python Assessment', 1, 1),
('Assignment', 20, 10, 'Data Cleaning', 30, 'Data Assignment', 'Data Assessment', 2, 2),
('Lab', 15, 10, 'Network Security', 25, 'Security Lab', 'Security Assessment', 3, 3),
('Project', 25, 15, 'Frontend Skills', 40, 'Web Project', 'Web Assessment', 4, 4);

-- Insert data into Pathreview table
INSERT INTO Pathreview (InstructorID, PathID, Feedback)
VALUES
(1, 1, 'Good Progress'),
(2, 2, 'Excellent Work'),
(3, 3, 'Keep Improving'),
(4, 4, 'Well Done');

-- Insert data into ContentLibrary table
INSERT INTO ContentLibrary (ModuleID, CourseID, Title, description, metadata, type, content_URL)
VALUES
(1, 1, 'Python Basics Content', 'Basic Python Tutorials', 'Metadata1', 'Video', 'https://example.com/python-basics'),
(2, 2, 'Data Cleaning Content', 'Advanced Data Cleaning', 'Metadata2', 'Text', 'https://example.com/data-cleaning'),
(3, 3, 'Network Security Content', 'Secure Network Labs', 'Metadata3', 'Interactive', 'https://example.com/network-security'),
(4, 4, 'Web Development Content', 'Modern Web Development', 'Metadata4', 'Hands-On', 'https://example.com/web-development');

-- Insert data into Notifications table
INSERT INTO Notifications (Ntimestamp, Nmessage, urgency_level)
VALUES
('2024-11-01', 'Upcoming Quiz', 'High'),
('2024-12-01', 'Assignment Submission Due', 'Medium'),
('2024-12-15', 'Lab Deadline', 'High'),
('2024-12-20', 'Project Submission Deadline', 'Critical');

-- Insert data into receivedNotifications table
INSERT INTO receivedNotifications (notificationID, LearnerID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Insert data into Discussion_forum table
INSERT INTO Discussion_forum (title, last_active, description, ModuleID, CourseID)
VALUES
('Python Forum', '2024-11-15', 'Discuss Python Basics', 1, 1),
('Data Science Forum', '2024-12-01', 'Discuss Data Cleaning', 2, 2),
('Security Forum', '2024-11-20', 'Discuss Network Security', 3, 3),
('Web Development Forum', '2024-12-05', 'Discuss Web Projects', 4, 4);

-- Insert data into LearnerDiscussion table
INSERT INTO LearnerDiscussion (time, ForumID, LearnerID)
VALUES
('10:30:00', 1, 1),
('11:00:00', 2, 2),
('15:45:00', 3, 3),
('16:20:00', 4, 4);

-- Insert data into Learning_goal table
INSERT INTO Learning_goal (status, deadline, Gdescription)
VALUES
('In Progress', '2024-12-31', 'Complete Python Basics'),
('Completed', '2024-11-15', 'Finish Data Cleaning'),
('In Progress', '2024-12-01', 'Secure a Network'),
('In Progress', '2024-12-20', 'Build a Portfolio Website');

-- Insert data into LearnersGoals table
INSERT INTO LearnersGoals (GoalID, LearnerID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Insert data into Survey table
INSERT INTO Survey (Title)
VALUES
('Python Survey'),
('Data Science Survey'),
('Cybersecurity Survey'),
('Web Development Survey');

-- Insert data into SurveyQuestions table
INSERT INTO SurveyQuestions (SurveyID, Question)
VALUES
(1, 'Did you enjoy learning Python?'),
(2, 'Was the data cleaning process clear?'),
(3, 'Did you understand network security concepts?'),
(4, 'Was web development engaging?');

-- Insert data into FilledSurvey table
INSERT INTO FilledSurvey (SurveyID, Question, LearnerID, Answer)
VALUES
(1, 'Did you enjoy learning Python?', 1, 'Yes'),
(2, 'Was the data cleaning process clear?', 2, 'Yes'),
(3, 'Did you understand network security concepts?', 3, 'No'),
(4, 'Was web development engaging?', 4, 'Yes');