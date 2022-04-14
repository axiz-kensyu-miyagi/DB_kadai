-- 1 �f�[�^�x�[�X�쐬
create database db_exam;


-- 2 major�e�[�u���쐬 OK
CREATE TABLE major(
major_id INT PRIMARY KEY
,major_name VARCHAR(50)
);


-- 3 student�e�[�u���쐬 OK
CREATE TABLE student(
 student_id INT PRIMARY KEY
,student_name VARCHAR(50)
,grade INT
,hometown VARCHAR(50)
,major_id INT NOT NULL REFERENCES major(major_id)
);


-- 4 major�e�[�u���փf�[�^�o�^ OK
insert into major(major_id, major_name)
values 
  (1, '�p���w')
, (2, '���p�Ȋw')
, (3, '���H�w')
, (4, '�o�ϊw')
, (5, '���ە���');


-- 5 student�e�[�u���փf�[�^�o�^ OK
insert into student(student_id, student_name, grade, hometown, major_id)
values 
  (1, '�R�c', 1, '�{��', 1)
, (2, '�c��', 1, '����', 2)
, (3, '����', 1, '����', 3)
, (4, '���', 2, '������', 1)
, (5, '����', 2, '�k�C��', 2)
, (6, '�g�c', 2, '����', 1)
, (7, '�ɓ�', 3, '������', 2)
, (8, '�R�{', 3, '�_�ސ�', 3)
, (9, '�X�{', 4, '����', 4)
, (10, '�g��', 4, '�_�ސ�', 5);



-- 6 student�e�[�u������1
SELECT *
FROM student
WHERE grade=1;


-- 7 student�e�[�u������2
SELECT *
FROM student
WHERE hometown='����';


-- 8 major�e�[�u������
SELECT major_name
FROM major;


-- 9 student�e�[�u���̃��R�[�h�X�V
UPDATE student 
SET grade = '3'
WHERE student_id=10;

-- 9.5 ���R�[�h�X�V��̊m�F
SELECT *
FROM student;


-- 10 student�e�[�u���̃��R�[�h�폜
DELETE FROM student
WHERE student_id=10;

-- 10.5 ���R�[�h�폜��̊m�F
SELECT *
FROM student;



