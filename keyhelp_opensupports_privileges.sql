REVOKE ALL PRIVILEGES ON `keyhelp\_support`.* FROM 'keyhelp_support'@'localhost';
GRANT CREATE, REFERENCES, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, CREATE VIEW, EVENT, TRIGGER, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, EXECUTE ON `keyhelp\_support`.* TO 'keyhelp_support'@'localhost'; 

GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`department`        TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`ticket_user`       TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`topic`             TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`setting`           TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`mailtemplate`      TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`customfieldoption` TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`ban`               TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`recoverpassword`   TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`language`          TO 'keyhelp_support'@'localhost';
GRANT SELECT,         UPDATE                       ON `keyhelp_support`.`staff`             TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`tag_ticket`        TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`apikey`            TO 'keyhelp_support'@'localhost';
GRANT SELECT  INSERT, UPDATE,               DELETE ON `keyhelp_support`.`sessioncookie`     TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`staff_ticket`      TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`ticket`            TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`tag`               TO 'keyhelp_support'@'localhost';
GRANT SELECT,         UPDATE                       ON `keyhelp_support`.`user`              TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`log`               TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`ticketevent`       TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`department_staff`  TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`article`           TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`customfieldvalue`  TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`customfield`       TO 'keyhelp_support'@'localhost';
GRANT SELECT, INSERT, UPDATE,               DELETE On `keyhelp_support`.`customresponse`    TO 'keyhelp_support'@'localhost';
 