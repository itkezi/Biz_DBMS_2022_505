-- 여긴 관리자 화면
-- Selfit 데이터 저장 공간 생성

CREATE TABLESPACE Tour
DATAFILE 'C:/oraclexe/data/tour.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

CREATE USER st_db IDENTIFIED BY 1234
DEFAULT TABLESPACE Tour;

GRANT DBA TO selfit;