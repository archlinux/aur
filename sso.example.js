// SPDX-FileCopyrightText: 2023 XWiki CryptPad Team <contact@cryptpad.org> and contributors
//
// SPDX-License-Identifier: AGPL-3.0-or-later

//const fs = require('node:fs');
module.exports = {
	// Enable SSO login on this instance
	enabled: true,
	// Block registration for non-SSO users on this instance
	enforced: false,
	// Allow users to add an additional CryptPad password to their SSO account
	cpPassword: true,
	// You can also force your SSO users to add a CryptPad password
	forceCpPassword: true,
	// List of SSO providers
	list: [
		{
			name: "keycloak",
			type: "oidc",
			url: "https://<keycloakserver/realms/<realm>",
			client_id: "cryptpad",
			client_secret: "<clientsecret>",
			// jwt_alg: 'RS256', // (deprecated)
			id_token_alg: "PS256", // (optional)
			userinfo_token_alg: "PS256", // (optional)
			username_scope: "profile", // (optional)
			username_claim: "name", // (optional)
			use_pkce: true, // (optional)
			use_nonce: true, // (optional)
		},
		/*

		// Sample Univention UCS Configuration (using Kopano Connect)
		{
			name: 'xwiki',
			type: 'oidc',
			url: 'https://ucs-sso.<yourdomain>',
			client_id: "cryptpad",
			client_secret: "<yoursecret",
			jwt_alg: 'PS256'
		},
		// Sample Google Configuration
		{
			name: 'google',
			type: 'oidc',
			url: 'https://accounts.google.com',
			client_id: "{your_client_id}",
			client_secret: "{your_client_secret}",
			jwt_alg: 'RS256' (optional)
		},
		// Sample SAML Configuration
		{
			name: 'samltest',
			type: 'saml',
			url: 'https://samltest.id/idp/profile/SAML2/Redirect/SSO',
			issuer: 'your-cryptpad-issuer-id',
			cert: String or fs.readFileSync("./your/cert/location", "utf-8"),
			privateKey: fs.readFileSync("./your/private/key/location", "utf-8"),
			signingCert: fs.readFileSync("./your/signing/cert/location", "utf-8"),
		}
		*/
	],
};
