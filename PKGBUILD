# Maintainer: Dasith Gunawardhana <dasith@dg10a.com>

pkgname=routed-gothic-fonts
pkgver=1.0.0
_pkgver=v${pkgver}
pkgrel=1
pkgdesc="A clean vintage drafting, avionics, routed signage, and keyboard legend font."
url="https://webonastick.com/fonts/routed-gothic"
arch=(any)
license=(OFL-1.0)
_tarname=routed-gothic-$pkgver
source=("$_tarname.tar.gz::https://github.com/dse/routed-gothic/archive/$_pkgver.tar.gz")
sha256sums=('e0079b81fa068a4672f02585f7bc2910bf1535d8cd73b04d4a023bd2cbca361d')

package() {
  cd $_tarname
  install -d "$pkgdir/usr/share/fonts/${pkgname}"
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 dist/ttf/*.ttf
  install -Dm644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
