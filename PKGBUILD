# Maintainer: Julian Hauser <julian at julianhauser.com>

pkgname=otf-clarity-city
_pkgname=clarity-city
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern, geometric sans-serif font. Successor to Metropolis."
arch=('any')
url="https://github.com/vmware/clarity-city"
license=('Open Font License')
source=("${url}/archive/v${pkgver}.zip")
md5sums=('feae40145f3a9c16e8058a8fbb90be66')

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/$_pkgname" OpenType/*.otf
}
