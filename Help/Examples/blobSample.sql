﻿BLOB
INSERT INTO DB2ADMIN.TEST_PHOTO2 VALUES(?,?)
PATHS
C:\sqls\image.jpg
C:\sqls\image2.gif
;

SELECT * FROM DB2ADMIN.TEST_PHOTO2;

----file saved to C:\Users\User\AppData\Roaming\JustData\data\export_210711_1008L.jpg
----file saved to C:\Users\User\AppData\Roaming\JustData\data\export_210711_1008J.gif
--TRUNCATE TABLE DB2ADMIN.TEST_PHOTO2 IMMEDIATE;
--CREATE TABLE DB2ADMIN.TEST_PHOTO2
--(
--    PICTURE1 BLOB(102400000),
--    PICTURE2 BLOB(102400000)
--)
--ORGANIZE BY ROW IN USERSPACE1
--COMPRESS YES
--;