const fs = require('fs');
const path = require('path');
const acorn = require('acorn');

const PATCHES = [
    {
        name: 'Window: Close to tray instead of quitting',
        required: true,
        find: 'this.main.windows.length === 1 && isMac && !isForceQuitting',
        replace: "this.main.windows.length === 1 && (isMac || process.platform === 'linux') && !isForceQuitting"
    },
    {
        name: 'Updater: Skip on Linux, updates come from pacman',
        required: true,
        find: 'async _startUpdate() {',
        requires: ['this.setStage(stages.SKIPPED)'],
        replace: `async _startUpdate() {
        if (process.platform === 'linux') {
            this.setStage(stages.SKIPPED);
            return;
        }`
    },
    {
        name: 'Window: Zoom control for Linux',
        required: false,
        find: "process.platform === 'win32' && input.control",
        replace: "(process.platform === 'win32' || process.platform === 'linux') && input.control"
    }
];

const SHIM = 'linux_shim.js';

function tokenize(source) {
    const tokens = [];
    for (const token of acorn.tokenizer(source, { ecmaVersion: 'latest', allowHashBang: true })) {
        if (token.type !== acorn.tokTypes.semi) {
            tokens.push(token);
        }
    }
    return tokens;
}

function tokenKey(token) {
    const value = token.type === acorn.tokTypes.regexp
        ? `/${token.value.pattern}/${token.value.flags}`
        : token.value;
    return `${token.type.label}\u0000${value}`;
}

function findMatches(sourceKeys, sourceTokens, anchor) {
    const anchorKeys = tokenize(anchor).map(tokenKey);
    const matches = [];
    for (let i = 0; i + anchorKeys.length <= sourceKeys.length; i++) {
        if (anchorKeys.every((key, offset) => sourceKeys[i + offset] === key)) {
            matches.push({
                start: sourceTokens[i].start,
                end: sourceTokens[i + anchorKeys.length - 1].end
            });
        }
    }
    return matches;
}

function applyPatches(bundlePath) {
    const source = fs.readFileSync(bundlePath, 'utf8');
    const sourceTokens = tokenize(source);
    const sourceKeys = sourceTokens.map(tokenKey);

    const edits = [];
    const failures = [];
    for (const patch of PATCHES) {
        const matches = findMatches(sourceKeys, sourceTokens, patch.find);
        const missing = (patch.requires || []).filter(anchor => !findMatches(sourceKeys, sourceTokens, anchor).length);
        if (matches.length === 1 && !missing.length) {
            edits.push({ ...matches[0], replace: patch.replace });
            console.log(`  -> Applied: ${patch.name}`);
            continue;
        }
        const level = patch.required ? 'ERROR: REQUIRED' : 'WARNING: OPTIONAL';
        console.error(`==> ${level} PATCH FAILED: ${patch.name}`);
        if (matches.length !== 1) {
            console.error(`  expected 1 match, found ${matches.length}`);
            console.error(`  anchor: ${patch.find.split('\n')[0]}`);
        }
        missing.forEach(anchor => console.error(`  missing dependency anchor: ${anchor}`));
        failures.push(patch);
    }

    edits.sort((a, b) => b.start - a.start);
    const patched = edits.reduce(
        (text, edit) => text.slice(0, edit.start) + edit.replace + text.slice(edit.end),
        source
    );

    const shimModule = `./${path.basename(SHIM, '.js')}`;
    fs.writeFileSync(bundlePath, `if (process.platform === 'linux') require('${shimModule}');\n${patched}`);
    fs.copyFileSync(path.join(__dirname, SHIM), path.join(path.dirname(bundlePath), SHIM));
    console.log('  -> Applied: Linux runtime shim');

    return failures;
}

const failures = applyPatches(process.argv[2]);

if (failures.length) {
    console.error(`==> WARNING: ${failures.length} patch(es) failed:`);
    failures.forEach(patch => console.error(`==> WARNING:   - ${patch.name}`));
    console.error('==> WARNING: >>> MAINTAINER: Superhuman changed, patches need review <<<');
}

process.exit(failures.some(patch => patch.required) ? 1 : 0);
