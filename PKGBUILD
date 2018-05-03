# Maintainer: Simon Gate <simon@kampgate.se>
pkgname=mallet
pkgver=2.0.8
pkgrel=1
pkgdesc="MAchine Learning for LanguagE Toolkit"
arch=('x86_64')
url="http://mallet.cs.umass.edu/index.php"
license=('CPL1.0')
source=(http://mallet.cs.umass.edu/dist/mallet-${pkgver}.tar.gz)
sha512sums=('6390dfc3a9d9637397b85ce63c66324e9feade430d46129e2ca3bde3a0c14fdf04bdc33c2a0d3329c070d2c93b6326bec1bcdccf2621cf95097dc24f3558fcb3')

build() {
  cd "$pkgname-$pkgver"
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/bin/mallet" "$pkgdir/usr/bin/mallet"
}

