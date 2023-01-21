# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=civo-bin
pkgver=1.0.45
pkgrel=1
pkgdesc="Civo CLI is a tool to manage your Civo.com account from the terminal"
arch=("x86_64")
url="https://github.com/civo/cli"
license=("Apache License 2.0")
provides=("civo")
conflicts=("civo" "civo-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/civo_amd64.deb")
sha256sums=('235cddda3a5087618334513bf4315511d2184c03ccc00346938723b3deef0115')

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  mv usr "$pkgdir"
}
