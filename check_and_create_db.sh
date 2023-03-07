#!/usr/bin/sh

echo "***************************************************"
echo ">>> Creating the tango database user in mariadb"

# Run the mariadb query to check if the user exists
result=$(/usr/bin/mariadb -u root -h localhost -Bse "SELECT User FROM mysql.user WHERE User='tango-db'")

if [ -z "$result" ]; then
  /usr/bin/mariadb -u root -h localhost < /usr/share/tango/db/create_db_user.sql
  if [ $? -ne 0 ]; then
    echo "  - An error occurred, manual database users configuration may be necessary!"
  else
    echo "  - Done!"
  fi
else
  echo "  - Mariadb user 'tango-db' already exists, skipping"
fi

echo ">>> Creating the default mariadb tango database"

# Run the mariadb query to check if the database exists
result=$(/usr/bin/mariadb -u root -h localhost -Bse "SHOW DATABASES LIKE 'tango'")

if [ -z "$result" ]; then
  cd /usr/share/tango/db/
  /usr/bin/sh ./create_db.sh
  if [ $? -ne 0 ]; then
    echo "  - An error occurred, manual database configuration may be necessary!"
  else
    echo "  - Done!"
  fi
else
  echo "  - Mariadb database 'tango' already exists, skipping"
fi

echo "***************************************************"
