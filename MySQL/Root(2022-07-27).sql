-- 220727 TEST

CREATE database testdb;

Drop database testdb;

use testdb;

create table tbl_books (
b_isbn bigint primary key,
b_title varchar(200) ,
b_ccode varchar(5) ,
b_acode varchar(5),
b_date varchar(10),
b_page int ,
b_price int
);

SELECT * FROM tbl_books
ORDER BY b_date;

SELECT * FROM tbl_books
order by b_ccode;

SELECT b_ccode AS 출판사코드, COUNT(b_ccode)  AS 수량
FROM tbl_books
group by b_ccode;

SELECT b_ccode AS 출판사코드,
        AVG(b_price) AS 평균
FROM tbl_books
GROUP BY b_ccode;

SELECT * FROM tbl_books
WHERE b_price >= 20000;

create table tbl_company (
c_code varchar(5),
c_name varchar(200) ,
c_ceo varchar(20) ,
c_tel varchar(20),
c_addr  varchar(200) 
);

create table tbl_author (
a_code  varchar(5), 
a_name  varchar(20),
a_tel  varchar(20),
a_addr  varchar(200)
);

select * from tbl_books;

SELECT COUNT(*) FROM tbl_books;
SELECT COUNT(*) FROM tbl_company;
SELECT COUNT(*) FROM tbl_author;

SELECT b_isbn ISBN , b_title 도서명, c_name 출판사명, c_ceo 출판사대표, a_name 저자, a_tel 저자연락처
FROM tbl_books
	LEFT JOIN tbl_company
    ON b_ccode = c_code
    LEFT JOIN tbl_author
    ON b_acode = a_code;
    
SELECT b_isbn ISBN , b_title 도서명, c_name 출판사명, c_ceo 출판사대표, a_name 저자, a_tel 저자연락처, b_date 출판일
FROM tbl_books
	LEFT JOIN tbl_company
    ON b_ccode = c_code
    LEFT JOIN tbl_author
    ON b_acode = a_code
WHERE date(b_date) < '2018-12-31';

use testDB;

SELECT a_name, a_code, a_tel
FROM tbl_author
WHERE a_name='노지양';

UPDATE tbl_author
SET a_tel = '010-3782-9014'
WHERE a_code = 'A0010';
