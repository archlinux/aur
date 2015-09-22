#!/bin/bash

unset GNOME_DESKTOP_SESSION_ID
exec /opt/oracle-sqldeveloper/sqldeveloper.sh -J-Dsdev.insight=false
