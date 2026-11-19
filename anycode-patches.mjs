// Downstream patches for the AnyCode app bundle, applied by the PKGBUILD to the
// extracted app.asar. Usage: node anycode-patches.mjs <extracted-app-dir>
//
// The bundle is renamed (content hashes) and its helper names get numeric
// suffixes that shift between releases, so every edit locates its file by a
// stable anchor and must match exactly once. Anything else aborts the build,
// so a changed upstream fails loudly instead of shipping silently unpatched.
//
// What the patches do for Claude tabs (the Claude Code CLI engine). Upstream
// spawns the CLI with --setting-sources project,local and --strict-mcp-config,
// so nothing from the user's own Claude Code setup reaches it:
//
//   default    personal skills (~/.claude/skills, ~/.agents/skills), personal
//              commands and agents (~/.claude/commands, ~/.claude/agents)
//              and the user's enabled plugins
//              are loaded WITHOUT ~/.claude/settings.json: no user hooks, no
//              user permission rules, no user MCP servers. Approvals stay with
//              AnyCode.
//   opt-in     ANYCODE_CLAUDE_USER_SETTINGS=1 in AnyCode's environment adds
//              the `user` setting source and drops --strict-mcp-config, which
//              is what the plain CLI does: user hooks, permission rules
//              (they approve tools without asking AnyCode), user and plugin
//              MCP servers. Untrusted workspaces and the locked-down
//              orchestration spawn are never changed.

import { readdirSync, readFileSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';

const root = process.argv[2];
if (!root) {
  console.error('usage: node anycode-patches.mjs <extracted-app-dir>');
  process.exit(2);
}

function filesUnder(dir) {
  return readdirSync(dir, { withFileTypes: true, recursive: true })
    .filter((e) => e.isFile() && e.name.endsWith('.js'))
    .map((e) => join(e.parentPath ?? e.path, e.name));
}

function fileWith(dir, anchor) {
  const hits = filesUnder(join(root, dir)).filter((f) => readFileSync(f, 'utf8').includes(anchor));
  if (hits.length !== 1) throw new Error(`anchor ${JSON.stringify(anchor)} found in ${hits.length} files under ${dir}`);
  return hits[0];
}

function patchFile(file, label, edits, append = '') {
  let src = readFileSync(file, 'utf8');
  for (const [i, [from, to]] of edits.entries()) {
    const re = from instanceof RegExp ? new RegExp(from.source, from.flags.includes('g') ? from.flags : from.flags + 'g') : null;
    const count = re ? [...src.matchAll(re)].length : src.split(from).length - 1;
    if (count !== 1) throw new Error(`${label}: edit #${i + 1} matched ${count} times in ${file}`);
    src = re ? src.replace(re, to) : src.replace(from, () => to);
  }
  writeFileSync(file, src + append);
  console.log(`patched: ${label}`);
}

// Shared by main (slash menu) and host (CLI spawn): the plugins the user has
// enabled in ~/.claude/settings.json, minus those a workspace settings file
// turns off, resolved to their user-scope install under ~/.claude/plugins.
// With `includeProject`, plugins enabled by the workspace settings are added
// too (the CLI loads those itself; the menu still wants to list them).
const pluginResolver = `
function anycodeBinEnabledPlugins(fs2, path2, home, cwd, includeProject) {
  const readJson = (file) => {
    try {
      const st = fs2.statSync(file);
      if (!st.isFile() || st.size > 4 * 1024 * 1024) return void 0;
      const value = JSON.parse(fs2.readFileSync(file, "utf8"));
      return value !== null && typeof value === "object" ? value : void 0;
    } catch { return void 0; }
  };
  const enabledIn = (file) => {
    const ep = readJson(file)?.enabledPlugins;
    return ep !== null && typeof ep === "object" && !Array.isArray(ep) ? ep : {};
  };
  const pluginsRoot = path2.join(home, ".claude", "plugins");
  const installed = readJson(path2.join(pluginsRoot, "installed_plugins.json"))?.plugins ?? {};
  const projectFiles = typeof cwd === "string" && cwd !== "" ? [path2.join(cwd, ".claude", "settings.json"), path2.join(cwd, ".claude", "settings.local.json")] : [];
  const state = new Map();
  for (const [id, on] of Object.entries(enabledIn(path2.join(home, ".claude", "settings.json")))) state.set(id, { on: on === true, project: false });
  for (const file of projectFiles) {
    for (const [id, on] of Object.entries(enabledIn(file))) {
      if (on === false) state.set(id, { on: false, project: true });
      else if (on === true && includeProject) state.set(id, { on: true, project: true });
    }
  }
  const out = [];
  for (const [id, s] of state) {
    if (!s.on || out.length >= 100) continue;
    const entries = Array.isArray(installed[id]) ? installed[id] : [];
    const pick = entries.find((e) => e?.scope === "user") ?? (s.project ? entries.find((e) => e?.scope === "project" && e?.projectPath === cwd) ?? entries[0] : void 0);
    const dir = typeof pick?.installPath === "string" ? path2.resolve(pick.installPath) : void 0;
    if (dir === void 0) continue;
    const rel = path2.relative(pluginsRoot, dir);
    if (rel === "" || rel.startsWith("..") || path2.isAbsolute(rel)) continue;
    try { if (!fs2.statSync(dir).isDirectory()) continue; } catch { continue; }
    let name = id.split("@")[0];
    const manifestName = readJson(path2.join(dir, ".claude-plugin", "plugin.json"))?.name;
    if (typeof manifestName === "string" && /^[A-Za-z0-9_-]+$/.test(manifestName)) name = manifestName;
    out.push({ id, name, dir, project: s.project });
  }
  return out;
}
`;

// 1. AnyCode's skill catalog (`$name` in Native tabs, Settings -> Skills) also
//    reads <workspace>/.claude/skills and ~/.claude/skills, read-only and after
//    AnyCode's own roots. ownSkillRoots(), which bounds where the app may write
//    or delete, is deliberately left alone.
patchFile(fileWith('out/main', 'function buildSkillRoots('), 'skill roots include .claude/skills', [
  [
    /^(\s*)\{ dir: (subdir\$?\d*)\(workspace, "\.agents\/skills"\), source: "project" \},$/m,
    '$&\n$1{ dir: $2(workspace, ".claude/skills"), source: "project" },',
  ],
  [
    /^(\s*)\{ dir: (subdir\$?\d*)\(home, "\.agents\/skills"\), source: "user" \}$/m,
    '$1{ dir: $2(home, ".agents/skills"), source: "user" },\n$1{ dir: $2(home, ".claude/skills"), source: "user" }',
  ],
]);

// 2. Claude tabs: the CLI spawn loads the user's skills, commands and plugins.
//    By default this goes through --add-dir on a shim directory whose .claude/
//    holds symlinks (one per personal skill, plus `commands`); the CLI loads
//    skills and commands from .claude/ of added directories under their bare
//    names and reads nothing else from them (no settings, hooks or CLAUDE.md).
//    Enabled plugins are passed with --plugin-dir. Writes stay confined to the
//    workspace by AnyCode's own write guard. With the opt-in, the `user`
//    source loads all of that natively, so only ~/.agents/skills (which the
//    CLI never reads) still goes through the shim.
const hostHelper = `

// --- anycode-bin downstream patch: the user's Claude Code setup in Claude tabs ---
${pluginResolver}
function anycodeBinFullUserSettings() {
  return process.env.ANYCODE_CLAUDE_USER_SETTINGS === "1";
}
function anycodeBinClaudeUserArgs(cwd) {
  const args = [];
  try {
    const fs2 = process.getBuiltinModule("node:fs");
    const path2 = process.getBuiltinModule("node:path");
    const os2 = process.getBuiltinModule("node:os");
    const home = os2.homedir();
    if (!home) return args;
    const full = anycodeBinFullUserSettings();
    const claudeSkills = path2.join(home, ".claude", "skills");
    const wanted = new Map();
    // ~/.claude/skills first: it wins a name clash, as it would in the CLI.
    for (const root of [claudeSkills, path2.join(home, ".agents", "skills")]) {
      let names = [];
      try { names = fs2.readdirSync(root); } catch { continue; }
      for (const name of names) {
        if (name.startsWith(".") || wanted.has(name) || wanted.size >= 1000) continue;
        const dir = path2.join(root, name);
        try { if (fs2.statSync(path2.join(dir, "SKILL.md")).isFile()) wanted.set(name, dir); } catch {}
      }
    }
    if (full) {
      // The user source already loads ~/.claude/skills; keep only the rest.
      for (const [name, dir] of [...wanted]) if (path2.dirname(dir) === claudeSkills) wanted.delete(name);
    }
    const cacheBase = process.env.XDG_CACHE_HOME && path2.isAbsolute(process.env.XDG_CACHE_HOME) ? process.env.XDG_CACHE_HOME : path2.join(home, ".cache");
    const shim = path2.join(cacheBase, "anycode-bin", "claude-user-skills");
    const linkDir = path2.join(shim, ".claude", "skills");
    fs2.mkdirSync(linkDir, { recursive: true, mode: 0o700 });
    const syncLink = (link, target) => {
      try {
        const st = fs2.lstatSync(link);
        if (!st.isSymbolicLink()) return;
        if (target !== void 0 && fs2.readlinkSync(link) === target) return;
        fs2.unlinkSync(link);
      } catch {}
      if (target !== void 0) { try { fs2.symlinkSync(target, link); } catch {} }
    };
    for (const name of fs2.readdirSync(linkDir)) {
      if (!wanted.has(name)) syncLink(path2.join(linkDir, name), void 0);
    }
    for (const [name, dir] of wanted) syncLink(path2.join(linkDir, name), dir);
    // Personal commands and subagent definitions (e.g. the claude-flow
    // reviewers in ~/.claude/agents), which the user setting source would load.
    for (const kind of ["commands", "agents"]) {
      let target = path2.join(home, ".claude", kind);
      try { if (full || !fs2.statSync(target).isDirectory()) target = void 0; } catch { target = void 0; }
      syncLink(path2.join(shim, ".claude", kind), target);
    }
    args.push("--add-dir", shim);
    if (!full) {
      for (const plugin of anycodeBinEnabledPlugins(fs2, path2, home, cwd, false)) {
        if (!plugin.project) args.push("--plugin-dir", plugin.dir);
      }
    }
  } catch {}
  return args;
}
`;

const hostFile = fileWith('out/main', 'function buildClaudeSpawnArgs(');
patchFile(hostFile, 'Claude tabs load the user\'s skills, commands and plugins', [
  // Since 0.0.103 the spawn and upstream's own command catalog both take the
  // sources from resolveClaudeSettingSources(), so the opt-in reaches both.
  [
    /(function resolveClaudeSettingSources\$?\d*\(projectTrusted\) \{\n\s*return projectTrusted === false \? "user" : )"project,local";/,
    '$1anycodeBinFullUserSettings() ? "user,project,local" : "project,local";',
  ],
  [
    '    "--strict-mcp-config",\n    "--append-system-prompt",',
    '    ...!overlay && options.projectTrusted !== false && anycodeBinFullUserSettings() ? [] : ["--strict-mcp-config"],\n    "--append-system-prompt",',
  ],
  [
    '  if (!overlay && options.pluginDir !== void 0) args.push("--plugin-dir", options.pluginDir);\n',
    '  if (!overlay && options.pluginDir !== void 0) args.push("--plugin-dir", options.pluginDir);\n' +
      '  if (!overlay && options.projectTrusted !== false) args.push(...anycodeBinClaudeUserArgs(options.anycodeBinCwd));\n',
  ],
  [
    /(const args = buildClaudeSpawnArgs\(\{\n(\s*)pluginDir,\n)/,
    '$1$2anycodeBinCwd: this.options.cwd,\n',
  ],
], hostHelper);

// 3. Claude tabs: the `/` menu lists only AnyCode's fixed commands, although
//    the CLI expands a typed /name. The skills-list IPC reply gains
//    `claudeCommands` (what the CLI loads: workspace and personal commands and
//    skills, and plugin skills/commands as /plugin:name), and the composer
//    shows them in Claude tabs, inserting the literal `/name ` for the CLI to
//    expand. Upstream issue: incadawr/anycode#87.
const mainHelper = `

// --- anycode-bin downstream patch: Claude command/skill entries for the slash menu ---
${pluginResolver}
async function anycodeBinClaudeSlashEntries(deps, tabId) {
  try {
    const workspace = tabId === void 0 ? void 0 : deps.workspaceForTab(tabId);
    if (typeof workspace !== "string" || workspace === "") return [];
    const fs2 = await import("node:fs");
    const fsp2 = fs2.promises;
    const path2 = await import("node:path");
    const MAX_ENTRIES = 1000;
    const MAX_BYTES = 256 * 1024;
    const TOKEN = /^[A-Za-z0-9_:-]+$/;
    const out = [];
    const seen = new Set();
    const clip = (s) => s.length > 300 ? s.slice(0, 297) + "..." : s;
    const unquote = (s) => s.trim().replace(/^(["'])(.*)\\1$/, "$2").trim();
    const parse = (text) => {
      const meta = {};
      let body = text;
      const m = /^---\\r?\\n([\\s\\S]*?)\\r?\\n---[ \\t]*(?:\\r?\\n|$)/.exec(text);
      if (m) {
        body = text.slice(m[0].length);
        const lines = m[1].split(/\\r?\\n/);
        for (let i = 0; i < lines.length; i++) {
          const kv = /^([A-Za-z][\\w-]*):\\s*(.*)$/.exec(lines[i]);
          if (!kv) continue;
          let value = kv[2];
          if (/^[>|][+-]?\\s*$/.test(value)) {
            const block = [];
            while (i + 1 < lines.length && /^\\s+\\S|^\\s*$/.test(lines[i + 1])) block.push(lines[++i].trim());
            value = block.filter(Boolean).join(" ");
          }
          meta[kv[1]] = unquote(value);
        }
      }
      const first = body.split(/\\r?\\n/).map((l) => l.trim()).find((l) => l !== "" && !l.startsWith("<!--"));
      return { meta, firstLine: first ? first.replace(/^#+\\s*/, "") : "" };
    };
    const describe = (meta, firstLine) => {
      const hint = meta["argument-hint"] ? meta["argument-hint"] + " — " : "";
      return clip(hint + (meta.description || firstLine || ""));
    };
    const read = async (file) => {
      const st = await fsp2.stat(file);
      if (!st.isFile() || st.size > MAX_BYTES) return null;
      return fsp2.readFile(file, "utf8");
    };
    const push = (name, meta, firstLine, label) => {
      if (!TOKEN.test(name) || seen.has(name) || out.length >= MAX_ENTRIES) return;
      seen.add(name);
      out.push({ name, description: describe(meta, firstLine), sourceLabel: label, insertText: "/" + name + " " });
    };
    const addCommands = async (dir, prefix, label, depth = 0) => {
      if (depth > 4 || out.length >= MAX_ENTRIES) return;
      let entries;
      try { entries = await fsp2.readdir(dir, { withFileTypes: true }); } catch { return; }
      entries.sort((a, b) => a.name.localeCompare(b.name));
      for (const e of entries) {
        if (e.name.startsWith(".")) continue;
        const full = path2.join(dir, e.name);
        let isDir = e.isDirectory();
        if (e.isSymbolicLink()) { try { isDir = (await fsp2.stat(full)).isDirectory(); } catch { continue; } }
        if (isDir) { await addCommands(full, prefix + e.name + ":", label, depth + 1); continue; }
        if (!e.name.endsWith(".md")) continue;
        try {
          const text = await read(full);
          if (text === null) continue;
          const { meta, firstLine } = parse(text);
          push(prefix + e.name.slice(0, -3), meta, firstLine, label);
        } catch {}
      }
    };
    const addSkills = async (dir, prefix, label) => {
      let entries = [];
      try { entries = await fsp2.readdir(dir, { withFileTypes: true }); } catch { return; }
      entries.sort((a, b) => a.name.localeCompare(b.name));
      for (const e of entries) {
        if (e.name.startsWith(".")) continue;
        try {
          const text = await read(path2.join(dir, e.name, "SKILL.md"));
          if (text === null) continue;
          const { meta, firstLine } = parse(text);
          if (meta["user-invocable"] === "false") continue;
          // The CLI names skills by directory when the frontmatter name is
          // not a valid command token (e.g. it contains spaces).
          push(prefix + (TOKEN.test(meta.name || "") ? meta.name : e.name), meta, firstLine, label);
        } catch {}
      }
    };
    await addCommands(path2.join(workspace, ".claude", "commands"), "", "Project command");
    await addSkills(path2.join(workspace, ".claude", "skills"), "", "Project skill");
    const home = deps.home();
    if (typeof home === "string" && home !== "") {
      await addCommands(path2.join(home, ".claude", "commands"), "", "Personal command");
      await addSkills(path2.join(home, ".claude", "skills"), "", "Personal skill");
      await addSkills(path2.join(home, ".agents", "skills"), "", "Personal skill");
      for (const plugin of anycodeBinEnabledPlugins(fs2, path2, home, workspace, true)) {
        const label = "Plugin " + plugin.name;
        await addCommands(path2.join(plugin.dir, "commands"), plugin.name + ":", label);
        await addSkills(path2.join(plugin.dir, "skills"), plugin.name + ":", label);
      }
    }
    return out;
  } catch {
    return [];
  }
}
`;

patchFile(fileWith('out/main', 'async function handleSkillsList('), 'skills-list IPC returns Claude slash entries', [
  [
    /(async function handleSkillsList\(deps, raw\) \{\n(?:[^\n]*\n){2}\s*return )(buildSnapshot\$?\d*\(deps, tabId\));/,
    '$1{ ...await $2, claudeCommands: await anycodeBinClaudeSlashEntries(deps, tabId) };',
  ],
], mainHelper);

patchFile(fileWith('out/renderer', 'function filterSlashItems('), 'Claude tabs list .claude commands in the slash menu', [
  [
    'const skillsSupported = engine === null;',
    'const skillsSupported = engine === null;\n  const claudeSlashSupported = engine?.id === "claude";',
  ],
  ['skillsSupported ? slashSkills : []', 'skillsSupported || claudeSlashSupported ? slashSkills : []'],
  ['if (!slashOpen || !skillsSupported) {', 'if (!slashOpen || !(skillsSupported || claudeSlashSupported)) {'],
  [
    'setSlashSkills(skillsToSlashSkills(snapshot.rows));',
    'setSlashSkills(claudeSlashSupported ? Array.isArray(snapshot.claudeCommands) ? snapshot.claudeCommands : [] : skillsToSlashSkills(snapshot.rows));',
  ],
  ['}, [slashOpen, slashTabId, skillsSupported]);', '}, [slashOpen, slashTabId, skillsSupported, claudeSlashSupported]);'],
  ['intent: { kind: "insert", text: `$${skill.name} ` }', 'intent: { kind: "insert", text: skill.insertText ?? `$${skill.name} ` }'],
  // Since 0.0.103 upstream lists the commands of its own catalog
  // (claudeCommands: project commands, personal ones with the opt-in) as a
  // separate section. Where a name is in both, keep upstream's row only.
  [
    'const skillRows = [];\n  skills.forEach((skill) => {\n',
    'const skillRows = [];\n  const anycodeBinNative = new Set(claudeCommands.map((row) => row.name).filter((name) => !commands.some((command) => command.id === name)));\n  skills.forEach((skill) => {\n    if (anycodeBinNative.has(skill.name)) return;\n',
  ],
  // Namespaced commands (`/ci:inspect`, `/superpowers:brainstorming`) keep the
  // menu open past the colon.
  ['return ch !== void 0 && /[A-Za-z0-9_-]/.test(ch);', 'return ch !== void 0 && /[A-Za-z0-9_:-]/.test(ch);'],
]);
