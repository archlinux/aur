# This is a sample, partially complete docker-credential-vault-login config
# file.
#
# You will need add (at minimum):
#
# 1. One or more auto_auth.method stanza(s)
# 2. An appropriate vault.address
#
# See the README in /usr/share/doc/docker-credential-vault-login for more.

vault {
  # Or via VAULT_ADDR (in the calling docker daemon's context)
  address = "https://your.vault.example.com:8200"
}

auto_auth {
  /*
   * You must add >1 method stanza
   *
  method "aws" {
    mount_path = "auth/aws"
    config = {
      type   = "iam"
      role   = "foobar"
      secret = "secret/registry/all"
    }
  }

  method "approle" {
    mount_path = "auth/approle"
    config     = {
      role_id_file_path                   = "/my-vault-approle-id"
      secret_id_file_path                 = "/my-vault-approle-secret-id"
      remove_secret_id_file_after_reading = "false"

      secrets = {
        "my.registry.example.com"         = "secret/registry/internal"
        "docker.io"                       = "secret/registry/docker.io"
      }
    }
  }
  */

  # Save a token to the local system to prevent re-authenticating with Vault
  # via the provided method(s) each time docker calls this cred helper.
  #
  # If saving a token to the local filesystem is a security concern you can
  # delete this stanza at a moderate performance penalty.
  sink "file" {
    config = {
      path = "/var/lib/docker-credential-vault-login/token"
      mode = "0640"
    }
  }
}
