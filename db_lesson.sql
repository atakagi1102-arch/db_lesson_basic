-- データベース作成
CREATE DATABASE db_lesson;
USE db_lesson;

-- peopleテーブル作成
CREATE TABLE people (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  password CHAR(8)
);

-- reportsテーブル作成
CREATE TABLE reports (
  report_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  person_id INT UNSIGNED NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- peopleテーブル
INSERT INTO people (id, name, email, password) VALUES
(1, '鈴木たかし', 'suzuki@example.com', 'pass0001'),
(2, '田中ゆうこ', 'tanaka@example.com', 'pass0002'),
(3, '福田だいすけ', 'fukuda@example.com', 'pass0003'),
(4, '豊島はなこ', 'toyoshima@example.com', 'pass0004'),
(5, '早坂てつお', 'hayasaka@example.com', 'pass0005');

-- reportsテーブル
INSERT INTO reports (person_id, content) VALUES
(1, '今日のタスク完了しました'),
(1, '今日はDBの学習をしました。'),
(2, 'エラー修正に苦戦しました。'),
(2, 'テキストを作成しました。'),
(2, '研修はインプットが楽しいです。'),
(3, 'データベースの操作に慣れていきたいです。'),
(3, 'コードレビューを実施しました。'),
(4, '新機能の設計を開始しました'),
(4, 'チームミーティング開催'),
(5, 'プロジェクト進捗確認をしました'),
(999, '存在しないユーザーの日報');