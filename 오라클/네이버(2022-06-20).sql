-- 네이버
CREATE TABLE tbl_images (
	i_seq NUMBER PRIMARY KEY,
	i_bseq NUMBER NOT NULL,
	i_originalName VARCHAR2(255) NOT NULL,
	i_imageName VARCHAR2(255) NOT NULL
)

CREATE SEQUENCE seq_image INCREMENT by 1;

select * from tbl_images;

SELECT 3, 4, 5, 6, 7 FROM DUAL
UNION ALL
SELECT 5, 6, 7, 8, 9 FROM DUAL
UNION ALL
SELECT 10, 11, 12, 13, 14 FROM DUAL;

INSERT INTO tbl_images (i_seq, i_bseq, i_originalName, i_imageName )
SELECT seq_image.NEXTVAL, SUB.* FROM
(
    SELECT 1, 'image1.jpg', 'uuID-image1.jpg' FROM DUAL
    UNION ALL
    SELECT 1, 'image2.jpg', 'uuID-image2.jpg' FROM DUAL
    UNION ALL
    SELECT 1, 'image3.jpg', 'uuID-image3.jpg' FROM DUAL
) SUB;

