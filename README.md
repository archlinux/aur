# AUR Package for lol-lint

## Installation

```bash
yay -S lol-lint
```

Or manually:

```bash
git clone https://aur.archlinux.org/lol-lint.git
cd lol-lint
makepkg -si
```

## Updating

After each release:

1. Update `pkgver` in `PKGBUILD`
2. Download the new release tarball and calculate SHA256:

```bash
curl -L -o /tmp/lol-lint-x86_64-unknown-linux-gnu.tar.gz https://github.com/jerankda/lol-lint/releases/download/v0.1.1/lol-lint-x86_64-unknown-linux-gnu.tar.gz
sha256sum /tmp/lol-lint-x86_64-unknown-linux-gnu.tar.gz
```

3. Update `sha256sums` in `PKGBUILD`
4. Test the build:

```bash
makepkg -si
```

5. Generate `.SRCINFO`:

```bash
makepkg --printsrcinfo > .SRCINFO
```

6. Commit and push to AUR:

```bash
git add PKGBUILD .SRCINFO
git commit -m "Update to v0.1.1"
git push
```

## Publishing to AUR

1. Create an AUR account at https://aur.archlinux.org/register
2. Add your SSH key to your AUR account
3. Clone the AUR repository:

```bash
git clone ssh://aur@aur.archlinux.org/lol-lint.git
```

4. Copy `PKGBUILD` to the cloned directory
5. Generate `.SRCINFO`:

```bash
makepkg --printsrcinfo > .SRCINFO
```

6. Commit and push:

```bash
git add PKGBUILD .SRCINFO
git commit -m "Initial commit: lol-lint 0.1.1"
git push
```
