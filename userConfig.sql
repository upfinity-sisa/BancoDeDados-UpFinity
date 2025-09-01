DROP USER IF EXISTS upfinity_select;
CREATE USER 'upfinity_select'@'%' IDENTIFIED BY 'Urubu100$';
GRANT ALL PRIVILEGES ON db.* TO 'upfinity_select'@'%';

DROP USER IF EXISTS dev;
CREATE USER 'dev'@'%' IDENTIFIED BY 'Urubu100$';
GRANT SELECT ON db.* TO 'dev'@'%';

FLUSH PRIVILEGES;