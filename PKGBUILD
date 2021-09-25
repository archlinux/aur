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
sha256sums=("946ff094ac765a31a69fed314d5d78b650aa2d6ff84397e41c15a50ebaad6a59")

package() {
    install -Dm755 "target/release/patchup" "$pkgdir/usr/bin/patchup"    
}
