-- =====================================
-- Author:
-- Date: 2018-07-06_07:23:36
-- Description:
-- =====================================

START TRANSACTION;

INSERT INTO lms."Role" ("roledescription")
VALUES ('Administrator');

INSERT INTO lms."Role" ("roledescription")
VALUES ('Teacher');

INSERT INTO lms."Role" ("roledescription")
VALUES ('Student');

COMMIT;
