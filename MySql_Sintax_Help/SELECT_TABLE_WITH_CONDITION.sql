INSERT INTO students(first_name, second_name,age,marks,parents_num,fees) VALUE ('akm','ashok',14,30,5732651,20000);
INSERT INTO students(first_name, second_name,age,marks,parents_num,fees) VALUE ('vio','fra',10,30,8473823,30000);
INSERT INTO students(first_name, second_name,age,marks,parents_num,fees) VALUE ('geo','var',12,30,2938721,15000);
INSERT INTO students(first_name, second_name,age,marks,parents_num,fees) VALUE ('tes','fra',7,30,847653,16000);
INSERT INTO students(first_name, second_name,age,marks,parents_num,fees) VALUE ('fra','var',17,30,152334,12000);


INSERT INTO students(first_name, second_name,age,marks,parents_num,fees)
    VALUE ('mat','damon',13,30,152334,12000);
INSERT INTO classes(class_number,student_id)
    SELECT c.class_number,c.student_id
    FROM classes AS c WHERE c.student_id IN (SELECT student_id FROM students WHERE first_name = 'mat' AND second_name = 'damon');


SELECT CONCAT(s.first_name ,' ',s.second_name)
    AS fullName,s.age,s.marks,s.parents_num,s.fees,c.class_number
FROM students AS s
    JOIN classes AS c ON s.student_id NOT IN (c.student_id);


SELECT tsc.subject_id FROM teachers_subject_classes AS tsc
    JOIN teacher_subject AS ts ON tsc.subject_id = ts.subject_id WHERE ts.teachers_id = 4;


SELECT s.subject_name FROM subjects AS s
    JOIN teacher_subject AS ts ON s.subject_id = ts.subject_id
    WHERE ts.teachers_id IN (SELECT teachers_id FROM teachers WHERE ts.teachers_id = 4);


SELECT s.subject_id,s.subject_name FROM subjects AS s
WHERE s.subject_id NOT IN (SELECT ts.subject_id
                           FROM teacher_subject AS ts
                           WHERE s.subject_id = ts.subject_id AND ts.teachers_id = 4);


SELECT CONCAT(t.first_name,' ',t.second_name) AS 'full_name',tsc.classes_id,t.age,t.salary,ts.subject_id
FROM teachers AS t
    RIGHT JOIN teachers_subject_classes AS tsc ON t.teachers_id = tsc.teachers_id
    RIGHT JOIN teacher_subject AS ts ON t.teachers_id = ts.teachers_id;


/* shows all teachers data */
SELECT CONCAT(t.first_name,' ',t.second_name) AS 'full_name',t.age,t.salary,ts.subject_id,tsc.classes_id
FROM teachers AS t
    LEFT JOIN teacher_subject AS ts ON t.teachers_id = ts.teachers_id
    LEFT JOIN teachers_subject_classes AS tsc ON t.teachers_id = tsc.teachers_id
WHERE t.teachers_id = 1;


SELECT CONCAT(t.first_name,' ',t.second_name) AS 'full_name',t.age,t.salary,s.subject_name,tsc.classes_id
FROM teachers AS t
    LEFT JOIN teacher_subject AS ts ON t.teachers_id = ts.teachers_id
    LEFT JOIN teachers_subject_classes AS tsc ON tsc.teachers_id = t.teachers_id
    LEFT JOIN subjects AS s ON ts.subject_id = s.subject_id
WHERE t.teachers_id = 4;




SELECT CONCAT(t.first_name,' ',t.second_name) AS 'full_name',t.age,t.salary,s.subject_name,tsc.classes_id
FROM teachers AS t
    LEFT JOIN teacher_subject AS ts ON t.teachers_id = ts.teachers_id
    LEFT JOIN classes_subject AS cs ON ts.subject_id = cs.subject_id
    LEFT JOIN subjects AS s ON s.subject_id = ts.subject_id
    LEFT JOIN teachers_subject_classes AS tsc ON tsc.subject_id = cs.subject_id
WHERE t.teachers_id = 4;



SELECT CONCAT(o.first_name,' ',o.second_name) AS 'full_name' ,c.class_number
FROM students AS o
    JOIN classes AS c
    ON o.student_id = c.student_id
    JOIN teachers_subject_classes AS tsc ON c.classes_id = tsc.classes_id;

SELECT s.subject_name, CONCAT(t.first_name,' ',t.second_name) AS 'teacher full_name',c.class_number
FROM subjects AS s LEFT OUTER JOIN teachers_subject_classes tsc on s.subject_id = tsc.subject_id
LEFT OUTER JOIN teachers AS t ON tsc.teachers_id = t.teachers_id LEFT OUTER JOIN classes c on tsc.classes_id = c.classes_id
;

SELECT CONCAT(s.first_name,' ',s.second_name) AS student_fullname,
       subject_name,c.class_number,CONCAT(t.first_name,' ',t.second_name) AS Teachers_name
FROM subjects
    LEFT JOIN teachers_subject_classes AS tsc
        ON subjects.subject_id = tsc.subject_id
    LEFT JOIN classes AS c
        ON c.classes_id = tsc.classes_id
    LEFT JOIN teachers AS t
        on tsc.teachers_id = t.teachers_id
    LEFT JOIN students AS s ON c.student_id = s.student_id;