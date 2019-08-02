SHOW VARIABLES LIKE 'lower%';

SET SQL_LOG_BIN=0;
CREATE USER 'repl'@'%' IDENTIFIED BY 'password' REQUIRE SSL;
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
FLUSH PRIVILEGES;
SET SQL_LOG_BIN=1;

CHANGE MASTER TO MASTER_USER='repl', MASTER_PASSWORD='password' FOR CHANNEL 'group_replication_recovery';

INSTALL PLUGIN group_replication SONAME 'group_replication.so';

SHOW PLUGINS;

-- SET GLOBAL group_replication_allow_local_disjoint_gtids_join=ON;

-- SET GLOBAL group_replication_bootstrap_group=ON;
-- START GROUP_REPLICATION;
-- SET GLOBAL group_replication_bootstrap_group=OFF;

-- SELECT * FROM performance_schema.replication_group_members;