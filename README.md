# imgproxy

Fast and secure standalone server for resizing and converting remote images

## Upgrading

 1. Change version and checksum in `PKGBUILD` according to git tag and source code archive checksum published in https://github.com/imgproxy/imgproxy/releases

 2. Update `.SRCINFO` file:

    ```sh
    makepkg --printsrcinfo > .SRCINFO
    ```
 3. Build package

    ```sh
    makepkg
    ```

 4. Commit and push changes
