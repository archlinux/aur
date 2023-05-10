# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=xfer9860
pkgver=0.2.2
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/sanjay900/xfer9860"
license=('GPL2')
depends=('libusb')
makedepends=('scons2')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('bc245995a6987fe4706144b4e95af6391d94d82e226ca2bf3d799b9ec733d7ac')

build() {
  cd "$pkgname-$pkgver"
  scons2
}

package() {
  cd "$pkgname-$pkgver"
  install -D "src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
