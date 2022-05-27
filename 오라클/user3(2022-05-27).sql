-- USER3 화면

SELECT * FROM tbl_user;

UPDATE tbl_student 
SET st_tel = '010-111-1111'
WHERE st_num = '20220001';
UPDATE tbl_student 
SET st_tel = '010-2222-2222'
WHERE st_num = '20220002';
UPDATE tbl_student 
SET st_tel = '010-333-3333'
WHERE st_num = '20220003';

commit;