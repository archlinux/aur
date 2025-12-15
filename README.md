# edopro-bin

An AUR package for Project Ignis: EDOPro, built from the official binaries.

# Build and test

A Dockerfile is provided for quick testing in a fresh environment:

```bash
# Start an interactive shell in the container
docker compose run --rm archlinux

# Once inside, you can:
makepkg -si          # Build and install the package
makepkg -s           # Build without installing  
makepkg -f           # Force rebuild
namcap PKGBUILD      # Lint the PKGBUILD
makepkg --printsrcinfo > .SRCINFO  # Generate .SRCINFO for AUR
```
