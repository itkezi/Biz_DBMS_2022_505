USE mydb;

CREATE TABLE tbl_address (
	a_seq BIGINT AUTO_INCREMENT PRIMARY KEY,
	a_name VARCHAR(20) NOT NULL,
	a_tel VARCHAR(30),
	a_address VARCHAR(125)
);

DROP TABLE tbl_address;

SELECT * FROM tbl_address;

/*
DROP TABLE : TABLE 삭제하기
DELETE FROM [TABLE] : 데이터만 전체 삭제하기
TRUNCATE : [TABLE] : DROP 후에 다시 CREATE
*/
TRUNCATE TABLE tbl_address;

SELECT * FROM tbl_address
WHERE a_name ='학생이름';

DELETE FROM tbl_address
WHERE a_seq=21;

-- 중간 문자열 검색
-- LIKE 연산자ㄹ는 index도 적용이 안되고 full text 검사
-- 전체 데이터를 처음부터 순서대로 비교하여 검색
-- WHERE 절에서 사용하는 연산자 중에 가장 성능이 낮다
-- a_name 칼럼에 '유'가 포함된 모든 데이터
SELECT * FROM tbl_address
WHERE a_name LIKE '%유%';

-- a_name 칼럼이 '유'로 시작되는 데이터
SELECT * FROM tbl_address
WHERE a_name LIKE '유%';

-- a_name 칼럼이 '유'로 끝나는 데이터
SELECT * FROM tbl_address
WHERE a_name LIKE '%유';

/*
-- mybatis mapper에서 사용하는 코드
SELECT * FROM tbl_address
WHERE a_name LIKE CONCAT('%',${a_name},'%');
*/

/*
-- mybatis mapper에서 사용하는 Oracle 코드
SELECT * FROM tbl_address
WHERE a_name LIKE '%' || #{a_name} ||'%' ;
*/

-- LIMIT 데이터의 출력 개수를 제한하는 키워드
/*
LIMIT 와 OFFSET은 SELECT 명령문의 어떠한 절보다 먼저 실행이 된다
그러한 이유로 다음 코드는 전체 데이터 중에서 앞에서 10개의 데이터를 추출하고
추출된 데이터 중에서 WHERE 절을 실행하여 조건에 맞는 데이터를 찾는다
*/
SELECT * FROM tbl_address
LIMIT 10;

-- 앞에서부터 10개를 제외한 뒤 10개 표시
SELECT * FROM tbl_address
LIMIT 10 OFFSET 10;


	SELECT * FROM tbl_address
	WHERE a_name LIKE '%이%';

/*
검색 기능과 Pagination 기능을 동시에 구현하기 위해서 Sub Query를 사용한다
내부의 SELECT 에서 조건에 맞는 데이터를 추출하고
바깥쪽의 SELECT에서 LIMIT OFFSET를 설정한다
*/
SELECT * FROM
(
	SELECT * FROM tbl_address
	WHERE a_name LIKE '이'
) AS SUB
LIMIT 10 OFFSET 10;

       SELECT * FROM
      (
         SELECT * FROM tbl_address
         WHERE a_name LIKE CONCAT('%','', '%')
      ) AS SUB
      LIMIT 20 OFFSET 2;
	





