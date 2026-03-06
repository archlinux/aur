#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat << 'USAGE'
Usage:
  patch-asar-updater.sh [--in-place] [--keep-workdir] <input.asar> [output.asar]

Examples:
  patch-asar-updater.sh app.asar patched-app.asar
  patch-asar-updater.sh --in-place app.asar

What it does:
  1. Extracts app.asar
  2. Patches updater methods in index.js to no-op
  3. Rebuilds asar for pkgbuild use
USAGE
}

IN_PLACE=0
KEEP_WORKDIR=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --in-place)
      IN_PLACE=1
      shift
      ;;
    --keep-workdir)
      KEEP_WORKDIR=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      break
      ;;
    -*)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
    *)
      break
      ;;
  esac
done

if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

INPUT_ASAR="$1"
OUTPUT_ASAR="${2:-patched-app.asar}"

if [[ ! -f "$INPUT_ASAR" ]]; then
  echo "Input asar not found: $INPUT_ASAR" >&2
  exit 1
fi

if ! command -v asar >/dev/null 2>&1; then
  echo "asar CLI not found in PATH" >&2
  exit 1
fi

if ! command -v node >/dev/null 2>&1; then
  echo "node not found in PATH" >&2
  exit 1
fi

WORKDIR="$(mktemp -d "${TMPDIR:-/tmp}/asar-updater-patch.XXXXXX")"
cleanup() {
  if [[ "$KEEP_WORKDIR" -eq 0 ]]; then
    rm -rf "$WORKDIR"
  else
    echo "Kept workdir: $WORKDIR"
  fi
}
trap cleanup EXIT

UNPACK_DIR="$WORKDIR/unpacked"
PATCHED_ASAR_TMP="$WORKDIR/patched.asar"

echo "Extracting: $INPUT_ASAR"
asar extract "$INPUT_ASAR" "$UNPACK_DIR"

TARGET_JS="$UNPACK_DIR/index.js"
if [[ ! -f "$TARGET_JS" ]]; then
  echo "Expected file not found in asar: index.js" >&2
  exit 1
fi

node - "$TARGET_JS" << 'NODE'
const fs = require('node:fs');

const file = process.argv[2];
let src = fs.readFileSync(file, 'utf8');

const patches = [
  {
    name: 'check()',
    pattern: /async check\(\) \{[\s\S]*?\n  \}\n  start\(\) \{/m,
    replacement: `async check() {\n    this.logger.info("Updater disabled by patch");\n    return;\n  }\n  start() {`
  },
  {
    name: 'start()',
    pattern: /start\(\) \{[\s\S]*?\n  \}\n  stop\(\) \{/m,
    replacement: `start() {\n    this.logger.info("Updater disabled by patch");\n    return;\n  }\n  stop() {`
  },
  {
    name: 'install()',
    pattern: /install\(\) \{[\s\S]*?\n  \}\n  get clientUpdateProbability\(\) \{/m,
    replacement: `install() {\n    this.logger.info("Updater install disabled by patch");\n    return;\n  }\n  get clientUpdateProbability() {`
  }
];

for (const patch of patches) {
  if (!patch.pattern.test(src)) {
    throw new Error(`Patch anchor not found for ${patch.name}. App version layout may have changed.`);
  }
  src = src.replace(patch.pattern, patch.replacement);
}

fs.writeFileSync(file, src, 'utf8');
console.log('Patched updater methods in index.js');
NODE

echo "Repacking patched asar"
asar pack "$UNPACK_DIR" "$PATCHED_ASAR_TMP"

if [[ "$IN_PLACE" -eq 1 ]]; then
  BACKUP_PATH="${INPUT_ASAR}.bak.$(date +%Y%m%d%H%M%S)"
  cp -a "$INPUT_ASAR" "$BACKUP_PATH"
  cp -a "$PATCHED_ASAR_TMP" "$INPUT_ASAR"
  echo "Patched in place: $INPUT_ASAR"
  echo "Backup: $BACKUP_PATH"
else
  cp -a "$PATCHED_ASAR_TMP" "$OUTPUT_ASAR"
  echo "Patched asar written to: $OUTPUT_ASAR"
fi
