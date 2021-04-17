# Maintainer: Ben Mitchell <dezyh@outlook.com>
pkgname=patchup-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool to compute and apply binary patches for files and directories"
url="https://github.com/dezyh/patchup"
license=("MIT")
arch=("x86_64")
makedepends=("cargo")
provides=("patchup")
conflicts=("patchup")
source=("patchup-0.1.0::https://github.com/dezyh/patchup/releases/download/0.1.0/patchup-cli-bin.tar.gz")
sha256sums=("34880cc6ed038b52a30992d5878a025cbd4434047ac06ab6b4b5d3eae48235c5")

package() {
    cd "patchup-0.1.0"
    install -Dm755 "patchup" "$pkgdir/usr/bin/patchup"    
}
