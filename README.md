# pathsearch

## Release Procedure

1. Download `tar.gz` from source, run `b2sum` on it
2. Bump version and `b2sum` in `PKGBUILD`
3. Run `makepkg --printsrcinfo > .SRCINFO`
4. Run `makepkg` to make sure everything works
5. Commit and push
