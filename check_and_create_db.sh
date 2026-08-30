#!/usr/bin/sh

MARIADB=/usr/bin/mariadb
DB_DIR=/usr/share/tango/db

# Schema version the packaged Databaseds expects; must match SCHEMA_VERSION_REF
# in the upstream CMakeLists.txt. The server refuses to start on a mismatch.
TARGET_VERSION=2

mariadb_tango() {
  $MARIADB -u root -h localhost tango "$@"
}

# Current schema version, or 0 when the table is absent or unreadable.
# Mirrors the query the server uses in DataBaseUtils.cpp so that both agree
# on which row wins.
schema_version() {
  if [ -z "$(mariadb_tango -Bse "SHOW TABLES LIKE 'schema_migrations'" 2>/dev/null)" ]; then
    echo 0
    return
  fi

  version=$(mariadb_tango -Bse \
    "SELECT version FROM schema_migrations ORDER BY updated DESC, id ASC LIMIT 1" 2>/dev/null)

  case "$version" in
    '' | *[!0-9]*) echo 0 ;;
    *) echo "$version" ;;
  esac
}

# Migration script that takes the schema from $1 to the next version.
migration_for() {
  case "$1" in
    0) echo update_db_from_5.24_to_5.30.sql ;;
    1) echo update_db_from_5.30_to_5.31.sql ;;
    *) echo '' ;;
  esac
}

echo "***************************************************"
echo ">>> Creating the tango database user in mariadb"

# Run the mariadb query to check if the user exists
result=$($MARIADB -u root -h localhost -Bse "SELECT User FROM mysql.user WHERE User='tango-db'")

if [ -z "$result" ]; then
  $MARIADB -u root -h localhost < "$DB_DIR/create_db_user.sql"
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
result=$($MARIADB -u root -h localhost -Bse "SHOW DATABASES LIKE 'tango'")

if [ -z "$result" ]; then
  (cd "$DB_DIR" && /usr/bin/sh ./create_db.sh)
  if [ $? -ne 0 ]; then
    echo "  - An error occurred, manual database configuration may be necessary!"
  else
    echo "  - Done!"
  fi
else
  echo "  - Mariadb database 'tango' already exists, skipping"
fi

echo ">>> Checking schema migrations"

# A freshly created database already carries the current schema version, so the
# loop below is a no-op for it.
if [ -z "$($MARIADB -u root -h localhost -Bse "SHOW DATABASES LIKE 'tango'")" ]; then
  echo "  - No 'tango' database to migrate, skipping"
else
  version=$(schema_version)

  # Apply every migration between the installed schema and the one this
  # version of Databaseds expects, one step at a time.
  while [ "$version" -lt "$TARGET_VERSION" ]; do
    script=$(migration_for "$version")

    if [ -z "$script" ] || [ ! -f "$DB_DIR/$script" ]; then
      echo "  - No migration available from schema version $version, manual intervention may be necessary!"
      break
    fi

    echo "  - Applying migration: $script"
    mariadb_tango < "$DB_DIR/$script"
    if [ $? -ne 0 ]; then
      echo "  - Migration failed! Manual intervention may be necessary."
      break
    fi

    new_version=$(schema_version)
    if [ "$new_version" -le "$version" ]; then
      echo "  - Schema version did not advance past $version, manual intervention may be necessary!"
      break
    fi
    version=$new_version
  done

  if [ "$version" -eq "$TARGET_VERSION" ]; then
    echo "  - Schema is up to date (version $version)"
  elif [ "$version" -gt "$TARGET_VERSION" ]; then
    echo "  - Schema version $version is newer than this package expects ($TARGET_VERSION), skipping"
  fi
fi

echo "***************************************************"
