# ltdk-postgresql

PostgreSQL configuration.

## Disclaimer

This *will* overwrite your existing configuration; it will disregard what is already configured.

## Changes

1. Customises the configurations for `postgresql.conf`, `pg_hba.conf`, and `pg_ident.conf` for the local cluster.
2. Moves the cluster from the default `/var/lib/postgres/data` to a version-specific `/var/lib/postgres/db/VER/data` directory.
3. Overrides `tmpfiles.d/postgresql.conf` to forbid access to `/var/lib/postgres/db/*/data`, but allow access to `/var/lib/postgres`.
4. Removes timeout for `postgresql.service`
5. Adds `ltdk-setupuser` command to configure users with their own database, and `ltdk-setupadmin` command to configure admins without their own database.
6. Adds `ltdk-setupdb` command for initializing and upgrading the database.
7. Enables `postgresql.service` by default.
8. Installs `pg_uuidv7` extension and accounts for it when upgrading.

## License

Available via the [Anti-Capitalist Software License][ACSL] for individuals, non-profit
organisations, and worker-owned businesses.

[ACSL]: ./LICENSE.md
