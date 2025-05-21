# CATO Linux Client

## Build new Version

- First we have to find what the current version is by examing the generic LATEST .deb file
```
mkdir /tmp/cato-latest
cd /tmp/cato-latest
wget https://clientdownload.catonetworks.com/public/clients/cato-client-install.deb
ar xv cato-client-install.deb
tar -xf control.tar.xz
echo; echo
cat control | grep -i version
```
- Now we know the latest version, example `5.4.0.1006`.  Ignore the word `-release` for the version.
- Now lets download and SHA checksum the actual versioned .deb
```
version=5.4.0.1006
mkdir /tmp/cato-versioned
cd /tmp/cato-versioned
wget https://clients.catonetworks.com/linux/$version/cato-client-install.deb
echo; echo
sha256sum cato-client-install.deb
```
    - If that works, we know that `5.4.0.1006` is valid
- SHA Checksums
    - Get the sha checksum of the 5.4.0.1006 version .deb you downloaded
    - `sha256sum cato-client-install.deb`
- Edit PKGBUILD and bump `pkgver` to the verified version above (5.4.0.1006 as an example).  If all new version, set `pkgrel` back to 1
- Change the FIRST of the 3 checksums to the new sha from the versioned .deb file.
    - The other 2 checksums don't change
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
