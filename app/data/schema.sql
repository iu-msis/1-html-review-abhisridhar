CREATE DATABASE IF NOT EXISTS msisdb;
USE msisdb;

DROP TABLE IF EXISTS student;
CREATE TABLE student (
	id int PRIMARY KEY AUTO_INCREMENT ,
    username varchar(24) UNIQUE NOT NULL,
    name varchar(48)
);

INSERT INTO student (id, username, name) VALUES 
(1, 'tomgreg', 'Tom Gregory'),
(2, 'beth1', 'Beth Barnhart'),
(3, 'bipin', 'Prof. Prabhakar');

-- SELECT * FROM students;

DROP TABLE IF EXISTS offer;
CREATE TABLE offer (
	id int PRIMARY KEY AUTO_INCREMENT,
    studentId int NOT NULL REFERENCES student(id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
	companyName VARCHAR(24) NOT NULL DEFAULT '',
    salary int NOT NULL DEFAULT 0,
    bonus int NOT NULL DEFAULT 0,
	offerDate date NOT NULL DEFAULT(CURRENT_DATE)
);

-- Student 1 has no offers, Student 2 has 3 offers, Student 3 has one offer
INSERT INTO offer(id, studentId, companyName, salary, bonus, offerDate) VALUES
  (1, 2, 'KPMG', 95000, 7000, '2021-09-30'),
  (2, 2, 'Deloitte Digital', 94000, 12000, '2021-10-03'),
  (3, 2, 'IU, ISGP', 54000, 0, '2021-10-05'),
  (4, 3, 'Amazon', 122000, 11000, '2021-10-15')
;

DROP TABLE IF EXISTS books;
CREATE TABLE books (
	id int PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    title varchar(240) UNIQUE NOT NULL,
    author varchar(48) NOT NULL,
    yearpublished INT NOT NULL, 
    publisher varchar(48) NOT NULL, 
    page_count varchar(48) NOT NULL, 
    msrp varchar(48) NOT NULL,
);

INSERT INTO books (id, title, author, yearpublished, publisher, page_count, msrp) VALUES 
(1, 'Harry Potter and the Goblet of Fire', 'JK Rowling', '2000', 'Bloomsbury Publishing', '636','$6.92'),
(2, 'Harry Potter and the Chamber of Secrets', 'JK Rowling', '1998', 'Bloomsbury Publishing', '251', '$6.98'),
(3, 'Harry Potter and the Prisoner of Askaban', 'JK Rowling', '1999', 'Bloomsbury Publishing', '317', '$12.87'),
(4, 'Harry Potter and the Half Blood Prince', 'JK Rowling', '2005', 'Bloomsbury Publishing', '607', '$6.98');


-- COMMIT;

-- CREATE USER 'msisreader'@'%' IDENTIFIED BY 'msisreadonly';
-- GRANT SELECT ON * . * TO 'msisreader'@'%';

-- COMMIT;

-- CREATE USER 'msisreader'@'%' IDENTIFIED BY 'msisreadonly';
-- GRANT SELECT ON * . * TO 'msisreader'@'%';
