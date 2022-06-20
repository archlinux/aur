# How to release

1. Push something to the main branch.
2. The CI/CD pipe will trigger and release a new version on crates.io.
3. publish the version to aur.
4. Test installation of package with: `makepkg --clean --cleanbuild --install --force`
6. Generate `.SRCINFO` with `./generate-srcinfo.sh`
7. Commit changes & push to AUR Repository