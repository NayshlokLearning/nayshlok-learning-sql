-- =====================================
-- Author: Nayshlok
-- Date: 2018-07-04_12:46:07
-- Description: Create a user, class, and role tables
-- =====================================

START TRANSACTION;

CREATE TABLE lms."User"
(
  userid SERIAL,
    CONSTRAINT PK_user_userId PRIMARY KEY (userId),
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  authid UUID NOT NULL
);

CREATE TABLE lms."Class"
(
  classid SERIAL,
    CONSTRAINT PK_class_classId PRIMARY KEY (classId),
  classname VARCHAR(50) NOT NULL,
  classdescription VARCHAR(250) NOT NULL
);

CREATE TABLE lms."Role"
(
  roleid SERIAL,
  CONSTRAINT PK_role_roleId PRIMARY KEY (roleId),
  roledescription VARCHAR(50) NOT NULL
);

CREATE TABLE lms."UserClass"
(
  userid INT NOT NULL,
  classid INT NOT NULL,
  roleid INT NOT NULL,
  CONSTRAINT UC_userclass_user_class_role UNIQUE (userId, classId, roleId)
);

REVOKE ALL ON TABLE lms."User" FROM PUBLIC;
REVOKE ALL ON TABLE lms."Class" FROM PUBLIC;
REVOKE ALL ON TABLE lms."Role" FROM PUBLIC;
REVOKE ALL ON TABLE lms."UserClass" FROM PUBLIC;

-- ROLLBACK;
COMMIT;
