### How to deploy

- Make sure the sha256 sums are valid at [PKGBUILD](PKGBUILD#L17).
    ```sh
    sha256sum whatsapp-nativefier-dark.png
    sha256sum whatsapp-nativefier-dark.desktop
    sha256sum whatsapp-nativefier-dark-inject.js
    ```

- Bump `pkgver` and `pkgrel` at [PKGBUILD](PKGBUILD#L4) accordingly
(see https://wiki.archlinux.org/index.php/PKGBUILD#Version).

- Run `makepkg --install --force` to check whether the installation works
successfully.

- Run `makepkg --printsrcinfo > .SRCINFO` to update [.SRCINFO](.SRCINFO).

- Commit and push.