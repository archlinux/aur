import fs from "node:fs";

const file = process.argv[2];
const linuxKeyboardChild = process.argv[3];
if (!file) {
  throw new Error(
    "usage: node scripts/patch-main.mjs <dist/main/index.js> [keyboard-helper-child-process-linux.mjs]",
  );
}

let source = fs.readFileSync(file, "utf8");
const backup = `${file}.windows`;
if (!fs.existsSync(backup)) fs.copyFileSync(file, backup);

const patches = [
  {
    from: "wt='win32'",
    to: "wt=process.platform",
    already: "wt=process.platform",
    name: "runtime platform detection",
  },
  {
    from: "return _0x461af7===_0x98d45b(0x58c)||_0x461af7===_0x98d45b(0x8e3);",
    to: "return _0x461af7===_0x98d45b(0x58c)||_0x461af7===_0x98d45b(0x8e3)||_0x461af7===_0x98d45b(0x5b6);",
    already: "||_0x461af7===_0x98d45b(0x5b6);",
    name: "Linux native-helper support",
  },
  {
    from: "let ca=Dt;ca+='.exe',",
    to: "let ca=Dt;wt==='win32'&&(ca+='.exe'),",
    already: "wt==='win32'&&(ca+='.exe')",
    name: "Linux application name",
  },
  {
    from: "case'win32':return gh;default:throw new Error('Unsupported\\x20platform:\\x20'+wt);",
    to: "case'win32':case'linux':return gh;default:throw new Error('Unsupported\\x20platform:\\x20'+wt);",
    already: "case'win32':case'linux':return gh;",
    name: "Linux keyboard-helper selection",
  },
  {
    from: "Gi=wt==='darwin',la=wt===_0x6bf285(0x8e3);var zs",
    to: "Gi=wt==='darwin',la=wt===_0x6bf285(0x8e3);wt==='linux'&&typeof _0x2c9dfa.getMediaAccessStatus!=='function'&&(_0x2c9dfa.getMediaAccessStatus=()=>\"granted\");var zs",
    already: "wt==='linux'&&typeof _0x2c9dfa.getMediaAccessStatus!=='function'",
    name: "Linux microphone permission status",
  },
  {
    from: "if(_0x879027===_0x43ba52(0x607))return _0x3f0752['openExternal'](_0x43ba52(0x93d)),!0x0;",
    to: "if(_0x879027===_0x43ba52(0x607))return wt==='linux'?!0x0:(_0x3f0752['openExternal'](_0x43ba52(0x93d)),!0x0);",
    already: "return wt==='linux'?!0x0:(_0x3f0752['openExternal'](_0x43ba52(0x93d)),!0x0);",
    name: "Linux microphone settings request",
  },
  {
    from: "{autoUpdater:ke}=_0x47e1e4(import.meta.url)(_0x6bf285(0x293));_0x50c4b8",
    to: "{autoUpdater:ke}=_0x47e1e4(import.meta.url)(_0x6bf285(0x293));wt==='linux'&&(ke.isUpdaterActive=()=>!0x1);_0x50c4b8",
    already: "wt==='linux'&&(ke.isUpdaterActive=()=>!0x1);",
    name: "disable AppImage updater for Linux packages",
  },
  {
    from: "'focusable':!0x0,'show':!0x1,'alwaysOnTop':!0x0",
    to: "'focusable':wt==='linux'?!0x1:!0x0,'show':!0x1,'alwaysOnTop':!0x0",
    already: "'focusable':wt==='linux'?!0x1:!0x0,'show':!0x1,'alwaysOnTop':!0x0",
    name: "prevent Linux interactive card from stealing input focus",
  },
  {
    from: "this[_0x10bfbe(0x7ff)]('interactive-card:update',_0x40605e),_0x1bd567['show']();",
    to: "this[_0x10bfbe(0x7ff)]('interactive-card:update',_0x40605e),(wt==='linux'?_0x1bd567['showInactive']():_0x1bd567['show']());",
    already: "wt==='linux'?_0x1bd567['showInactive']():_0x1bd567['show']()",
    name: "show Linux interactive card without activation",
  },
];

for (const patch of patches) {
  if (source.includes(patch.already)) continue;
  const first = source.indexOf(patch.from);
  if (first < 0 || source.indexOf(patch.from, first + patch.from.length) >= 0) {
    throw new Error(`could not apply unique patch: ${patch.name}`);
  }
  source = source.replace(patch.from, patch.to);
}

fs.writeFileSync(file, source);
if (linuxKeyboardChild) {
  if (!fs.existsSync(linuxKeyboardChild)) {
    throw new Error(`Linux keyboard child template does not exist: ${linuxKeyboardChild}`);
  }
  fs.copyFileSync(
    linuxKeyboardChild,
    new URL("./keyboard-helper-child-process.js", `file://${file}`),
  );
}
console.log(`Patched ${file} for Linux`);
