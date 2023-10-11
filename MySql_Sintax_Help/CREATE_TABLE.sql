CREATE DATABASE learner_academy;

USE learner_academy;

SHOW TABLES;


CREATE TABLE teachers (teachers_id SMALLINT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
first_name VARCHAR(20) NOT NULL ,
second_name VARCHAR(20) NOT NULL ,
age TINYINT(20) NOT NULL ,
salary INTEGER NOT NULL);

CREATE TABLE subjects(subject_id SMALLINT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY ,
subject_name VARCHAR(20) NOT NULL );

CREATE TABLE students(student_id SMALLINT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY ,
first_name VARCHAR(20) NOT NULL UNIQUE ,
second_name VARCHAR(20) NOT NULL UNIQUE ,
age TINYINT NOT NULL CHECK (age > 1 AND age < 22),
marks SMALLINT NOT NULL,
parents_num INTEGER NOT NULL,
fees INTEGER NOT NULL);


CREATE TABLE classes(
class_number TINYINT NOT NULL UNIQUE CHECK (class_number > 0 AND class_number < 13),
student_id SMALLINT UNIQUE,
PRIMARY KEY (class_number,student_id),
FOREIGN KEY (student_id) REFERENCES students(student_id));


CREATE TABLE teacher_subject(teachers_id SMALLINT NOT NULL,
 subject_id SMALLINT NOT NULL ,
 PRIMARY KEY (teachers_id,subject_id),
 FOREIGN KEY (teachers_id) REFERENCES teachers(teachers_id),
 FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);


CREATE TABLE classes_subject(
    classes_id SMALLINT NOT NULL,
    subject_id SMALLINT NOT NULL ,
    PRIMARY KEY (classes_id,subject_id),
    FOREIGN KEY (classes_id) REFERENCES classes(class_number),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);


CREATE TABLE teachers_subject_classes(teachers_id SMALLINT NOT NULL
                                     ,subject_id SMALLINT NOT NULL
                                     ,classes_id SMALLINT NOT NULL,
                                     PRIMARY KEY (teachers_id,subject_id,classes_id),
                                      FOREIGN KEY (teachers_id) REFERENCES teachers(teachers_id) ON DELETE CASCADE,
                                      FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
                                      FOREIGN KEY (classes_id) REFERENCES classes(class_number));


/*ALTER TABLE classes ADD CONSTRAINT classes_number CHECK ( classes_number < 13);*/
/*ALTER TABLE classes MODIFY student_id SMALLINT UNIQUE;*/
/*DESCRIBE teach;

ALTER TABLE teach MODIFY class_id MEDIUMINT;

DESCRIBE teach;
*/