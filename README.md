# gemini-api-cli-bin (AUR Package)

AUR package for [`gemini-api`](https://github.com/google-gemini/gemini-api-cli) — Google's official command-line interface for the Gemini API.

This package repackages the official pre-compiled upstream binary releases for `x86_64` and `aarch64` architectures.

## Features Packaged
- Executable binary installed to `/usr/bin/gemini-api`
- Convenience symlink `/usr/bin/gemini-api-cli` -> `/usr/bin/gemini-api`
- Shell completions installed for:
  - Bash (`/usr/share/bash-completion/completions/gemini-api`)
  - Zsh (`/usr/share/zsh/site-functions/_gemini-api`)
  - Fish (`/usr/share/fish/vendor_completions.d/gemini-api.fish`)
- License installed under `/usr/share/licenses/gemini-api-cli-bin/LICENSE`
- Upstream documentation installed under `/usr/share/doc/gemini-api-cli-bin/README.md`

## Installation

### Using an AUR Helper (e.g. `yay` or `paru`)
```bash
yay -S gemini-api-cli-bin
# or
paru -S gemini-api-cli-bin
```

### Manual Installation with `makepkg`
```bash
git clone https://aur.archlinux.org/gemini-api-cli-bin.git
cd gemini-api-cli-bin
makepkg -si
```

## Quick Start
```bash
# Set your API key
export GEMINI_API_KEY="your-api-key"
# Or run interactive configuration
gemini-api configure

# Test text generation
gemini-api generate "Explain concurrency in one sentence"

# Check available models
gemini-api models

# Verify credentials
gemini-api whoami
```

## Publishing to AUR (Maintainer)
```bash
git init
git remote add origin ssh://aur@aur.archlinux.org/gemini-api-cli-bin.git
git add PKGBUILD .SRCINFO README.md .gitignore
git commit -m "chore: initial release v0.4.4"
git push origin master
```
