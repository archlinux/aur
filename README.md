# openwhispr-appimage — AUR maintenance repository

AUR package for [OpenWhispr](https://github.com/OpenWhispr/openwhispr), the
privacy-first voice-to-text app. Ships the official upstream AppImage.

## Install

```bash
# Via any AUR helper
paru -S openwhispr-appimage
yay  -S openwhispr-appimage

# Manual
git clone https://aur.archlinux.org/openwhispr-appimage.git
cd openwhispr-appimage
makepkg -si
```

## Runtime dependency

The AppImage requires **FUSE 2**:

```bash
sudo pacman -S fuse2
```

---

## Automated updates (GitHub Actions)

The workflow in `.github/workflows/update.yml` runs daily and:

1. Queries the GitHub Releases API for the latest `OpenWhispr/openwhispr` tag.
2. Updates `pkgver` and resets `pkgrel=1` in `PKGBUILD`.
3. Runs `updpkgsums` to recalculate the SHA-256 of the new AppImage.
4. Regenerates `.SRCINFO` via `makepkg --printsrcinfo`.
5. Commits and pushes to the AUR **only** if `git diff` shows real changes.

### Configuring the AUR_SSH_PRIVATE_KEY secret

The workflow needs write access to the AUR repository. Provide it via a deploy
key stored as a GitHub Actions secret.

#### Step 1 — Generate an SSH key pair

```bash
ssh-keygen -t ed25519 -C "aur-bot@openwhispr-appimage" \
  -f ~/.ssh/aur_openwhispr -N ""
```

This produces:
- `~/.ssh/aur_openwhispr`      — **private key** (goes to GitHub)
- `~/.ssh/aur_openwhispr.pub`  — **public key**  (goes to AUR account)

#### Step 2 — Register the public key on AUR

1. Log in to <https://aur.archlinux.org>.
2. Go to **My Account → SSH Public Keys**.
3. Paste the contents of `~/.ssh/aur_openwhispr.pub` and save.

#### Step 3 — Add the private key as a GitHub secret

1. In your GitHub repository go to **Settings → Secrets and variables → Actions**.
2. Click **New repository secret**.
3. Name: `AUR_SSH_PRIVATE_KEY`
4. Value: the full contents of `~/.ssh/aur_openwhispr` (including the
   `-----BEGIN …-----` header and footer).
5. Save.

#### Step 4 — Verify

Run the workflow manually via **Actions → Update AUR Package → Run workflow**.
The job summary will show the version comparison and whether a commit was pushed.

---

## Repository layout

```
openwhispr-appimage/
├── .github/
│   └── workflows/
│       └── update.yml    # Automated update workflow
├── .SRCINFO              # Auto-generated, committed alongside PKGBUILD
├── PKGBUILD
└── README.md
```

## Naming conventions

| Name | Value | Reason |
|------|-------|--------|
| `pkgname` | `openwhispr-appimage` | AUR/pacman lowercase convention |
| `_appname` | `OpenWhispr` | Upstream asset casing |
| AppImage asset | `OpenWhispr-{ver}-linux-x64.AppImage` | Matches upstream release |
| Launcher binary | `/usr/bin/openwhispr` | Short, memorable, no case issues |
