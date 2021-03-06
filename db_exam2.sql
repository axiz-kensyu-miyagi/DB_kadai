--Kβθ2-ξ{
-- 1 f[^x[Xμ¬
create database db_exam;

-- 2 majore[uμ¬ OK
CREATE TABLE major(
major_id INT PRIMARY KEY
,major_name VARCHAR(50)
);

-- 3 studente[uμ¬ OK
CREATE TABLE student(
 student_id INT PRIMARY KEY
,student_name VARCHAR(50)
,grade INT
,hometown VARCHAR(50)
,major_id INT NOT NULL REFERENCES major(major_id)
);

-- 4 majore[uΦf[^o^ OK
insert into major(major_id, major_name)
values 
  (1, 'pΆw')
, (2, 'pΘw')
, (3, 'ξρHw')
, (4, 'oΟw')
, (5, 'ΫΆ»');

-- 5 studente[uΦf[^o^ OK
insert into student(student_id, student_name, grade, hometown, major_id)
values 
  (1, 'Rc', 1, '{ι', 1)
, (2, 'c', 1, '', 2)
, (3, '²‘', 1, '', 3)
, (4, 'ιΨ', 2, '­', 1)
, (5, '΄', 2, 'kCΉ', 2)
, (6, 'gc', 2, '', 1)
, (7, 'Ι‘', 3, '­', 2)
, (8, 'R{', 3, '_ήμ', 3)
, (9, 'X{', 4, '«κ', 4)
, (10, 'gͺ', 4, '_ήμ', 5);

-- 6 studente[uυ1
SELECT *
FROM student
WHERE grade=1;
-- 7 studente[uυ2
SELECT *
FROM student
WHERE hometown='';
-- 8 majore[uυ
SELECT major_name
FROM major;
-- 9 studente[uΜR[hXV
UPDATE student 
SET grade = '3'
WHERE student_id=10;
-- 10 studente[uΜR[hν
DELETE FROM student
WHERE student_id=10;

--mFp
SELECT *
FROM student;

SELECT *
FROM major;


--2ξ{-1 ANDπAΐΧΦ¦
SELECT *
FROM student
WHERE grade = 1
AND hometown = ''
ORDER BY student_id;
 

--2ξ{-2 ORπALIKEwθAΐΧΦ¦
SELECT *
FROM student
WHERE grade = 1
OR student_name LIKE '%{'
ORDER BY student_id DESC;


--2ξ{-3 GROUP_BYAMAX
SELECT major_id, max(grade)
FROM student
GROUP BY major_id
ORDER BY major_id;


--2ξ{-4 GROUP_BYACOUNTAHAVING
SELECT hometown, count(*)count
FROM student
GROUP BY hometown
HAVING count(*) >= 2
ORDER BY hometown;


--2ξ{-5 JOINAΐΧΦ¦
SELECT student_name, major_name
FROM student AS s
INNER JOIN major as m
ON s.major_id = m.major_id
ORDER BY major_name,student_name;


--2ξ{-6 JOINAπwθAΐΧΦ¦
SELECT student_id, student_name, hometown, major_name
FROM student AS s
INNER JOIN major as m
ON s.major_id = m.major_id AND s.hometown <> ''
ORDER BY major_name,student_id;


--2ξ{-7 TuNG»Μ1
SELECT student_id, student_name, grade
FROM student AS s
WHERE s.major_id = (SELECT major_id 
                    FROM major AS m
                    WHERE major_name = 'pΆw')
ORDER BY student_id;


--2ξ{-8 TuNG»Μ2 IN
SELECT
  s.student_id
 ,s.student_name
 ,s.major_id
FROM student AS s
WHERE s.major_id IN (SELECT major_id  
                     FROM student
                     GROUP BY major_id
                     HAVING count(*) > 2
                     )  
ORDER BY s.major_id
, s.student_id;


--SELECT major_id
--FROM (
--SELECT major_id 
--      ,count(major_id) AS CNT 
--FROM student
--GROUP BY major_id
--) mj
--WHERE mj.CNT > 2
--TuNGΰΜFROMπTuNGΕgpΕ«ι


