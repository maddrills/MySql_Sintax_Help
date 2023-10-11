DROP TABLE teachers,subjects,teachers_subject_classes,students,classes,teacher_subject,classes_subject;

DROP TABLE students;
DROP TABLE teachers_subject_classes,classes;

DROP TABLE teachers_subject_classes;

ALTER TABLE teachers MODIFY salary MEDIUMINT NOT NULL CHECK ( salary > 10000);

DELETE FROM teachers WHERE salary > 10;


DELETE teacher_subject FROM teacher_subject WHERE teachers_id = ?;
DELETE teachers FROM teachers WHERE teachers_id = ?;
DELETE teachers_subject_classes FROM teachers_subject_classes WHERE teachers_id = ?;


DELETE FROM teacher_subject AS ts WHERE (ts.teachers_id,ts.subject_id)
IN ((1,1));

DELETE FROM teachers_subject_classes AS tsc WHERE(tsc.teachers_id,tsc.subject_id)
IN ((4,5));

DELETE tsc,ts
       FROM teachers_subject_classes AS tsc
INNER JOIN teacher_subject AS ts ON tsc.subject_id = 5 AND tsc.teachers_id = 4
                                        AND tsc.teachers_id = ts.teachers_id;
