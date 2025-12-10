# Mistral Vibe Hardened - Update Automation

## Update Process

### Quick Version Check

```bash
./check-version.sh
```

### Automated Update

```bash
./auto-update-vibe.sh
```

This will:
1. Fetch latest version from GitHub API
2. Update PKGBUILD
3. Regenerate .SRCINFO
4. Build and test the package

### Manual Update Steps

1. **Check latest version:**
   ```bash
   curl -sL https://api.github.com/repos/mistralai/mistral-vibe/releases/latest | jq -r '.tag_name'
   ```

2. **Update PKGBUILD:**
   ```bash
   # Edit pkgver and reset pkgrel to 1
   vim PKGBUILD
   ```

3. **Build:**
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   makepkg -f
   ```

4. **Test:**
   ```bash
   sudo pacman -U mistral-vibe-hardened-*.pkg.tar.zst
   vibe --help
   ```

5. **Push to AUR:**
   ```bash
   git add PKGBUILD .SRCINFO
   git commit -m "Update to vX.Y.Z"
   git push
   ```

## Package Architecture

This package uses `uv tool install` to create a **self-contained environment**:

```
/opt/mistral-vibe/
├── bin/
│   ├── vibe           # Main executable
│   └── vibe-acp       # ACP mode executable
└── mistral-vibe/      # Virtual environment with all dependencies
    ├── bin/
    ├── lib/
    └── ...
```

Benefits:
- **Isolated**: Doesn't pollute system Python
- **Complete**: All 54 dependencies bundled
- **Reproducible**: Same versions on every install

## Comparison to Other Approaches

| Approach | Deps in PKGBUILD | Build Time | Isolation |
|----------|------------------|------------|-----------|
| Source (existing) | 20+ | Slow | None |
| **This package** | 2 | Fast | Full virtualenv |

---

**Maintainer**: Markus Maiwald <markus@maiwald.work>
