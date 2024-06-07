# CATO Linux Client

## Build new Version

- Edit PKGBUILD and bump `pkgver`.  If all new version, set `pkgrel` back to 1
- Manually download the proper .deb and run `sha256sum` on it and update the checksums.
- Create new .SRCINFO `makepkg --printsrcinfo > .SRCINFO`
- Test install locally `makepkg -sirc`
    - Be sure to `sudo systemctl restart cato-client.service` if already installed or it will still say the old version
    - `cato-sdp version` should be new version you installed
- Clean any non git changes from build `git clean -dfx`
- Commit only required files
```
git add README.md PKGBUILD .SRCINFO
git commit -m "Useful commit message"
git push
```
