'use strict';

const PATCHABLE_FILE = './package.json';

const fs = require('fs');
const data = JSON.parse(fs.readFileSync(PATCHABLE_FILE));

// remove extra dependencies
const removePkg = [
	/^babel-/,
	/^electron$/,
	/^eslint/,
	/^grunt-appdmg$/,
	/^grunt-concurrent$/,
	/^grunt-contrib-compress$/,
	/^grunt-contrib-deb$/,
	/^grunt-contrib-uglify$/,
	/^grunt-contrib-watch$/,
	/^grunt-electron$/,
	/^grunt-eslint$/,
	/^uglify-loader$/,
	/^webpack-dev-server/,
];

Object.keys(data.devDependencies).forEach(dep => {
	if (removePkg.some(reg => reg.test(dep)))
		delete data.devDependencies[dep];
});

// upgrade node-sass
data.devDependencies['node-sass'] = '4.10.0';

fs.writeFileSync(PATCHABLE_FILE, JSON.stringify(data, null, '\t'));
