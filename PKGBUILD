# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=civo-bin
pkgver=1.0.68
pkgrel=1
pkgdesc="Civo CLI is a tool to manage your Civo.com account from the terminal"
arch=("x86_64")
url="https://github.com/civo/cli"
license=("Apache License 2.0")
provides=("civo")
conflicts=("civo" "civo-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/civo_amd64.deb")
sha256sums=('587a15a8ed89d158a2edf773103724d247e46ebc60c7a4f458f2a68fb696c442')

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  mv usr "$pkgdir"
}
