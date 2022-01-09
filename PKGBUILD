# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=polymc-curseforge
pkgver=1.4.0
pkgrel=1
pkgdesc="Adds support for Curseforge's Install button to PolyMC"
arch=('i686' 'x86_64')
url="https://github.com/ShayBox/$pkgname"
license=('MIT')
source=($url/releases/download/$pkgver/linux.tar.gz)
sha512sums=('eba04cbd7cac709afbb1a5dacc912725a8c4b44860fdbffe2f76816d32f15356490e18618ccbaf840e02570750264cf074b11be770e3009a23ef78b2ce484cb6')
optdepends=('polymc')

package() {
  install -Dm755 usr/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 usr/share/applications/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
