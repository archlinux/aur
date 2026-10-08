# krdc-ai — Arch package

KRDC with the AI assistant panel, packaged the AUR way: upstream KRDC is
**not** forked. The AI panel ships as `krdc-ai.patch`, applied at build time
onto the exact upstream commit pinned in the PKGBUILD (`_commit`).

## Install / rebuild

```bash
makepkg -si          # build + install, replaces extra/krdc
```

The package `provides`/`conflicts`/`replaces` `krdc`, so pacman swaps it in
for the repo version. Your `~/.config/krdcrc` (including the `[AiAssistant]`
section pointing at Ollama) carries over unchanged.

## Updating to a newer KRDC

The AI work lives on the `ai-assistant` branch of `../krdc` as a six-commit
series (core API → focus bugfix → RDP backend → panel → main-window wiring →
engine test). The package patch is just that range squashed:

1. In `../krdc`: `git fetch`, rebase the branch onto the new upstream commit
   (`git rebase --onto <new-upstream> origin/master~0 ai-assistant` or resolve
   conflicts by hand), and rebuild + run `test/run_ai_test.sh`.
2. Regenerate the patch:
   ```bash
   cd ../krdc
   git diff origin/master..ai-assistant > ../pkg/krdc-ai.patch
   ```
3. Update `_commit` (the new upstream base), `pkgver` (see
   `RELEASE_SERVICE_VERSION_*` in CMakeLists.txt) and `pkgrel=1`.
4. Sanity-check before packaging:
   `git apply --check ../pkg/krdc-ai.patch` against a clean checkout.

## Build options (in the PKGBUILD)

- `WITH_AI` is on by default upstream too; it's passed explicitly for clarity.
- `WITH_SPICE=NO` here (upstream default is ON) to keep the dep footprint
  like the repo package. Flip it to YES if you ever use `spice://` — you'll
  need `spice-glib`/`glib2` at build time.
- `package()` strips the compiled mime database that KRDC's install step
  generates inside `$pkgdir`. Only `mime/packages/*.xml` may ship; the
  compiled database (`globs`, `types`, `mime.cache`, …) belongs to
  `shared-mime-info`, and shipping it fails install with "exists in
  filesystem" errors. extra/krdc strips it the same way.

## Publishing to the AUR

Repo is live: https://aur.archlinux.org/packages/krdc-ai (remote `origin`
= `ssh://aur@aur.archlinux.org/krdc-ai.git`, login = your archlinux.org
account, SSH key added under aur.archlinux.org → My Settings).

**Every commit must contain an up-to-date `.SRCINFO`** or the AUR
pre-receive hook rejects the push:

```bash
makepkg --printsrcinfo > .SRCINFO   # run after any PKGBUILD change
git add PKGBUILD krdc-ai.patch README.md .SRCINFO
git commit && git push
```

Users install it with any AUR helper: `yay -S krdc-ai`.

## Going back to the repo version

```bash
sudo pacman -S --overwrite '*' krdc   # or: sudo pacman -R krdc-ai && sudo pacman -S krdc
```

The `[AiAssistant]` section in krdcrc is inert for the stock package.
