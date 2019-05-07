# lefthook

git hooks manager written in Go.

## Upgrading

 1. Change version and checksum in `PKGBUILD` according to git tag and source code archive checksum published in https://github.com/anycable/anycable-go/releases/

 2. Update `.SRCINFO` file:

    ```sh
    makepkg --printsrcinfo > .SRCINFO
    ```
 3. Build package

    ```sh
    makepkg
    ```

 4. Commit and push changes
