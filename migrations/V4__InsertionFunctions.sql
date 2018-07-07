-- =====================================
-- Author:
-- Date: 2018-07-06_07:15:08
-- Description:
-- =====================================

START TRANSACTION;

CREATE FUNCTION lms."udf_CreateUser"(fName TEXT, lName TEXT, auth UUID)
  RETURNS void AS $$
    INSERT INTO lms."User" (firstName, lastName, authId)
    VALUES (fName, lName, auth);
  $$
  LANGUAGE SQL;

CREATE FUNCTION lms."udf_CreateClass"(cName TEXT, cDescription TEXT)
  RETURNS void AS $$
    INSERT INTO lms."Class" (className, classDescription)
    VALUES (cName, cDescription);
  $$
  LANGUAGE SQL;

CREATE FUNCTION lms."udf_AddUserToClass"(userId INT, classId INT, roleId INT)
  RETURNS void AS $$
    INSERT INTO lms."UserClass" (userId, classId, roleId)
    VALUES (userId, classId, roleId);
  $$
  LANGUAGE SQL;

COMMIT;
