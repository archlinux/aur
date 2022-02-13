Introduction
======================
This version may cohabit with other major versions, including the official one.

Data directory is /var/lib/postgres/data14

Initialize the database
=======================
    su - postgres
    . /opt/postgresql14/bin/pgenv.sh
    initdb -k

Start the service
=================
    systemctl start postgresql14

Use the service
================
    . /opt/postgresql14/bin/pgenv.sh
    psql -U postgres
