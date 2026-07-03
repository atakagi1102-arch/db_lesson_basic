-- Q1
CREATE TABLE departments (
  department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Q2
ALTER TABLE people ADD COLUMN department_id INT UNSIGNED AFTER email;

-- Q3
INSERT INTO departments (name) VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name, department_id) VALUES
('営業太郎', 1),
('営業花子', 1),
('営業次郎', 1),
('開発一郎', 2),
('開発二郎', 2),
('開発三郎', 2),
('開発四郎', 2),
('経理太郎', 3),
('人事太郎', 4),
('情報太郎', 5);


INSERT INTO reports (person_id, content) VALUES
(1, '今月の営業成績を整理しました'),
(2, '新規顧客との打ち合わせを実施しました'),
(3, '既存顧客のフォローアップを完了しました'),
(4, '新機能の設計ドキュメントを作成しました'),
(5, 'バグ修正を3件完了しました'),
(6, 'テストケースの作成を進めました'),
(7, 'コードレビューを実施しました'),
(8, '決算書の作成を開始しました'),
(9, '新入社員の研修スケジュールを決定しました'),
(10, 'サーバー保守作業を完了しました');


-- Q4
UPDATE people SET department_id = 1 WHERE person_id = 1;
UPDATE people SET department_id = 2 WHERE person_id = 2;
UPDATE people SET department_id = 3 WHERE person_id = 3;
UPDATE people SET department_id = 4 WHERE person_id = 4;
UPDATE people SET department_id = 1 WHERE person_id = 6;

-- Q5
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

-- Q6
テーブル・レコード・カラムという3つの単語を適切に使用して、下記のSQL文を日本語で説明してください。


SELECT
  `name`, `email`, `age`
  名前、メアド、年齢の３つのカラム
FROM
  `people`
  →peopleテーブルから
WHERE
  `department_id` = 1
  →department_id(営業部)カラムの値が1のレコードを抽出
ORDER BY
  `created_at`;
  →作成日時の順で並び替える

まとめて
営業部全社員の名前、メアド、年齢を、作成日時の順に並べて表示する。

-- Q7
SELECT name FROM people WHERE (age >= 20 AND age < 30 AND gender = 2) OR (age >= 40 AND age < 50 AND gender = 1);

-- Q8 
SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;

-- Q9
SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 2;

-- Q10
SELECT people.name, departments.name, reports.content
FROM people
INNER JOIN departments ON people.department_id = departments.department_id
INNER JOIN reports ON people.person_id = reports.person_id;

-- Q11
SELECT people.name FROM people LEFT JOIN reports ON people.person_id = reports.person_id WHERE reports.person_id IS NULL;