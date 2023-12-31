USE AdventureWorks2019
GO

INSERT INTO SRC_TXN (SRC_CODE, AC_NUM, PD_NUM, SHARES, CCY, BUS_DY, BKG_DT)
VALUES ('STNDRT', '1A68CD62', 'BB-9108', 176, 'GBP', '2025-11-15', NULL);
INSERT INTO SRC_TXN (SRC_CODE, AC_NUM, PD_NUM, SHARES, CCY, BUS_DY, BKG_DT)
VALUES ('STNDRT', '1A68CD62', 'BB-9108', 176, 'USD', '2024-11-16', NULL);
INSERT INTO SRC_TXN (SRC_CODE, AC_NUM, PD_NUM, SHARES, CCY, BUS_DY, BKG_DT)
VALUES ('STNDRT', '1A68CD62', 'BB-9108', 176, 'EUR', '2023-11-17', NULL);
INSERT INTO SRC_TXN (SRC_CODE, AC_NUM, PD_NUM, SHARES, CCY, BUS_DY, BKG_DT)
VALUES ('STNDRT', '1A68CD62', 'BB-9108', 176, 'EUR', '2022-11-18', NULL);
SELECT * FROM SRC_TXN
SELECT * FROM J$SRC_TXN
SELECT * FROM TXN
SELECT * FROM TXN_EXCP

UPDATE SRC_TXN SET AC_NUM='EDIT' WHERE SRC_CODE = 'STNDRT' 
UPDATE SRC_TXN SET SRC_CODE = 'INTNTL' WHERE SRC_CODE = 'STNDRT' 
UPDATE SRC_TXN SET SHARES=1001, CCY = 'GBP' WHERE TXN_SRC_KEY = 'STNDRT791A68CD62202311260826538789951'
SELECT * FROM SRC_TXN
SELECT * FROM J$SRC_TXN
SELECT * FROM TXN
SELECT * FROM TXN_EXCP

DELETE SRC_TXN WHERE TXN_SRC_KEY = 'STNDRT741A68CD62202311251158590869788' 
DELETE SRC_TXN WHERE TXN_SRC_KEY = 'STNDRT771A68CD62202311260823490671490' 
SELECT * FROM SRC_TXN
SELECT * FROM J$SRC_TXN
SELECT * FROM TXN
SELECT * FROM TXN_EXCP


DELETE J$SRC_TXN 
DELETE SRC_TXN 
DELETE TXN_EXCP
DELETE TXN
SELECT * FROM SRC_TXN
SELECT * FROM J$SRC_TXN
SELECT * FROM TXN
SELECT * FROM TXN_EXCP



UPDATE J$SRC_TXN SET CONSUME_F=0 WHERE CONSUME_F = 1
DELETE TXN_EXCP


SELECT * FROM SRC_TXN
SELECT * FROM J$SRC_TXN
SELECT * FROM TXN
SELECT * FROM TXN_EXCP

 SELECT AC_ID FROM AC_LKP WHERE AC_NUM = '1A68CD62'
 SELECT AC_ID FROM AC_LKP WHERE ACTV_F = 'Y' AND  AC_NUM ='1A68CD62'

                    SELECT *
                    FROM PD_LKP pd
                    WHERE 
                    (
                        SELECT BUS_DY FROM SRC_TXN WHERE TXN_SRC_KEY = 'INTNTL191A68CD62202311241809439661231'
                    )
                    BETWEEN pd.EFF_DT and pd.END_DATE
                    AND PD_NUM = 'BB-9108'
SELECT PD_ID
                    FROM PD_LKP pd
                    WHERE
                    (
                        SELECT BUS_DY FROM SRC_TXN WHERE TXN_SRC_KEY = 'INTNTL201A68CD62202311241812045985668'
                    )
                    BETWEEN pd.EFF_DT and pd.END_DATE
                    AND PD_NUM = 'BB-9108'
			
GO