'use strict';

const fs = require("fs");

const buildConfig = JSON.parse(
	fs.readFileSync("wow.export/build.conf")
);

for (const platformConfig of buildConfig.builds) {
	if (platformConfig.name == "linux-x64") {
		platformConfig.updater = undefined;
		platformConfig.updateBundle = undefined;
	}
}

fs.writeFileSync(
	"wow.export/build.conf",
	JSON.stringify(buildConfig)
);
