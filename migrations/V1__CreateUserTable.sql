-- =====================================
-- Author: Nayshlok
-- Date: 2018-07-04_12:46:07
-- Description: Create a user, class, and role tables
-- =====================================

START TRANSACTION;

CREATE TABLE lms."User"
(
  userId INT NOT NULL,
    CONSTRAINT PK_user_userId PRIMARY KEY (userId),
  firstName VARCHAR(50) NOT NULL,
  lastName VARCHAR(50) NOT NULL,
  authId UUID NOT NULL
);

CREATE TABLE lms."Class"
(
  classId INT NOT NULL,
    CONSTRAINT PK_class_classId PRIMARY KEY (classId),
  className VARCHAR(50) NOT NULL,
  classDescription VARCHAR(250) NOT NULL
);

CREATE TABLE lms."Role"
(
  roleId INT NOT NULL,
  CONSTRAINT PK_role_roleId PRIMARY KEY (roleId),
  roleDescription VARCHAR(50) NOT NULL
);

CREATE TABLE lms."UserClass"
(
  userId INT NOT NULL,
  classId INT NOT NULL,
  roleId INT NOT NULL,
  CONSTRAINT UC_userclass_user_class_role UNIQUE (userId, classId, roleId)
);

-- ROLLBACK;
COMMIT;
