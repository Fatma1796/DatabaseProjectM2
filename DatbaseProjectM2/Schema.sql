-- Write your own SQL object definition here, and it'll be included in your package.
CREATE DATABASE CAT
CREATE TABLE cat (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    EnrollmentDate DATE
);

-- Insert data into the table
INSERT INTO cat (StudentID, FirstName, LastName, EnrollmentDate)
VALUES
(1, 'John', 'Doe', '2024-01-15'),
(2, 'Jane', 'Smith', '2024-02-20');

-- Retrieve data from the table
SELECT * FROM cat;