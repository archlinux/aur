# hindsight-api

Hindsight agent memory server — `retain`, `recall` and `reflect` over PostgreSQL +
pgvector. This package is the **slim** variant: embeddings and reranking run through
ONNX and FlashRank, so no PyTorch is installed. The bundled venv lives in
`/opt/hindsight-api`, with `hindsight-api`, `hindsight-admin` and `hindsight-worker`
symlinked into `/usr/bin`.

Upstream: <https://hindsight.vectorize.io> — MIT.

## Requirements this package does not install

A PostgreSQL server with the `vector` extension. Both are in the repositories:

```bash
sudo pacman -S postgresql pgvector
```

## 1. Create the database

The server must be running, and `vector` has to be created by a superuser — the
extension is not marked `trusted`, so a normal role cannot add it:

```bash
sudo systemctl enable --now postgresql
sudo -u postgres initdb -D /var/lib/postgres/data   # only if the cluster does not exist yet
sudo -u postgres createuser --createdb "$USER"      # role matching your login user
createdb hindsight
sudo -u postgres psql -d hindsight -c 'CREATE EXTENSION vector'
```

Using a role named after your login user lets the service connect over the local
socket with peer authentication, so no password is stored in any config file.

## 2. Configure it

```bash
mkdir -p ~/.config/hindsight
cp /usr/share/hindsight-api/hindsight-api.env.example ~/.config/hindsight/hindsight-api.env
chmod 600 ~/.config/hindsight/hindsight-api.env   # it holds an API key
```

Edit at least these. `HINDSIGHT_API_LLM_*` is **mandatory**: facts are extracted and
consolidated by a model, so the server refuses to start without one.

```ini
HINDSIGHT_API_DATABASE_URL=postgresql:///hindsight

HINDSIGHT_API_LLM_PROVIDER=deepseek          # or openai, anthropic, gemini, ollama, llamacpp…
HINDSIGHT_API_LLM_API_KEY=sk-...
HINDSIGHT_API_LLM_MODEL=deepseek-v4-flash

HINDSIGHT_API_EMBEDDINGS_PROVIDER=onnx       # required: the default needs sentence-transformers
HINDSIGHT_API_RERANKER_PROVIDER=onnx         # or flashrank
```

Notes:

- The upstream default providers are `local`, which need `sentence-transformers` and
  PyTorch — neither is in this package. Use `onnx` (defaults: `intfloat/multilingual-e5-small`
  and `hindsight-ai/hs-rerank-1`), or a hosted provider.
- The API listens on **all interfaces, port 8888** by default. Set
  `HINDSIGHT_API_HOST=127.0.0.1` and/or `HINDSIGHT_API_PORT` if that clashes.
- First start downloads ~490 MiB of models. On a slow link the 300 s default
  `HINDSIGHT_API_MODEL_INIT_TIMEOUT` kills startup mid-download — raise it, or pre-fetch
  the two models first.
- On Xet-backed HuggingFace downloads, a dropped transfer loses the whole file. Setting
  `HF_HUB_DISABLE_XET=1` falls back to plain HTTP, which resumes where it stopped.

## 3. Run it

```bash
systemctl --user daemon-reload
systemctl --user enable --now hindsight-api.service
journalctl --user -u hindsight-api.service -f
```

For the service to survive logout — required on a headless box:

```bash
sudo loginctl enable-linger "$USER"
```

`curl http://127.0.0.1:8888/health` returning 200 means it is serving.

## Admin

`hindsight-admin --help` covers backup/restore, migrations, bank export/import and
releasing stuck worker tasks (`worker-status`, `decommission-worker`). Migrations run
automatically at startup; `hindsight-admin run-db-migration` forces them.

## For the pi coding agent

Pair with `pi-ext-hindsight`, which wires the agent to this server.
