### How to update user script

Go to https://userstyles.org/styles/142096 and click
on `Install style as userscript` link to download the new file.

Copy the contents of the file (except the last line: `})();`) you've just
downloaded to
[whatsapp-nativefier-dark-inject.js](./whatsapp-nativefier-dark-inject.js)
from the begin of the file until you see the line with comment
`// End UserScript`.

### How to deploy

- Make sure the sha256 sums are valid at [PKGBUILD](PKGBUILD#L17).
    ```sh
    sha256sum whatsapp-nativefier-dark.png
    sha256sum whatsapp-nativefier-dark.desktop
    sha256sum whatsapp-nativefier-dark-inject.js
    sha256sum package.json
    sha256sum yarn.lock
    ```

- Bump `pkgver` and `pkgrel` at [PKGBUILD](PKGBUILD#L4) accordingly
(see https://wiki.archlinux.org/index.php/PKGBUILD#Version).

- Run `rm -rf pkg/ src/ && makepkg --install --force` to check whether the installation works
successfully.

- Run `makepkg --printsrcinfo > .SRCINFO` to update [.SRCINFO](.SRCINFO).

- Commit and push.