# ttf-martian-grotesk-variable

Variable version of the [Martian Grotesk] font with all weights and widths in one file.

## Upgrading

 1. Change version and checksum in `PKGBUILD` according to git tag and ` martian-grotesk-x-x-x-variable.zip` asset archive checksum published in https://github.com/evilmartians/grotesk/releases/

 2. Update `.SRCINFO` file:

    ```sh
    makepkg --printsrcinfo > .SRCINFO
    ```
 3. Build package

    ```sh
    makepkg --syncdeps --force --clean --cleanbuild
    ```

 4. Commit and push changes

[Martian Grotesk]: https://github.com/evilmartians/grotesk "Free and open-source sans-serif typeface family with a distinctive personality from Evil Martians"
