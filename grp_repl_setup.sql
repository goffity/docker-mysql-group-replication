SET SQL_LOG_BIN=0;
CREATE USER 'replication_user'@'%' IDENTIFIED BY 'PASSWORD';
GRANT REPLICATION SLAVE ON *.* TO 'replication_user'@'%';
FLUSH PRIVILEGES;
SET SQL_LOG_BIN=1;

CHANGE MASTER TO MASTER_USER='replication_user', MASTER_PASSWORD='PASSWORD' FOR CHANNEL 'group_replication_recovery';

INSTALL PLUGIN group_replication SONAME 'group_replication.so';

SET GLOBAL group_replication_bootstrap_group=ON;
START GROUP_REPLICATION;
SET GLOBAL group_replication_bootstrap_group=OFF;