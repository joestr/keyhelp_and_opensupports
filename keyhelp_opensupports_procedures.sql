DELIMITER $$

CREATE OR REPLACE PROCEDURE keyhelp_support_user_staff_sync_inserter(
    nId INT(11),
    nIsAdmin INT(11),
    nIsMainAdmin INT(11),
    nName VARCHAR(255),
    nEmail VARCHAR(255),
    nPassword VARCHAR(255),
    nIsSuspended INT(11)
) 
BEGIN
		DECLARE cnName VARCHAR(255) DEFAULT NULL;
		DECLARE cnEmail VARCHAR(255) DEFAULT NULL;
		DECLARE cnPassword VARCHAR(255) DEFAULT NULL;
		
		SET cnName = CAST(nName AS CHAR CHARACTER SET utf8mb4) COLLATE utf8mb4_unicode_ci;
		SET cnEmail = CAST(nEmail AS CHAR CHARACTER SET utf8mb4) COLLATE utf8mb4_unicode_ci;
		SET cnPassword = CAST(nPassword AS CHAR CHARACTER SET utf8mb4) COLLATE utf8mb4_unicode_ci;
		
    IF nIsAdmin = 1 THEN
		INSERT INTO `keyhelp_support`.`staff` VALUES(nId, 2 + nIsMainAdmin, IF(cnEmail = NULL, 0, 1), cnName, cnEmail, cnPassword, NULL, NULL, nIsSuspended, NULL);
    ELSE
		INSERT INTO `keyhelp_support`.`user` VALUES(nId, cnEmail, cnPassword, cnName, NULL, 0, NULL, nIsSuspended);
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE OR REPLACE PROCEDURE keyhelp_support_user_staff_sync_updater(
    nId INT(11),
    nIsAdmin INT(11),
    nIsMainAdmin INT(11),
    nName VARCHAR(255),
    nEmail VARCHAR(255),
    nPassword VARCHAR(255),
    nIsSuspended INT(11)
) 
BEGIN
		DECLARE cnName VARCHAR(255) DEFAULT NULL;
		DECLARE cnEmail VARCHAR(255) DEFAULT NULL;
		DECLARE cnPassword VARCHAR(255) DEFAULT NULL;
		
		SET cnName = CAST(nName AS CHAR CHARACTER SET utf8mb4) COLLATE utf8mb4_unicode_ci;
		SET cnEmail = CAST(nEmail AS CHAR CHARACTER SET utf8mb4) COLLATE utf8mb4_unicode_ci;
		SET cnPassword = CAST(nPassword AS CHAR CHARACTER SET utf8mb4) COLLATE utf8mb4_unicode_ci;

    IF nIsAdmin = 1 THEN
		UPDATE `keyhelp_support`.`staff` SET `level` = 2 + nIsMainAdmin, `email` = cnEmail, `password` = cnPassword, `disabled` = nIsSuspended WHERE `name` = nName;
    ELSE
		UPDATE `keyhelp_support`.`user` SET `email` = cnEmail, `password` = cnPassword, `disabled` = nIsSuspended WHERE `name` = nName;
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE OR REPLACE PROCEDURE keyhelp_support_user_staff_sync_deleter(
    nIsAdmin INT(11),
    nName VARCHAR(255)
) 
BEGIN
		DECLARE cnName VARCHAR(255) DEFAULT NULL;
		
		SET cnName = CAST(nName AS CHAR CHARACTER SET utf8mb4) COLLATE utf8mb4_unicode_ci;
		
    IF nIsAdmin = 1 THEN
		DELETE FROM `keyhelp_support`.`staff` WHERE `name` = cnName;
    ELSE
		DELETE FROM `keyhelp_support`.`user` WHERE `name` = cnName;
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE OR REPLACE PROCEDURE keyhelp_support_user_staff_sync_freshinsert(
)
BEGIN
		DECLARE nnId  INT(11);
    DECLARE nnIsAdmin INT(11);
    DECLARE nnIsMainAdmin INT(11);
    DECLARE nnName CHAR(255);
    DECLARE nnEmail CHAR(255);
    DECLARE nnPassword CHAR(255);
    DECLARE nnIsSuspended INT(11);
    
    DECLARE fin INT(1);
    
    DEClARE cUsers 
		CURSOR FOR 
			SELECT 
				`keyhelp`.`users`.`id`,
				`keyhelp`.`users`.`is_admin`,
				`keyhelp`.`users`.`is_main_admin`,
				CAST(`keyhelp`.`users`.`username` AS CHAR CHARACTER SET utf8mb4) COLLATE utf8mb4_unicode_ci,
				CAST(`keyhelp`.`users`.`email` AS CHAR CHARACTER SET utf8mb4) COLLATE utf8mb4_unicode_ci,
				CAST(`keyhelp`.`users`.`password` AS CHAR CHARACTER SET utf8mb4) COLLATE utf8mb4_unicode_ci,
				`keyhelp`.`users`.`is_suspended`
			FROM `keyhelp`.`users`;

	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET fin = 1;

	OPEN cUsers;

	gUser: LOOP
		FETCH cUsers INTO nnId, nnIsAdmin, nnIsMainAdmin, nnName, nnEmail, nnPassword, nnIsSuspended;
		IF fin = 1 THEN 
			LEAVE gUser;
		END IF;
		CALL keyhelp_support_user_staff_sync_inserter(nnId, nnIsAdmin, nnIsMainAdmin, nnName, nnEmail, nnPassword, nnIsSuspended);
	END LOOP gUser;
	CLOSE cUsers;
END$$

DELIMITER ;
