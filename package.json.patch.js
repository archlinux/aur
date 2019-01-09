'use strict';

const PATCHABLE_FILE = './package.json';

const fs = require('fs');
const data = JSON.parse(fs.readFileSync(PATCHABLE_FILE));

// remove extra dependencies
const removePkg = [
	/^electron$/,
	/^eslint/,
	/^grunt-contrib-compress$/,
	/^grunt-contrib-deb$/,
	/^grunt-contrib-watch$/,
	/^grunt-contrib-uglify$/,
	/^grunt-electron$/,
	/^grunt-eslint$/,
	/^webpack-dev-server/,
];

Object.keys(data.dependencies).forEach(dep => {
	if (removePkg.some(re => re.test(dep)))
		delete data.dependencies[dep];
});

fs.writeFileSync(PATCHABLE_FILE, JSON.stringify(data, null, '\t'));
