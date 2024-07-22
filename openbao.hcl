# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Full configuration options can be found at https://github.com/openbao/openbao/tree/main/website/content/docs/configuration

ui = true

#mlock = true
#disable_mlock = true

storage "file" {
  path = "/var/lib/openbao"
}

#storage "consul" {
#  address = "127.0.0.1:8500"
#  path    = "openbao"
#}

# HTTP listener
#listener "tcp" {
#  address = "127.0.0.1:8200"
#  tls_disable = 1
#}

# HTTPS listener
listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_cert_file = "/var/lib/openbao/tls/tls.crt"
  tls_key_file  = "/var/lib/openbao/tls.key"
}

# Example AWS KMS auto unseal
#seal "awskms" {
#  region = "us-east-1"
#  kms_key_id = "REPLACE-ME"
#}
