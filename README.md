# DeepTutor — AUR package

This directory contains the staging files for the `deeptutor` package on the
Arch User Repository (AUR).

## Files

| File        | Purpose                                           |
| ----------- | ------------------------------------------------- |
| `PKGBUILD`  | Build script (reviewed by `namcap` and maintainer) |
| `.SRCINFO`  | Machine-readable metadata consumed by AUR helpers |

## Status

- pkgver: **1.4.10** (matches upstream tag `v1.4.10`)
- pkgrel: 1
- Source: `https://github.com/HKUDS/DeepTutor/archive/refs/tags/v1.4.10.tar.gz`
- sha256: `f357621ca92d769607ac9a201ce6d36ffb8c6154fb178f26fe6c5c149f80a0c7`
- License: Apache-2.0
- Arch: any (pure Python)
- Build backend: setuptools (PEP 517)

## Test locally before publishing

```bash
# 1. Lint
namcap PKGBUILD

# 2. Build (will fail if any dep isn't installed)
makepkg -si

# 3. Smoke test the installed binary
deeptutor --help
```

## Publish to AUR

The AUR uses a git repo per package base. The standard workflow after review:

```bash
# 1. Clone the (currently empty) AUR package base.
#    First-time submissions need the maintainer to create the base at
#    https://aur.archlinux.org/pkgbase/<pkgname>/submit before this works,
#    or use the SSH/HTTPS RPC push after git init in a new dir.
git clone ssh://aur@aur.archlinux.org/deeptutor.git
cd deeptutor

# 2. Drop in the reviewed files
cp ../DeepTutor/packaging/aur/PKGBUILD .
cp ../DeepTutor/packaging/aur/.SRCINFO .

# 3. Edit Maintainer line in PKGBUILD (currently a placeholder).

# 4. Commit and push
git add PKGBUILD .SRCINFO
git commit -m "Initial upload: deeptutor 1.4.10"
git push
```

## Access credentials needed from the user

The push step above requires **one** of:

1. **SSH key** registered with the AUR account
   (`https://aur.archlinux.org/account/` → "My Account" → "SSH Public Key")
2. **HTTPS token** (Account → "Account Details" → generate token), passed as
   basic-auth password.

Tell me which method you want to use, and provide the credential. If SSH, just
make sure your public key is registered — I'll handle the clone. If HTTPS,
share the token (or set `AUR_TOKEN` in our session) and I'll handle the rest.

## Known dep gaps

The following `Requires-Dist` deps are **not yet in AUR** and need helper
packages before the build will resolve cleanly:

- `python-perplexityai`
- `python-oauth-cli-kit`
- `python-llama-index`
- `python-llama-index-retrievers-bm25`
- `python-pocketbase`
- `python-json-repair`

Two options:

1. **Publish these as separate AUR helper packages first**, then they pull in
   `deeptutor` cleanly.
2. **Skip the LLM providers / RAG / server features** by trimming the
   `depends=()` array to just core/CLI (`python-aiohttp`, `python-openai`,
   `python-yaml`, `python-jinja`, …) and move everything else to
   `optdepends=()`. The CLI's `chat` capability will still work for a single
   OpenAI-compatible provider.

Decide before we push.
