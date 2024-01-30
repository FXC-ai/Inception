
echo "------------------------------- MARIADB START -------------------------------------"

mysqld --initialize --user=mysql --datadir=/var/lib/mysql;

chown -R mysql:mysql /var/lib/mysql;
chown -R mysql:mysql /run/mysqld;

# launch mysqld in background
echo "Lauching mariadb in background;"
mysqld --user=mysql --datadir=/var/lib/mysql &

pid=$!


sleep 5

#Setting up the database
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"

echo "CREATE DATABASE IF NOT EXISTS;"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DB_NAME};"

echo "CREATE USER IF NOT EXISTS '${MARIADB_USER}' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}' IDENTIFIED BY '${MARIADB_PASS}';"

echo "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_USER}';"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_USER}';"

echo "FLUSH PRIVILEGES;"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

echo "TEST MARIADB"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "SHOW DATABASES;"

# kill mysqld
kill "$pid"
wait "$pid"

# launch mysqld in foreground, it replaces the shell processus by the mysqld processus
exec mysqld --user=mysql --datadir=/var/lib/mysql
