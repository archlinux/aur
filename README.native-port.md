<!--
SPDX-FileCopyrightText: 2026 pacmanics

SPDX-License-Identifier: 0BSD
-->

# pentest-ghostwriter

`pentest-ghostwriter` is a local-first Arch Linux port of Ghostwriter adapted for single-user offensive security workflows on a workstation.

Ghostwriter itself is an offensive security reporting and project management platform. It is also known from Kali Linux packaging, but this package is an unofficial Arch adaptation that defaults to localhost-only single-user behavior.

## Package goals

- local-first desktop workflow on Arch Linux
- localhost-only default bind
- single-user default behavior
- automatic localhost login enabled by default
- desktop launchers for starting and stopping Ghostwriter
- no hardcoded public credentials in the package

## First-time setup

```bash
sudo pentest-ghostwriter-init
```

This initializes PostgreSQL, Valkey, the Python runtime, Ghostwriter's frontend build, database migrations, and the local services.

## Login behavior

By default this package enables **Local Trust Mode**:

- requests from `127.0.0.1` / `::1` are logged in automatically
- login, logout, password reset, and password change routes are redirected back to `/home/`
- this is intended for local single-user workstation usage only

If you want the standard Ghostwriter login flow instead:

```bash
sudo pentest-ghostwriter-init --no-local-trust
```

When standard login mode is used, generated admin credentials are written to:

```text
/etc/pentest-ghostwriter/admin-credentials
```

## Desktop launchers

The package installs two English desktop entries:

- **Ghostwriter**
- **Stop Ghostwriter**

The main launcher opens `http://127.0.0.1:8000/home/` and starts services on demand when needed.

## Services

The local package flow uses these services:

- `postgresql`
- `valkey`
- `pentest-ghostwriter-web.service`
- `pentest-ghostwriter-queue.service`
- `pentest-ghostwriter-collab.service`

Hasura / GraphQL remains optional for this local Arch port.
