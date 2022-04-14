-- 1 データベース作成
create database db_exam;


-- 2 majorテーブル作成 OK
CREATE TABLE major(
major_id INT PRIMARY KEY
,major_name VARCHAR(50)
);


-- 3 studentテーブル作成 OK
CREATE TABLE student(
 student_id INT PRIMARY KEY
,student_name VARCHAR(50)
,grade INT
,hometown VARCHAR(50)
,major_id INT NOT NULL REFERENCES major(major_id)
);


-- 4 majorテーブルへデータ登録 OK
insert into major(major_id, major_name)
values 
  (1, '英文学')
, (2, '応用科学')
, (3, '情報工学')
, (4, '経済学')
, (5, '国際文化');


-- 5 studentテーブルへデータ登録 OK
insert into student(student_id, student_name, grade, hometown, major_id)
values 
  (1, '山田', 1, '宮城', 1)
, (2, '田中', 1, '東京', 2)
, (3, '佐藤', 1, '東京', 3)
, (4, '鈴木', 2, '鹿児島', 1)
, (5, '高橋', 2, '北海道', 2)
, (6, '吉田', 2, '東京', 1)
, (7, '伊藤', 3, '鹿児島', 2)
, (8, '山本', 3, '神奈川', 3)
, (9, '森本', 4, '沖縄', 4)
, (10, '吉岡', 4, '神奈川', 5);



-- 6 studentテーブル検索1
SELECT *
FROM student
WHERE grade=1;


-- 7 studentテーブル検索2
SELECT *
FROM student
WHERE hometown='東京';


-- 8 majorテーブル検索
SELECT major_name
FROM major;


-- 9 studentテーブルのレコード更新
UPDATE student 
SET grade = '3'
WHERE student_id=10;

-- 9.5 レコード更新後の確認
SELECT *
FROM student;


-- 10 studentテーブルのレコード削除
DELETE FROM student
WHERE student_id=10;

-- 10.5 レコード削除後の確認
SELECT *
FROM student;



