#!/usr/bin/node

'use strict';

process.env.ATOM_RESOURCE_PATH = process.env.ATOM_RESOURCE_PATH ||
        '/usr/lib/atom-bleeding';

process.env.ATOM_ELECTRON_VERSION = process.env.ATOM_ELECTRON_VERSION ||
        require('fs')
    .readFileSync('/usr/lib/electron/version', 'utf8').trim().slice(1);

require('../lib/apm-cli.js').run(process.argv.slice(2), function (error) {
    process.exitCode = +!!error;
});
