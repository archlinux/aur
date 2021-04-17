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
source=("https://github.com/dezyh/patchup/releases/download/0.1.0/patchup-cli-bin.tar.gz")
sha256sums=("a79dc14273d2ce10d8e3257f45688fed5828cfd30deea0143f170838676cd8a9")

package() {
    install -Dm755 "target/release/patchup" "$pkgdir/usr/bin/patchup"    
}
