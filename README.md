<!--
SPDX-FileCopyrightText: 2026 Florent Jardin <florent.jardin@dalibo.com>

SPDX-License-Identifier: 0BSD
-->

# pg-migrate-bin

Build package `pg-migrate-bin` for AUR.  
Submission guidelines: <https://wiki.archlinux.org/title/AUR_submission_guidelines>

**Update metadata**

Update `pkgver` variable from `PKGBUILD` and run:

```sh
make
```

**Installl**

```sh
make install
```

# About PostgreSQL Migrator

PostgreSQL Migrator (a.k.a `pg_migrate`) is a modern initiative led by Dalibo as
part of its Dalibo Labs open-source solutions offering. Its goal is to provide a
new experience that simplifies migrations to PostgreSQL with minimal technical
knowledge. The tool includes a command-line interface to perform all stages of a
migration, as well as an internal web server to explore components from the
inventory of the remote catalog.

- <https://postgresql-migrator.rtfd.io/>
- <https://gitlab.com/dalibo/pg_migrate>
