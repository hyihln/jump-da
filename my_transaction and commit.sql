--transactions

USE Practice_DB;

--turn off auto commit
--SET IMPLICIT_TRANSACTIONS OFF;

SELECT * FROM tmp.person;

COMMIT;

BEGIN TRANSACTION;

INSERT INTO TMP.person