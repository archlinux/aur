# pi-ext-hindsight

Hindsight long-term memory for the [pi coding agent](https://pi.dev): recall before
each turn, retain at the end of it, plus tools for knowledge pages and reflection.

This package ships the official adapter (`@vectorize-io/hindsight-coding-agents`) —
its self-contained `dist/pi.js` plus the companion skill — installed to
`/usr/share/pi/extensions/hindsight`. Only the pi entry point is packaged; the
tarball's other hooks are for Claude Code, Codex, Cursor and ~17 other agents.

Upstream: <https://hindsight.vectorize.io> — MIT.

## Requires a server

This is a client. It needs a running Hindsight server — `hindsight-api` in this
repository set — and does nothing useful without one.

## 1. Enable it in pi

pacman does not edit your pi configuration. Symlink it into place:

```bash
ln -s /usr/share/pi/extensions/hindsight ~/.pi/agent/extensions-ordered/04-hindsight
ln -sfn /usr/share/pi/extensions/hindsight/skill ~/.pi/agent/skills/hindsight-coding-agent
```

(The second line makes the `hindsight-coding-agent` skill readable by the agent.)

## 2. Configure it

```bash
mkdir -p ~/.hindsight
cp /usr/share/pi-ext-hindsight/coding-agent.json.example ~/.hindsight/coding-agent.json
```

```json
{
  "apiUrl": "http://127.0.0.1:8888",
  "autoUpdate": false
}
```

- `apiUrl` must match wherever `hindsight-api` listens. If you changed its port,
  change it here too.
- Keep `autoUpdate: false` — this copy is owned by pacman, and the adapter detects that
  and will not replace itself anyway.
- To restrict which projects get memory, add `"optInOnly": true` and
  `"optInPaths": ["/path/to/repo"]`. Without them **every** project is remembered,
  which is the adapter's own default.
- Per-repository banks are named `coding-agent::<project>` from the git repository.
  A directory that is not a git repo, or one rooted at your home directory, gets a
  bank named after you instead.

## 3. Restart pi

The adapter reads its configuration when pi loads the plugin, so a `/reload` is not
enough — start a new pi session. On load it injects a tool guide and registers its
tools; in an inert (not opted-in) project it registers nothing at all.

## What you get

| | |
|---|---|
| Recall | injected before each turn — there is no `recall` tool to call by hand |
| `hindsight_reflect` | ask the bank a question directly; slower, costs an LLM call |
| Knowledge pages | `hindsight_search_knowledge_pages`, `_list_`, `_read_` |
| `hindsight_ingest_document` | file an external document or durable note |
| `hindsight_capture_initiative` | record a plan or feature as a tracked page |

## Verifying it works

```bash
tail -f ~/.hindsight/coding-agents-logs/diag.jsonl
```

`session_start`, `inject_ok` and `retain_ok` mean each half is working; `retain_failed`
and `pages_failed` usually mean the server is down or `apiUrl` is wrong. A `401` means
it is still pointing at Hindsight Cloud with no API token — check `apiUrl`.

Remembering a session costs LLM tokens on your server, at the end of the session, after
the last turn. On a local 9B a single-paragraph retain measured 79 s; on an API model,
a few seconds.
