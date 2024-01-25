
echo "------------------------------- MARIADB START -------------------------------------"
service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS \' db_test \'";

mysql -e "CREATE USER IF NOT EXISTS \' fcoindre \'@\' % \' IDENTIFIED BY \' password

mysql -e "GRANT ALL PRIVILEGES ON db_test.* TO 'fcoindre'@'%' IDENTIFIED BY 'password'";

# mysql  -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';"

# mysql  -e "FLUSH PRIVILEGES";

# mysqladmin  -p${SQL_ROOT_PASSWORD} shutdown

# exec mysqld_safe



# mysql  -e "CREATE DATABASE IF NOT EXISTS \' ${SQL_DATABASE} \'";

# mysql  -e "CREATE USER IF NOT EXISTS \' ${SQL_USER} \'@\' % \' IDENTIFIED BY \' ${SQL_PASSWORD}

# mysql  -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}'";

# mysql  -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# mysql  -e "FLUSH PRIVILEGES";

# mysqladmin  -p${SQL_ROOT_PASSWORD} shutdown

# exec mysqld_safe