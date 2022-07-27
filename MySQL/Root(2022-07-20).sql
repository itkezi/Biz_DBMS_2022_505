-- 2022-07-20
USE mydb;

-- 검색조건이 '' 일 때는 LIKE 연산자는 조건이 없는 것으로 인식한다
SELECT * FROM tbl_address
WHERE a_name LIKE '';

SELECT * FROM tbl_address
WHERE a_name LIKE CONCAT('%','','%');

SELECT * FROM (
	SELECT * FROM tbl_address
	WHERE a_name LIKE CONCAT('%','유','%')
) AS SUB
LIMIT 200 OFFSET 0;