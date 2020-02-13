### How to deploy

- Set `pkgver` at [PKGBUILD](PKGBUILD#L3) to the value of `npm show now version`

- Make sure the sha256 sum is valid at [PKGBUILD](PKGBUILD#L12).
    ```sh
    curl -s https://registry.npmjs.org/now/-/now-"$(npm show now version)".tgz | sha256sum
    ```

- Run `rm -rf pkg/ src/ && makepkg --install --force` to check whether the installation works
successfully.

- Run `makepkg --printsrcinfo > .SRCINFO` to update [.SRCINFO](.SRCINFO).

- Commit and push.
