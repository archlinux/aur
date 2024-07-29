pkgname=sztk
pkgver=1.0.0
pkgrel=1
pkgdesc="Szczota Toolkit"
arch=('x86_64')
url="https://github.com/szczotapl/sztk"
license=('GPL-3.0')
depends=('python-colorama')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/szczotapl/sztk/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

pkgver() {
  echo "$pkgver"
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/src/sztk" "$pkgdir/usr/bin/sztk"
}
