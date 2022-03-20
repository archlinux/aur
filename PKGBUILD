# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=civo-bin
pkgver=1.0.25
pkgrel=1
pkgdesc="Civo CLI is a tool to manage your Civo.com account from the terminal"
arch=("x86_64")
url="https://github.com/civo/cli"
license=("Apache License 2.0")
provides=("civo")
conflicts=("civo" "civo-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/civo_amd64.deb")
sha256sums=('91292dc4bf9d5a4b7b3a4a6b97368fe6f9de4a57641bd14cac3e6b6af31b36e5')

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  mv usr "$pkgdir"
}
