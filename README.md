### How to deploy

- Make sure the sha256 sums are valid at [PKGBUILD](PKGBUILD#L19).
    ```sh
    sha256sum kubenav.png
    sha256sum kubenav.desktop
    # LICENSE file
    curl -s https://raw.githubusercontent.com/kubenav/kubenav/master/LICENSE | sha256sum
    # AppRelease file
    pkgname=$(cat PKGBUILD | grep 'pkgname=' | awk -F "=" '{print $2}') && \
    pkgver=$(cat PKGBUILD | grep 'pkgver=' | awk -F "=" '{print $2}') && \
    curl -L "https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-linux-amd64.AppImage" | sha256sum
    ```

- Bump `pkgver` and `pkgrel` at [PKGBUILD](PKGBUILD#L4) accordingly
(see https://wiki.archlinux.org/index.php/PKGBUILD#Version).

- Run `rm -rf pkg/ src/ && makepkg --install --force` to check whether the installation works
successfully.

- Run `makepkg --printsrcinfo > .SRCINFO` to update [.SRCINFO](.SRCINFO).

- Commit and push.