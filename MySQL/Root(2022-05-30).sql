-- 여기는 root 화면
-- root는 Oracle의 sys와 같은 역할
-- 좌측 schemas의 sys는 절대 건들면 안됨

/*
mySQL 사용자와 DB(Data 저장소)의 관계가 연결 아니다
오라클에서는 사용자에게 default Table Space 지정하여
login(접속)을 하면 자동으로 기본 DB가 연결된다

사용자는 단순히 DB 서버에 접속하는 권한을 부여받을 뿐이고
어떤 DB를 사용할 것인지 처음 시작할 때 연결을 해줘야 한다
*/

-- DB 저장소 생성
CREATE DATABASE myDB;

-- 일반 사용자 생성
-- mySQL은 전통적으로 root 사용자로 접속하여 DB 관리한다
-- 최근 추세는 root 사용자는 DB, USER 생성만을 담당하고
-- DB 관리는 일반 사용자 등 생성하여 실행하도록 권장한다
-- mySQL은 사용자를 생성할 때 어떤 방법으로 접속할 것인지 명시해야함
-- itkezi 사용자는 localhost에서만 mySQL 서버에 접속할 수 있다
CREATE USER 'itkezi'@'localhost' identified by '!Korea8080';

-- 삭제 명령어
-- DROP USER 'itkezi'@'localhost';

/*
MySQL은 사용자를 등록하면 그 사용자는 기본적으로 DBA 권한을 갖는다
MySQL은 실무에서 가장 많이 사용하는 버전이 5.7.x 이다
5.7 버전은 사용자 등록과 동시에 DB 관련된 명령을 대부분 사용할 수 있다
8.x 버전은 사용자 권한이 좀 더 엄격해졌다

새로 등록한 사용자에게 DB에 접근할 수 있는 권한 부여 하기
itkezi@localhost 사용자에게 mydb schema에 접근하여
모든 DML 명령을 수행할 수 있는 권한을 부여
*/
GRANT ALL PRIVILEGES ON myDB.* TO 'itkezi'@'localhost';

CREATE USER 'user1'@'127.0.0.1' identified BY '!Korea8080';

-- user1은 모든 DB schema에 접속할 수 있다
GRANT ALL privileges ON *.* To 'user1'@'127.0.0.1';

-- 어디에서나 접속할 수 있도록 범위를 지정하지 않는 사용자 등록
CREATE USER 'user2'@'*' identified BY '!Korea8080';

 		CREATE TABLE mydb.tbl_ems (
		 	e_seq BIGINT PRIMARY KEY AUTO_INCREMENT,
			e_from_email VARCHAR(125) NOT NULL,
			e_to_email VARCHAR(125) NOT NULL,
			
			e_from_tbl_emstbl_studenttbl_testname VARCHAR(125) NOT NULL,
			e_to_name VARCHAR(125) NOT NULL,
			
			e_subject VARCHAR(125) NOT NULL,
			e_content VARCHAR(1000) NOT NULL,
			e_send_Date VARCHAR(10) NOT NULL,
			e_send_time VARCHAR(10) NOT NULL
		);

DROP TABLE tbl_ems;

USE mydb;

DESC tbl_users;

SHOW tables;

SELECT * FROM tbl_users;

CREATE TABLE tbl_memos (
		 	m_seq BIGINT PRIMARY KEY AUTO_INCREMENT,
		 	m_author VARCHAR(25) NOT NULL,
		 	m_date VARCHAR(10) NOT NULL,
		 	m_time VARCHAR(10) NOT NULL,
		 	m_memo VARCHAR(5000) NOT NULL,
		 	m_image VARCHAR(125)
            );
            
DROP TABLE tbl_memo;

DROP TABLE tbl_memos;

            
SELECT * FROM tbl_memo;

SELECT * FROM tbl_memos;

