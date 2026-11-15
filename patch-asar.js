// Patches the unpacked app.asar of Cornelsen Offline Lernen:
//   node patch-asar.js <unpacked app.asar dir>
// Same file in the AUR package (cornelsen-offline-lernen-bin) and the nixos
// repo (pkgs/cornelsen-offline-lernen).
//
// - compatibility-401-fallback: the offline client asks the sync API whether
//   it is still compatible; without a valid session that request fails with
//   401 and the app blocks synchronization. 401 counts as compatible.
// - annotations-404-fallback: a book without annotations answers 404, which
//   breaks opening it offline. 404 counts as "no annotations".
//
// The code is minified and the RxJS names change with every release, so
// catchError, of and throwError are found by their implementation instead of
// being hard-coded. CORNELSEN_PATCH_STRICT=1 fails the build when a patch
// does not apply; otherwise it only warns.
const fs = require('fs');
const path = require('path');

const dist = path.join(process.argv[2] || '', 'dist');
const strict = process.env.CORNELSEN_PATCH_STRICT === '1';
const id = '[\\w$]+';

const ops = {
    catchError: new RegExp(`function (${id})\\((${id})\\)\\{return ${id}\\(\\((${id}),(${id})\\)=>\\{let (${id})=null,(${id})=!1,(${id});\\5=\\3\\.subscribe`),
    of: new RegExp(`function (${id})\\(\\.\\.\\.(${id})\\)\\{return (${id})\\(\\2,(${id})\\(\\2\\)\\)\\}`),
    throwError: new RegExp(`function (${id})\\((${id}),(${id})\\)\\{let (${id})=${id}\\(\\2\\)\\?\\2:\\(\\)=>\\2,(${id})=(${id})=>\\6\\.error\\(\\4\\(\\)\\)`),
};

const patches = [
    {
        name: 'compatibility-401-fallback',
        target: /(isCompatibleWithOnline\$\(\)\{return this\.http\.get\(`[^`]*`\)\.pipe\()(.*?\.isCompatible\)+)\)\}/,
        apply: (n, head, body) => `${head}${body},${n.catchError}(e=>e.status===401?${n.of}(!0):${n.throwError}(()=>e)))}`,
    },
    {
        name: 'annotations-404-fallback',
        target: /(getProductAnnotations\([\w$]+\)\{return this\.http\.get\(`[^`]*\/pspdf\/all-annotations\/[^`]*`\)\.pipe\()/,
        apply: (n, head) => `${head}${n.catchError}(e=>e.status===404?${n.of}([]):${n.throwError}(()=>e)),`,
    },
];

let failed = false;
function problem(msg) {
    console.error(`${strict ? 'ERROR' : 'WARNING'}: ${msg}`);
    failed = true;
}

if (!fs.existsSync(dist)) {
    console.error(`ERROR: ${dist} not found (argument: the unpacked app.asar)`);
    process.exit(1);
}
const files = fs.readdirSync(dist).filter(f => f.endsWith('.js')).map(f => path.join(dist, f));

for (const p of patches) {
    const file = files.find(f => p.target.test(fs.readFileSync(f, 'utf8')));
    if (!file) { problem(`${p.name}: target code not found, not applied`); continue; }
    let js = fs.readFileSync(file, 'utf8');
    const names = {};
    for (const [op, re] of Object.entries(ops)) {
        const m = js.match(re);
        if (m) names[op] = m[1];
    }
    const missing = Object.keys(ops).filter(op => !names[op]);
    if (missing.length) { problem(`${p.name}: RxJS ${missing.join(', ')} not found in ${path.basename(file)}, not applied`); continue; }
    js = js.replace(p.target, (...m) => p.apply(names, ...m.slice(1, -2)));
    fs.writeFileSync(file, js);
    console.log(`patched ${p.name} in ${path.basename(file)} (catchError=${names.catchError}, of=${names.of}, throwError=${names.throwError})`);
}

process.exit(failed && strict ? 1 : 0);
