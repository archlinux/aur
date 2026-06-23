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

echo ">>> Checking schema migrations"

# Check if the schema_migrations table exists (introduced in 5.30)
result=$(/usr/bin/mariadb -u root -h localhost tango -Bse "SHOW TABLES LIKE 'schema_migrations'" 2>/dev/null)

if [ -z "$result" ]; then
  echo "  - Applying migration: schema version 1 (required for 5.30+)"
  /usr/bin/mariadb -u root -h localhost tango <<'ENDSQL'
CREATE TABLE IF NOT EXISTS schema_migrations (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  version int default NULL,
  updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO schema_migrations (version) VALUES (1);

ALTER TABLE property_hist MODIFY id bigint unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE property_device_hist MODIFY id bigint unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE property_class_hist MODIFY id bigint unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE property_attribute_class_hist MODIFY id bigint unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE property_attribute_device_hist MODIFY id bigint unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE property_pipe_class_hist MODIFY id bigint unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE property_pipe_device_hist MODIFY id bigint unsigned NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS device_history_id;
DROP TABLE IF EXISTS device_attribute_history_id;
DROP TABLE IF EXISTS device_pipe_history_id;
DROP TABLE IF EXISTS class_history_id;
DROP TABLE IF EXISTS class_attribute_history_id;
DROP TABLE IF EXISTS class_pipe_history_id;
DROP TABLE IF EXISTS object_history_id;

DROP PROCEDURE IF EXISTS init_history_ids;
ENDSQL
  if [ $? -ne 0 ]; then
    echo "  - Migration failed! Manual intervention may be necessary."
  else
    echo "  - Done!"
  fi
else
  version=$(/usr/bin/mariadb -u root -h localhost tango -Bse "SELECT MAX(version) FROM schema_migrations" 2>/dev/null)
  echo "  - Schema is up to date (version ${version:-unknown})"
fi

echo "***************************************************"
