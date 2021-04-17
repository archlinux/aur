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
sha256sums=("cb14148f6606c9dc490fe6d635ac8cf7c6d483f849ad9680f2cc5130a3b07bc8")

package() {
    install -Dm755 "patchup" "$pkgdir/usr/bin/patchup"    
}
