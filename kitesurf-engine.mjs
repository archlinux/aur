#!/usr/bin/env node
// SPDX-License-Identifier: Apache-2.0
//
// kitesurf-engine: serve a prebuilt Kitesurf engine (packages/engine:dist) with Miniflare.
// Adapted from the `serve` command of scripts/wpt-engine.mjs in
// https://github.com/cloudflare/kitesurf (Copyright (c) 2026 Cloudflare, Inc., Apache-2.0).

import { createRequire } from "node:module";
import { existsSync, readFileSync, readdirSync } from "node:fs";
import { dirname, relative, resolve } from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";

const HOME = process.env.KITESURF_ENGINE_HOME ?? dirname(fileURLToPath(import.meta.url));
const DIST = resolve(HOME, "dist");
const OPTIONS_FILE = "engine-mf.json";
const LOOPBACK = new Set(["127.0.0.1", "localhost", "::1"]);

// Module rules the engine dist needs (same as upstream wpt-engine.mjs).
const ENGINE_RULES = [
  { type: "CompiledWasm", include: ["**/*.wasm"] },
  { type: "Text", include: ["**/*.glue.js", "*.css", "**/*.css", "**/*.dat"] },
  { type: "Data", include: ["**/*.woff2", "**/*.bin"] },
];

const USAGE = `Usage: kitesurf-engine [options]

Run the Kitesurf browser engine locally (CDP on ws://HOST:PORT/devtools/browser).

Options:
  -p, --port N            Port to listen on (env KITESURF_ENGINE_PORT, default 8787)
      --host HOST         Address to bind (env KITESURF_ENGINE_HOST, default 127.0.0.1)
      --inspector-port N  Expose the workerd V8 inspector on this port
      --var KEY:VALUE     Set an engine variable (repeatable)
  -h, --help              Show this help
  -v, --version           Print the version

Engine variables can also come from the environment, for example
KITESURF_ALLOW_PRIVATE_NETWORK=1 to let pages load localhost and LAN addresses.

The engine has no authentication. Keep it on a loopback address, or put an
authenticating reverse proxy in front of it.`;

function fail(message) {
  console.error(`kitesurf-engine: ${message}`);
  process.exit(2);
}

function parsePort(value, name) {
  const port = Number(value);
  if (!Number.isInteger(port) || port < 1 || port > 65535) fail(`${name} needs a port, got ${value}`);
  return port;
}

function parseArgs(argv) {
  const options = {
    port: parsePort(process.env.KITESURF_ENGINE_PORT ?? "8787", "KITESURF_ENGINE_PORT"),
    host: process.env.KITESURF_ENGINE_HOST ?? "127.0.0.1",
    inspectorPort: undefined,
    vars: {},
  };
  for (let i = 0; i < argv.length; i++) {
    let arg = argv[i];
    let inline;
    if (arg.startsWith("--") && arg.includes("=")) [arg, inline] = [arg.slice(0, arg.indexOf("=")), arg.slice(arg.indexOf("=") + 1)];
    const next = () => {
      const value = inline ?? argv[++i];
      if (value === undefined) fail(`${arg} requires a value`);
      return value;
    };
    if (arg === "-h" || arg === "--help") {
      console.log(USAGE);
      process.exit(0);
    } else if (arg === "-v" || arg === "--version") {
      console.log(`kitesurf-engine ${version()}`);
      process.exit(0);
    } else if (arg === "-p" || arg === "--port") options.port = parsePort(next(), arg);
    else if (arg === "--host") options.host = next();
    else if (arg === "--inspector-port") options.inspectorPort = parsePort(next(), arg);
    else if (arg === "--var") {
      const value = next();
      const at = value.indexOf(":");
      if (at < 1) fail(`--var wants KEY:VALUE, got ${value}`);
      options.vars[value.slice(0, at)] = value.slice(at + 1);
    } else fail(`unknown option: ${arg}\n\n${USAGE}`);
  }
  return options;
}

function version() {
  try {
    return readFileSync(resolve(HOME, "VERSION"), "utf8").trim();
  } catch {
    return "unknown";
  }
}

function distModules(root, entry, testRegExps, compiledRules) {
  const modules = [{ type: "ESModule", path: resolve(root, entry) }];
  const walk = (dir) => {
    for (const item of readdirSync(dir, { withFileTypes: true }).sort((a, b) => a.name.localeCompare(b.name))) {
      const full = resolve(dir, item.name);
      if (item.isDirectory()) {
        walk(full);
        continue;
      }
      const name = relative(root, full).replaceAll("\\", "/");
      if (name === entry) continue;
      const rule = compiledRules.find((candidate) => testRegExps(candidate.include, name));
      if (rule) modules.push({ type: rule.type, path: full });
    }
  };
  walk(root);
  return modules;
}

async function main() {
  const options = parseArgs(process.argv.slice(2));
  if (!existsSync(resolve(DIST, OPTIONS_FILE))) fail(`no engine build at ${DIST}`);
  if (!LOOPBACK.has(options.host)) {
    console.warn(
      `kitesurf-engine: WARNING: binding ${options.host}. The engine has no authentication; ` +
        "anyone who can reach this port can browse the web through it.",
    );
  }

  // Run GC after page isolates stop, as `pnpm run dev` does; without it many navigations OOM.
  process.env.MINIFLARE_WORKERD_V8_FLAGS ??= "--expose-gc";

  const require = createRequire(resolve(HOME, "package.json"));
  const { Miniflare, compileModuleRules, convertV4MiniflareOptions, testRegExps } = await import(
    pathToFileURL(require.resolve("miniflare")).href
  );

  const workerOptions = JSON.parse(readFileSync(resolve(DIST, OPTIONS_FILE), "utf8"));
  const bindings = { ...workerOptions.bindings };
  const inspectorDir = workerOptions.assets && resolve(DIST, workerOptions.assets.directory, "inspector");
  if (inspectorDir && existsSync(inspectorDir)) bindings.KITESURF_INSPECTOR_BASE_URL = "/inspector/inspector.html";
  bindings.KITESURF_VERSION = version();
  // Engine variables can be overridden from the environment, then from --var.
  for (const key of Object.keys(bindings)) {
    if (key.startsWith("KITESURF_") && process.env[key] !== undefined) bindings[key] = process.env[key];
  }
  Object.assign(bindings, options.vars);

  const engine = {
    ...workerOptions,
    name: "kitesurf-engine",
    modulesRoot: DIST,
    modules: distModules(DIST, "index.js", testRegExps, compileModuleRules(ENGINE_RULES)),
    bindings,
    assets: workerOptions.assets && {
      ...workerOptions.assets,
      directory: resolve(DIST, workerOptions.assets.directory),
    },
  };

  const miniflare = new Miniflare(
    convertV4MiniflareOptions({
      host: options.host,
      port: options.port,
      inspectorPort: options.inspectorPort,
      cf: false,
      workers: [engine],
    }),
  );
  const url = await miniflare.ready;
  if (!LOOPBACK.has(options.host)) url.hostname = options.host.includes(":") ? `[${options.host}]` : options.host;
  const ws = new URL("devtools/browser", url);
  ws.protocol = "ws:";
  console.log(`kitesurf-engine ${version()} ready on ${url.href}`);
  console.log(`CDP endpoint: ${ws.href}`);

  let stopping = false;
  const stop = async () => {
    if (stopping) return;
    stopping = true;
    await miniflare.dispose().catch(() => {});
    process.exit(0);
  };
  process.once("SIGTERM", stop);
  process.once("SIGINT", stop);
}

main().catch((error) => {
  console.error(`kitesurf-engine: ${error?.stack ?? error}`);
  process.exit(1);
});
