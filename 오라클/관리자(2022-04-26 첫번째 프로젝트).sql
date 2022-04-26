-- C:\oraclexe\data
/*
관리자로 접속하여 할 일
1. TableSpace 생성
2. User ACC 생성 및 TableSpace연결
3. User에게 권한 부여

관리자로 접속하여 "생성"을 할 때는 CREATE라는 키워드를 사용한다.
"삭제"를 할 때는 DROP이라는 키워드를 사용한다.
*/

/*
1. TableSpace 생성
    오라클은 물리적 저장공간은 TableSpace라는 이름으로 관리한다.
    오라클 DBMS를 사용하여 데이터를 관리하기 위해서는 제일 먼저 TableSpace를 생성해야 한다.
    
    오라클 DBMS를 설치하면 System이 관리하는 TableSpace가 기본으로 생성된다.
    System TableSpace에는 중요한 데이터들이 저장되므로 가급적 일반적인, 대량의 DB를 저장하지 않는 것이 좋다.
    
    때문에 프로젝트별로 TableSpace를 만드는 것이 좋다.
*/

-- data 폴더에 first.dbf 이름으로 TableSpace 생성 (1MB / 부족할 때마다 1KB씩 확장)
CREATE TABLESPACE firstDB
DATAFILE 'C:/oraclexe/data/first.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- 기존에 생성한 TableSpace를 완전히 삭제
DROP TABLESPACE firstDB
INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS;

/* 
2. 사용자 생성과 TableSpace 생성
*/

-- user1이라는 유저를 만들고 비밀번호는 12341234로 설정
-- firstDB 를 중심으로 활동 (사용자와 저장소가 연결됨)
CREATE USER user1 IDENTIFIED BY 12341234
DEFAULT TABLESPACE firstDB;

-- user를 생성한 다음에 TableSpace를 연결 (단, 생성된 사용자 권한으로 추가된 데이터가 없어야한다.)
ALTER USER user1 DEFAULT TABLESPACE firstDB;

-- 사용자 삭제 (데이터 손실 위험이 있으니 가급적 X )
-- DROP USER user1 CASCADE;

/*
오라클에서 새로운 사용자를 생성하면 생성된 사용자는 아무런 권한이 없다
심지어 DBMS에 접속할 수 있는 권한마저 없다.
따라서 생성된 사용자에게는 적절한 수준의 권한을 부여해야한다.
GRANT 부여, REVOKE 뺏기
*/

-- 접속(Login, Logon) 권한 부여  -> select, insert 명령도 작동한다
GRANT CREATE SESSION TO user1;

-- Table 생성 권한 부여
GRANT CREATE TABLE TO user1;

-- TableSpace 접근 권한 부여
GRANT UNLIMITED TABLESPACE TO user1;

-- user1의 접속 권한 회수
REVOKE CREATE SESSION FROM user1;

/*
DBMS에서 사용하는 SQL(Structed Query Lang.) 명령들

## DDL(Data Definition Lang. : 데이터 정의어)
- CREAT로 시작하는 명령 :객체의 생성 명령들
    CREATE TABLESPACE
    CREATE USER
    CREATE TABLE
- DROP으로 시작하는 명령 :객체의 제거 명령들
- ALTER로 시작하는 명령 :객체의 상태 구조 등을 변경하는 명령들

## DCL(Data Control Lang. : 데이터 제어어)
- GRANT : 사용자에게 권한을 부여하는 명령
- REVOKE : 사용자에게 권한을 회수하는 명령
- COMMIT, ROLLBACK

## DML(Data Manipulation(Management) Lang. : 데이터 조작어, 관리어) - 생성된 Table에 대한 데이터 조작
- C (Create) : Table에 데이터 추가 : INSERT
- R (Read) : Table에 저장된 데이터를 가져오기, 읽어오기 : SELECT
- U (Update) : Table에 저장된 데이터의 내용을 변경하기 : UPDATE
- D (Delete) : Table에 저장된 데이터를 삭제하는 명령 : DELETE
    Update, Delete를 잘못햇을 경우 ROLLBACK을 사용하여 되돌릴 순 있지만 사용 미권장
*/

/*
개발, 학습자 입장에서 사용자에게 권한 부여하기
사용자에게 부여하는 권한은 일일이 조목조목 부여하는 것이 원칙이다
실무에서는 회사의 정책(Policy)에 따라 적절한 권한을 관리해야 한다.
권한이 잘못 부여되면 DB에 저장된 data에 손상을 가할 수 있고 손상된 data는 신뢰성을 잃게된다

손상된 Data가 저장된 데이터베이스 시스템은 '무결성이 파괴되었다'라고 표현

여기서는 학습의 편의성을 위하여 사용자에게 최고 권한을 부여할 것이다.

DBA 권한은 SYSDBA보다 약간의 제약이 있는 권한이다.
오라클 DBMS의 중요한 정보접근를 제외하고 모든 것을 할 수 있다.
심지어 다른 사용자의 TableSpace에도 접근할 수 있다.

*/

-- 최고 권한 부여
GRANT DBA TO user1;














