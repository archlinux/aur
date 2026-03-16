# ZigMakeHuman

`zigmkhuman` is a custom MakeHuman 1 package built from the local `makehuman/`
git checkout and bundled with the `9_aiohttp_api` plugin.

## What You Get

- A standalone launcher: `zigmkhuman`
- An embedded aiohttp API plugin, auto-loaded as a system plugin
- A minimal browser UI on `/`
- JSON endpoints under `/api/v1/...`
- A WebSocket endpoint on `/ws`
- A small CLI client: `zigmkhuman-api-client`

## Build And Install

Run this in the root of the current folder:

```bash
makepkg -si
```

This installs:

- `/opt/zigmkhuman`
- `/usr/bin/zigmkhuman`
- `/usr/bin/zigmkhuman-api-client`

It does not overwrite `/usr/bin/makehuman`.

## Run

Start the packaged app:

```bash
zigmkhuman
```

Once MakeHuman is up, the API binds by default on:

```text
0.0.0.0:18080
```

Local browser UI:

```text
http://127.0.0.1:18080/
```

Remote clients should use the IP or hostname of the machine running
`zigmkhuman`, for example:

```text
http://zigdlap:18080/
```

Health check:

```bash
zigmkhuman-api-client health
```

List modifiers:

```bash
zigmkhuman-api-client list-modifiers
```

Set one modifier:

```bash
zigmkhuman-api-client set-modifier macrodetails/Gender 0.8
```

Save an MHM:

```bash
zigmkhuman-api-client save /tmp/test_model.mhm
```

Export OBJ:

```bash
zigmkhuman-api-client export obj /tmp/test_model.obj
```

## API Config

The plugin writes its config to:

```text
~/makehuman/v1py3/zigmkhuman_aiohttp_api.json
```

Example config is included as:

```text
/usr/share/doc/zigmkhuman/zigmkhuman_aiohttp_api.example.json
```

Default values:

```json
{
  "allow_remote": true,
  "auth_token": "",
  "enabled": true,
  "host": "0.0.0.0",
  "port": 18080,
  "request_timeout_seconds": 30
}
```

## Deploy On zigdlap

If the repo tree is already on `zigdlap`, build there:

```bash
ssh zigdlap 'cd /path/to/zigmkhuman && makepkg -si'
```

Then run:

```bash
ssh zigdlap 'zigmkhuman'
```

In another shell:

```bash
ssh zigdlap 'zigmkhuman-api-client health'
```

## Optional: Plugin-Only Install Into The Stock makehuman Package

If you still want to attach just the API plugin to the stock AUR `makehuman`
package, the package layout from AUR installs MakeHuman under:

```text
/opt/makehuman
```

So the plugin directory is:

```text
/opt/makehuman/plugins/9_aiohttp_api
```

Copying the `9_aiohttp_api/` directory there is enough to make it auto-load as
a system plugin.
