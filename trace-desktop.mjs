#!/usr/bin/env node
// Companion to upstream `PASEO_TRACE_DESKTOP=1 scripts/trace-daemon.mjs`:
// emit the files this package needs on top of the closure upstream already
// traces for its own Electron desktop build, computed by static module-graph
// tracing (@vercel/nft).
//
// Run from the repo root after the build, with node_modules populated.
// Concatenate with the trace-daemon.mjs output to get the full runtime
// closure installed under /usr/lib/paseo.

import { createRequire } from "node:module";
import { glob } from "node:fs/promises";
import path from "node:path";

const REPO_ROOT = process.cwd();
// Resolve @vercel/nft from the repo's node_modules (this script lives in the
// AUR package dir, outside the npm tree).
const repoRequire = createRequire(path.join(REPO_ROOT, "package.json"));
const { nodeFileTrace } = repoRequire("@vercel/nft");

const nodePtyDir = path
  .relative(
    REPO_ROOT,
    path.dirname(
      repoRequire.resolve("node-pty/package.json", {
        paths: [path.join(REPO_ROOT, "packages/server")],
      }),
    ),
  )
  .split(path.sep)
  .join("/");

// Upstream traces desktop main.js, preload.js and the browser-tab
// guest-preload.js under PASEO_TRACE_DESKTOP=1; only entries it does not
// cover are listed here.
const entries = [
  // CLI passthrough entry, resolved at runtime via
  // require.resolve("@getpaseo/cli/dist/run.js") which nft cannot follow.
  "packages/cli/dist/run.js",
];

// Files read at runtime via fs APIs or resolved relative to the install
// layout rather than required through the module graph.
const additionalInputs = [
  // Spawned by path (never required) for daemon/CLI child processes.
  "packages/desktop/dist/daemon/node-entrypoint-runner.js",
  // Expo web export served to the renderer via the paseo:// protocol.
  // Upstream's Nix installPhase copies packages/app/dist separately.
  "packages/app/dist/**",
  // Bundled agent skills, resolved from the repo root in unpackaged mode.
  // Also copied outside the trace by upstream's installPhase.
  "skills/**",
  // node-pty native addon compiled by node-gyp; node-gyp-build prefers
  // build/Release over the npm-shipped prebuilds upstream traces instead.
  // npm hoists node-pty to the root node_modules in some releases and nests
  // it under packages/server in others, so resolve the package rather than
  // assuming a location (upstream's own prebuilds glob still assumes root).
  `${nodePtyDir}/build/Release/*.node`,
];

const { fileList, warnings } = await nodeFileTrace(entries, {
  base: REPO_ROOT,
  ignore: [
    // Provided by the Electron runtime, never resolved from node_modules.
    "electron/**",
    "node_modules/electron/**",
    "**/*.test.js",
    "**/*.e2e.test.js",
  ],
});

for (const w of warnings) {
  const msg = w.message ?? String(w);
  if (/electron/.test(msg)) continue;
  console.error("trace warning:", msg);
}

const expanded = new Set(fileList);
for (const pattern of additionalInputs) {
  if (pattern.includes("*")) {
    for await (const file of glob(pattern, { cwd: REPO_ROOT })) {
      expanded.add(file);
    }
  } else {
    expanded.add(pattern);
  }
}

for (const p of [...expanded].sort()) {
  console.log(p);
}
