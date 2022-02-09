﻿DELETE FROM TABLE_TO_DELETE WHERE 1 = 1; 
DROP TABLE TABLE_TO_DROP IF EXISTS;
CREATE TABLE TABLE_TO_CREATE AS 
(SELECT CALENDARQUARTER FROM JUST_DATA..DIMDATE D WHERE 1 = 1);

CREATE TEMP TABLE TEMP_TABLE_EXAMPLE AS 
(
    SELECT 1 AS T1, 'TEST2' AS T2
) DISTRIBUTE ON RANDOM;

--INSERT INTO TABLE_TO_INSERT 
WITH CTE1 AS (
    SELECT 1 AS COL, 11 AS COL2
)
, CTE2 AS (
    SELECT 2 AS COL, 22 AS COL2
)
--REGION CTE3
, CTE3 AS (
    SELECT 2 AS COL, 33 AS COL3
)
--ENDREGION
 
SELECT 
    D.*
FROM
    DIMDATE D 
    JOIN TEMP_TABLE_EXAMPLE TE ON D.CALENDARQUARTER::CHAR(50) = TE.T1 OR 1 = 1
    JOIN CTE1 C1 ON C1.COL = TE.T1 OR 2 = 2
    JOIN CTE2 AS C2 ON C2.COL2 = 22
    JOIN CTE3 ON CTE3.COL3 = 33
WHERE 
    1 = 1;  
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   )
--REGION CTE3
, CTE3 AS (
    SELECT 2 AS COL, 33 AS COL3
)
--ENDREGION
 )
--REGION CTE3
, CTE3 AS (
    SELECT 2 AS COL, 33 AS COL3
)
--ENDREGION
 )
--REGION CTE3
, CTE3 AS (
    SELECT 2 AS COL, 33 AS COL3
)
--ENDREGION
 )
--REGION CTE3
, CTE3 AS (
    SELECT 2 AS COL, 33 AS COL3
)
--ENDREGION
 )
--REGION CTE3
, CTE3 AS (
    SELECT 2 AS COL, 33 AS COL3
)
--ENDREGION
 )
--REGION CTE3
, CTE3 AS (
    SELECT 2 AS COL, 33 AS COL3
)
--ENDREGION
 )
--REGION CTE3
, CTE3 AS (
    SELECT 2 AS COL, 33 AS COL3
)
--ENDREGION
  