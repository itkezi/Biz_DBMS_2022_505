--관리자 접속화면

DROP USER book1 CASCADE;

CREATE TABLESPACE naverDB
DATAFILE 'C:/oraclexe/data/naverDB.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- 사용자 등록
-- 사용자 등록할 때 DEFAULT TABLESPACE를 지정하지 않으면 System Tablespace에 데이터를 저장하게 되어 문제가 될 수 있다
CREATE USER bookuser IDENTIFIED BY bookuser
DEFAULT TABLESPACE naverDB;

GRANT DBA TO bookuser;

