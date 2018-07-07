-- =====================================
-- Author: Nayshlok
-- Date: 2018-07-06_06:32:12
-- Description: Create functions for getting information from tables
-- =====================================

START TRANSACTION;

CREATE FUNCTION lms."udf_ClassesForUser" (myUser INTEGER)
  RETURNS TABLE(
              userId INT,
              firstName TEXT,
              lastName TEXT,
              classId INT,
              className TEXT
              )
  AS $$
  BEGIN
    RETURN QUERY SELECT u.userId, u.firstName, u.lastName, c.classId, c.className
    FROM lms."User" as u
    JOIN lms."UserClass" as uc
      ON u.userId = uc.userId
    JOIN lms."Class" as c
      ON uc.classId = c.classId
    WHERE u.userId=myUser;
  END
  $$ LANGUAGE PLPGSQL;

CREATE FUNCTION lms."udf_UsersInClass"(myClass INTEGER)
  RETURNS TABLE(
              classId INT,
              className TEXT,
              userId INT,
              firstName TEXT,
              lastName TEXT
              )
  AS $$
  BEGIN
    RETURN QUERY SELECT u.userId, u.firstName, u.lastName, c.classId, c.className
    FROM lms."Class" as c
    JOIN lms."UserClass" as uc
      ON c.classId = uc.classId
    JOIN lms."User" as u
      ON uc.userId = u.userId
    WHERE c.classId=myClass;
  END
  $$ LANGUAGE PLPGSQL;

COMMIT;
