service mysql start;

# echo "Waiting for MySQL to start";
# sleep(15);

echo "Creating user database"
mysql -e "CREATE USER IF NOT EXISTS 'fcoindre'@'localhost' IDENTIFIED BY 'password';"

echo "Creating database"
mysql -e "CREATE DATABASE IF NOT EXISTS test_db;"

echo "Granting privileges"
mysql -e "GRANT ALL PRIVILEGES ON test_db.* TO 'fcoindre'@'localhost' IDENTIFIED BY 'password';"

echo "Root password modification"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '';"

echo "Flushing privileges"
mysql -e "FLUSH PRIVILEGES;"

echo "Shutting down MySQL";
mysqladmin -u root -p'' shutdown

echo "Restarting MySQL"
exec mysqld_safe


# mysql -e "CREATE DATABASE IF NOT EXISTS \' ${SQL_DATABASE} \'";

# mysql -e "CREATE USER IF NOT EXISTS \' ${SQL_USER} \'@\' % \' IDENTIFIED BY \' ${SQL_PASSWORD}

# mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}'";

# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# mysql -e "FLUSH PRIVILEGES";

# mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

# exec mysqld_safe