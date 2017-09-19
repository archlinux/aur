/*
 * Vault configuration. See: https://vaultproject.io/docs/config/
 */

backend "file" {
	path = "/var/lib/vault"
}

listener "tcp" {
	/*
	 * By default Vault listens on localhost only.
	 * Make sure to enable TLS support otherwise.
	 *
	 * Note that VAULT_ADDR=http://127.0.0.1:8200 must
	 * be set in the environment in order for the client
	 * to work because it uses HTTPS by default.
	 */
	tls_disable = 1
}
