#!/bin/sh
cd /opt/rimsort
SSL_CERT_FILE=/etc/ssl/cert.pem QT_QPA_PLATFORMTHEME=xdgdesktopportal ./RimSort $@
