# Maintainer: Ben Mitchell <dezyh@outlook.com>
pkgname=patchup-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool to compute and apply binary patches for files and directories"
url="https://github.com/patchup/cli"
license=("MIT")
arch=("x86_64")
makedepends=("cargo")
provides=("patchup")
conflicts=("patchup")
source=("https://github.com/patchup/cli/releases/download/0.1.0/patchup-cli-bin.tar.gz")
sha256sums=("4de9a88c54d0fadb5a1c7d6fcfefc7dc980ea4dd58484b5a8b96c10e61bc6ae2")

package() {
    install -Dm755 "target/release/patchup" "$pkgdir/usr/bin/patchup"    
}
