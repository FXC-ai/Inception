echo "------------------------------- MARIADB START -------------------------------------"

# Initialisation de la base de données
mysqld --initialize --user=mysql --datadir=/var/lib/mysql;

chown -R mysql:mysql /var/lib/mysql;
chown -R mysql:mysql /run/mysqld;

# Lancement de mariadb en arrière plan
mysqld --user=mysql --datadir=/var/lib/mysql &

pid=$!

# Attente de la fin de lancement de mariadb
sleep 10

# Configuration de la base de données
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DB_NAME};"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}' IDENTIFIED BY '${MARIADB_PASS}';"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_USER}';"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# Affichage des bases de données dans le terminal
echo "------------------\n"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "SHOW DATABASES;"
echo "------------------\n"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "SELECT User FROM mysql.user"
echo "------------------\n"

# Kill de mysqld
kill "$pid"
# wait "$pid"

# Remplacement du processus shell par mysqld
exec mysqld --user=mysql --datadir=/var/lib/mysql
