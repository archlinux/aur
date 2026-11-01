// Moves the addresses and ports CryptPad took from config.js before 2026.10.0 to infra.js, as its
// upgrade notes describe, as long as infra.js is still the example the package installed. config.js
// stays as it is: with infra.js in place, CryptPad doesn't read these settings from it anymore.
// Usage: node migrate-infra.js CONFIG_DIR INFRA_EXAMPLE
const fs = require("node:fs");
const path = require("node:path");

// The settings of config.js and where they are in infra.js now
const moves = {
	httpUnsafeOrigin: "origin",
	httpSafeOrigin: "sandboxOrigin",
	httpAddress: "httpHost",
	httpPort: "httpPort",
	httpSafePort: "httpSafePort",
	externalWebsocketURL: "externalWebsocketURL",
	fileHost: "fileHost",
};

const [configDir, examplePath] = process.argv.slice(2);
const infraPath = path.join(configDir, "infra.js");
const infra = fs.readFileSync(infraPath, "utf8");
if (infra !== fs.readFileSync(examplePath, "utf8")) {
	console.log(`${infraPath} has been changed already, leaving it as it is.`);
	process.exit(0);
}

const config = require(path.join(configDir, "config.js"));
let migrated = infra;
const moved = [];
for (const [oldKey, newKey] of Object.entries(moves)) {
	if (config[oldKey] === undefined) {
		continue;
	}
	// The first one is in "public", the settings come before the nodes
	const setting = new RegExp(`^(\\s*${newKey}: ).*,$`, "m");
	if (!setting.test(migrated)) {
		console.error(
			`${newKey} isn't in ${infraPath}, move ${oldKey} of config.js by hand.`,
		);
		process.exitCode = 1;
		continue;
	}
	migrated = migrated.replace(
		setting,
		(_, prefix) => `${prefix}${JSON.stringify(config[oldKey])},`,
	);
	moved.push(`${oldKey} -> public.${newKey}`);
}

if (moved.length) {
	fs.writeFileSync(infraPath, migrated);
	console.log(`Moved the settings of config.js to ${infraPath}:`);
	for (const move of moved) {
		console.log(`  ${move}`);
	}
}
