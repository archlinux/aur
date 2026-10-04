#!/bin/bash

CERT="/opt/apps/com.websocket.tdr.abc/files/bin/rsarootpem.cer"
NICKNAME="ABC_WSS_TDR_ROOTCA_WY"

PKCS_PATH="$HOME/.pki/nssdb"
#QAX_PKCS_PATH="$PKCS_PATH/.config/qaxbrowser"

#mkdir -p "$QAX_PKCS_PATH"

install_cert() {
    certutil \
        -A \
        -d "sql:$1" \
        -t "C,," \
        -n "$NICKNAME" \
        -i "$CERT"
}

install_cert "$PKCS_PATH"
#install_cert "$QAX_PKCS_PATH"
