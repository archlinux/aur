# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=civo-bin
pkgver=1.0.48
pkgrel=1
pkgdesc="Civo CLI is a tool to manage your Civo.com account from the terminal"
arch=("x86_64")
url="https://github.com/civo/cli"
license=("Apache License 2.0")
provides=("civo")
conflicts=("civo" "civo-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/civo_amd64.deb")
sha256sums=('fed1b5c891626c3b5fb22dbe56c7cf4fc230cb0ae6dd391b369d2ab5638a9740')

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  mv usr "$pkgdir"
}
