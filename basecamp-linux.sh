#!/bin/sh
# The AppImage carries an OpenSSL built on Fedora, which looks for trusted
# certificates under /etc/pki/tls only. Arch has none there, so every HTTPS
# request of the app failed, and the in-app update and the plugin list never
# showed anything. From 3.2.1 on the app finds the bundle itself; this is what
# lets an older AppImage see that update in the first place.
if [ -z "$SSL_CERT_FILE" ] && [ -z "$SSL_CERT_DIR" ] \
        && [ -f /etc/ssl/certs/ca-certificates.crt ]; then
    SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
    export SSL_CERT_FILE
fi
exec /opt/basecamp-linux/basecamp-linux.AppImage "$@"
