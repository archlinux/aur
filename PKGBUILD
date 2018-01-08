# Maintainer: Jan Tschopp <tschopp_jan at gmx dot net>

pkgname=otf-adobe-notdef
pkgver=1.000
pkgrel=1
pkgdesc="Font used to display any undefined unicode code points"
url="https://github.com/adobe-fonts/adobe-notdef"
arch=('any')
license=('custom')
_tarname=adobe-notdef-$pkgver
source=("$_tarname.tar.gz::https://github.com/adobe-fonts/adobe-notdef/archive/$pkgver.tar.gz")
sha256sums=('53aee7ec6a3301e9c9dffc95194ac4dc16fe9660a085b9436e9f3392d8d7da4b')

package() {
  cd $_tarname
  install -d "$pkgdir/usr/share/fonts/${pkgname#otf-}"
  install -t "$pkgdir/usr/share/fonts/${pkgname#otf-}" -m644 AND-Regular.otf
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
