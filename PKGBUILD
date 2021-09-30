# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=civo-bin
pkgver=0.7.33
pkgrel=1
pkgdesc="Civo CLI is a tool to manage your Civo.com account from the terminal"
arch=("x86_64")
url="https://github.com/civo/cli"
license=("Apache License 2.0")
provides=("civo")
conflicts=("civo" "civo-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/civo_amd64.deb")
sha256sums=("318b7b205e91a28752a77bd0b3246480c91aa50e9835cab69f02d5acbbbef779")

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  mv usr "$pkgdir"
}
