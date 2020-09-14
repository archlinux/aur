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

## Testing build in Docker

In case if you don't have ArchLinux machine available at moment.

 1. Build docker image

    ```sh
    docker build -t aur-builder .
    ```

 2. Run shell in container:

    ```sh
    docker run --rm -it -v $(pwd):/home/aur -u $(id -u) aur-builder sh
    ```

 3. Run `makepkg` in it as usual:

     ```sh
    makepkg --printsrcinfo > .SRCINFO
    makepkg --syncdeps
    ```
