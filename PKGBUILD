# Maintainer: Hendrik R. <hendrikr_10 [at] yahoo [dot] de>

pkgname='otf-renner'
pkgver=2.1
pkgrel=1
pkgdesc="An original font created by indestructible type*. It is inspired by the designs of Paul Renner."
url="http://indestructible-type.github.io/Renner.html"
arch=(any)
license=(custom)
source=("Renner.zip::https://github.com/indestructible-type/Renner/releases/download/${pkgver}/Renner.zip")

sha256sums=('44109b60d5d27d174518b8e8f501a9ceaa353ea9a2d165ceb32e14302a3f952f')

package() {
  cd "${srcdir}"/'Renner*/Finished OpenType/'
  install -d "$pkgdir/usr/share/fonts/renner"
  install -t "$pkgdir/usr/share/fonts/renner" -m644 *.otf
  install -Dm644 ../LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
