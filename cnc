#!/usr/bin/env node

var cnc = require('/usr/lib/cncjs/cnc').default;

cnc().catch(err => {
    console.error('Error:', err);
});
