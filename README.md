## How to bump version

1. Update new version: Bump new version in `PKGBUILD`
2. Pull new package: Run `make force-sync`
3. Check new SHA256: `make sha256`
4. Update new SHA256: copy previous output to `PKGBUILD`
5. Try sync/install new package: `make sync install`
6. Generate new `.SRCINFO`: `make SRCINF`
7. Add and commit modified files.
