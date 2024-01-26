
echo "------------------------------- MARIADB START -------------------------------------"

mysqld --initialize --user=mysql --datadir=/var/lib/mysql;

chown -R mysql:mysql /var/lib/mysql;
chown -R mysql:mysql /run/mysqld;

# launch mysqld in background
mysqld --user=mysql --datadir=/var/lib/mysql &

pid=$!


sleep 10

#Setting up the database

mysql -u root -p'mypass' -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'mypass';"
mysql -u root -p'mypass' -e "CREATE DATABASE IF NOT EXISTS 'db_wordpress';"
mysql -u root -p'mypass' -e "CREATE USER IF NOT EXISTS 'fcoindre' IDENTIFIED BY 'mypass';"
mysql -u root -p'mypass' -e "GRANT ALL PRIVILEGES ON *.* TO 'fcoindre';"
mysql -u root -p'mypass' -e "FLUSH PRIVILEGES;"

# kill mysqld
kill "$pid"
wait "$pid"

# launch mysqld in foreground, it replace the shell processus by the mysqld processus
exec mysqld --user=mysql --datadir=/var/lib/mysql
