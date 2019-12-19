CREATE SCHEMA `LC_SQL_university_project_schema_final` ;
USE `LC_SQL_university_project_schema_final` ;

# Create tables
CREATE TABLE `LC_SQL_university_project_schema_final`.`students` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `student_name` VARCHAR(45) NOT NULL
  PRIMARY KEY (`student_id`),
  UNIQUE INDEX `student_id_UNIQUE` (`student_id` ASC) VISIBLE;
  
  CREATE TABLE `LC_SQL_university_project_schema_final`.`courses` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(45) NOT NULL,
  `course_professor_id` INT NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE INDEX `course_id_UNIQUE` (`course_id` ASC) VISIBLE,
  UNIQUE INDEX `course_name_UNIQUE` (`course_name` ASC) VISIBLE);
  
  CREATE TABLE `LC_SQL_university_project_schema_final`.`professors` (
  `professor_id` INT NOT NULL AUTO_INCREMENT,
  `professor_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`professor_id`),
  UNIQUE INDEX `professor_id_UNIQUE` (`professor_id` ASC) VISIBLE);
  
  CREATE TABLE `LC_SQL_university_project_schema_final`.`grades` (
  `grade_id` INT NOT NULL AUTO_INCREMENT,
  `grade_final` INT NOT NULL,
  `grade_student_id` INT NOT NULL,
  `grade_course_id` INT NOT NULL,
  PRIMARY KEY (`grade_id`),
  UNIQUE INDEX `grade_id_UNIQUE` (`grade_id` ASC) VISIBLE);

#Now create foreign keys for grades
ALTER TABLE `LC_SQL_university_project_schema_final`.`grades` 
ADD INDEX `grade_id_idx` (`grade_student_id` ASC) VISIBLE,
ADD INDEX `grade_course_id_idx` (`grade_course_id` ASC) VISIBLE;
;
ALTER TABLE `LC_SQL_university_project_schema_final`.`grades` 
ADD CONSTRAINT `grade_student_id`
  FOREIGN KEY (`grade_student_id`)
  REFERENCES `LC_SQL_university_project_schema_final`.`students` (`student_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `grade_course_id`
  FOREIGN KEY (`grade_course_id`)
  REFERENCES `LC_SQL_university_project_schema_final`.`courses` (`course_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

# Create foreign keys for courses
ALTER TABLE `LC_SQL_university_project_schema_final`.`courses` 
ADD CONSTRAINT `coure_professor_id`
  FOREIGN KEY (`course_professor_id`)
  REFERENCES `LC_SQL_university_project_schema_final`.`professors` (`professor_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

# Populate Professors Table
USE `LC_SQL_university_project_schema_final` ;
DELIMITER $$
DROP PROCEDURE IF EXISTS professors$$
CREATE PROCEDURE professors()
BEGIN
	DECLARE i INT default 1;
    WHILE i <= 4 DO
		INSERT INTO professors (professor_name)
		VALUES (CONCAT("Professor", i));
		SET i = i + 1;
	END WHILE;
END$$
DELIMITER ;
CALL professors();
DROP PROCEDURE professors;
SELECT *
FROM professors;

# Populate Students Table
DELIMITER $$
DROP PROCEDURE IF EXISTS students$$
CREATE PROCEDURE students()
BEGIN
	DECLARE i INT default 1;
    WHILE i <= 30 DO
		INSERT INTO students (student_name)
		VALUES (CONCAT("Student", i));
		SET i = i + 1;
	END WHILE;
END$$
DELIMITER ;
CALL students();
DROP PROCEDURE students;
SELECT *
FROM students;

# Populate Courses Table
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO courses(course_name, course_professor_id)
VALUES("Course1", 1);
INSERT INTO courses(course_name, course_professor_id)
VALUES("Course2", 1);
INSERT INTO courses(course_name, course_professor_id)
VALUES("Course3", 2);
INSERT INTO courses(course_name, course_professor_id)
VALUES("Course4", 2);
INSERT INTO courses(course_name, course_professor_id)
VALUES("Course5", 2);
INSERT INTO courses(course_name, course_professor_id)
VALUES("Course6", 3);
SELECT *
FROM courses;
SET FOREIGN_KEY_CHECKS=1;

# Populate Grades Table
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(1, 1, 95);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(1, 2, 95);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(1, 3, 95);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(2, 2, 95);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(2, 3, 84);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(2, 4, 84);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(3, 3, 84);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(3, 4, 74);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(3, 5, 74);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(4, 4, 74);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(4, 5, 87);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(4, 6, 87);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(5, 5, 90);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(5, 6, "50");
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(5, 1, 100);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(6, 6, 87);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(6, 1, 90);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(6, 2, 84);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(7, 1, 100);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(7, 2, 84);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(7, 3, 95);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(8, 2, 95);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(8, 3, 84);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(8, 4, 74);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(9, 3, 84);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(9, 4, 84);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(9, 5, 84);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(10, 4, 95);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(10, 5, 77);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(10, 6, 90);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(11, 5, 80);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(11, 6, 90);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(11, 1, 80);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(12, 6, 95);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(12, 1, 95);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(12, 2, 87);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(13, 1, 70);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(13, 2, 90);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(13, 3, 95);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(14, 2, 77);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(14, 3, 84);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(14, 4, 90);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(15, 3, 100);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(15, 4, 95);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(15, 5, 90);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(16, 4, 77);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(16, 5, 90);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(16, 6, 87);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(17, 5, 70);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(17, 6, 87);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(17, 1, 84);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(18, 6, 90);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(18, 1, 87);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(18, 2, 90);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(19, 1, 65);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(19, 2, 84);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(19, 3, 87);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(20, 2, 90);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(20, 3, 77);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(20, 4, 90);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(21, 3, 85);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(21, 4, 87);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(21, 5, 83);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(22, 4, 70);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(22, 5, 100);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(22, 6, 57);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(23, 5, 89);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(23, 6, 93);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(23, 1, 97);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(24, 6, 90);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(24, 1, 89);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(24, 2, 95);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(25, 1, 78);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(25, 2, 79);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(25, 3, 98);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(26, 2, 87);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(26, 3, 100);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(26, 4, 69);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(27, 3, 89);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(27, 4, 90);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(27, 5, 87);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(28, 4, 81);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(28, 5, 72);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(28, 6, 78);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(29, 5, 90);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(29, 6, 79);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(29, 1, 84);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(30, 6, 93);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(30, 1, 82);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(30, 2, 100);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(31, 3, 100);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(31, 4, 100);
INSERT INTO grades(grade_student_id, grade_course_id, grade_final)
VALUES(31, 5, 100);
SELECT *
FROM grades;
SET FOREIGN_KEY_CHECKS=1;

# Average grade given by professor - done
SELECT p.professor_name AS "Professor", AVG(g.grade_final) as "Average Grade"
FROM courses c
JOIN professors p
ON  c.course_professor_id = p.professor_id
JOIN grades g
ON c.course_id = g.grade_course_id
GROUP BY p.professor_name;

# The top grades for each student - done
SELECT s.student_id AS "Student",
	MAX(g.grade_final) AS "Top Grade"
FROM grades g
JOIN students s
ON g.grade_student_id = s.student_id
GROUP BY s.student_id;

# Group students by the courses that they are enrolled in - done
SELECT c.course_name AS "Course", s.student_name AS "Student"
FROM grades g
JOIN students s ON s.student_id = g.grade_student_id
JOIN courses c ON  c.course_id = g.grade_course_id 
GROUP BY g.grade_course_id, s.student_name;

# Create a summary report of courses and their average grades, sorted by the most challenging course (course with the lowest average grade) to the easiest course - done
SELECT c.course_name AS "Course", AVG(g.grade_final) as "Average Grade"
FROM grades g
JOIN courses c
ON c.course_id = g.grade_course_id
GROUP BY c.course_id
ORDER BY AVG(g.grade_final) ASC;

# Finding which student and professor have the most courses in common - done
SELECT student_name AS "Student", professor_name AS "Professor", COUNT(*) AS classes_in_common
FROM grades
JOIN students
ON grades.grade_student_id = student_id
JOIN courses
ON grades.grade_course_id = course_id
JOIN professors
ON courses.course_professor_id = professor_id
GROUP BY student_name, professor_name
ORDER BY classes_in_common DESC
LIMIT 1;


