# ttf-martian-mono-variable

Variable version of the [Martian Mono] font with all weights and widths in one file.

## Upgrading

 1. Change version and checksum in `PKGBUILD` according to git tag and ` martian-mono-x-x-x-variable.zip` asset archive checksum published in https://github.com/evilmartians/mono/releases/

 2. Update `.SRCINFO` file:

    ```sh
    makepkg --printsrcinfo > .SRCINFO
    ```
 3. Build package

    ```sh
    makepkg --syncdeps --force --clean --cleanbuild
    ```

 4. Commit and push changes

[Martian Mono]: https://github.com/evilmartians/mono "Free and open-source monospaced font from Evil Martians"