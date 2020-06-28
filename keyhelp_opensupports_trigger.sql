DELIMITER $$

CREATE OR REPLACE TRIGGER keyhelp_support_user_staff_sync_insert
AFTER INSERT
ON `keyhelp`.`users` FOR EACH ROW
BEGIN
    CALL keyhelp_support_user_staff_sync_inserter(NEW.`id`, NEW.`is_admin`, NEW.`is_main_admin`, NEW.`username`, NEW.`email`, NEW.`password`, NEW.`is_suspended`);
END$$

DELIMITER ;

DELIMITER $$

CREATE OR REPLACE TRIGGER keyhelp_support_user_staff_sync_update
AFTER UPDATE
ON `keyhelp`.`users` FOR EACH ROW
BEGIN
    IF OLD.`is_admin` <> NEW.`is_admin` THEN
    	CALL keyhelp_support_user_staff_sync_deleter(OLD.`is_admin`, NEW.`username`);
        CALL keyhelp_support_user_staff_sync_inserter(NEW.`id`, NEW.`is_admin`, NEW.`is_main_admin`, NEW.`username`, NEW.`email`, NEW.`password`, NEW.`is_suspended`);
    ELSEIF OLD.`password` <> NEW.`password` OR OLD.`email` <> NEW.`email` OR OLD.`is_suspended` <> NEW.`is_suspended` THEN
        CALL keyhelp_support_user_staff_sync_updater(NEW.`id`, NEW.`is_admin`, NEW.`is_main_admin`, NEW.`username`, NEW.`email`, NEW.`password`, NEW.`is_suspended`);
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE OR REPLACE TRIGGER keyhelp_support_user_staff_sync_delete
AFTER DELETE
ON `keyhelp`.`users` FOR EACH ROW
BEGIN
    CALL keyhelp_support_user_staff_sync_deleter(OLD.`is_admin`, OLD.`username`);
END$$

DELIMITER ;