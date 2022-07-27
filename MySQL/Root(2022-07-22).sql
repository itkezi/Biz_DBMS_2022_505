-- 2022-07-22

CREATE database schooldb;

use schooldb;

SELECT * FROM tbl_student;

SELECT * FROM tbl_score;

DESC tbl_student;

SELECT sc_stnum, st_name, sb_name, sc_score
FROM tbl_score
	LEFT JOIN tbl_student tbl_score
		ON sc_stnum = st_num
    LEFT JOIN tbl_subject
		ON sc_sbcode = sb_code
WHERE sc_stnum = "S0016";

SELECT sc_seq, sc_stnum, sc_sbcode, sc_score, sb_code, sb_name
	FROM tbl_score
		LEFT JOIN tbl_subject
			ON sc_sbcode = sb_code;
            
             		SELECT * FROM tbl_score
 			LEFT JOIN tbl_subject
 				ON sc_sbcode = sb_code
 		WHERE sc_stnum = 'S0001';