#!/bin/sh

export FABRIC_CFG_PATH="/etc/hyperledger/fabric"
export CORE_LOGGING_LEVEL="ERROR"
export CORE_LOGGING_LEVEL="DEBUG"
export CORE_PEER_TLS_ENABLED="true"
export CORE_PEER_GOSSIP_USELEADERELECTION="true"
export CORE_PEER_GOSSIP_ORGLEADER="false"
export CORE_PEER_PROFILE_ENABLED="true"
export CORE_PEER_TLS_CERT_FILE="/etc/hyperledger/fabric/tls/server.crt"
export CORE_PEER_TLS_KEY_FILE="/etc/hyperledger/fabric/tls/server.key"
export CORE_PEER_TLS_ROOTCERT_FILE="/etc/hyperledger/fabric/tls/ca.crt"
export CORE_PEER_MSPCONFIGPATH="/etc/hyperledger/fabric/msp"
