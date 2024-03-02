'use strict';

const fs = require("fs");

const packageJson = JSON.parse(
	fs.readFileSync("wow.export/package.json")
);

packageJson.dependencies["pkg"] = "^5.8.1";

fs.writeFileSync(
	"wow.export/package.json",
	JSON.stringify(packageJson)
);
