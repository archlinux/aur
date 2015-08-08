# Maintainer: grimi <grimi at poczta dot fm>↲
# Contributor: Daniel Fiser <danfis@danfis.cz>

pkgname=burn-cd
pkgver=1.8.0
pkgrel=3
pkgdesc="Burn-CD is a handy frontend for the well-known cd/dvd writing packages cdrkit &  dvd+rw-tools."
arch=(any)
url="http://burn-cd.sourceforge.net/"
license=('GPL')
depends=(cdrkit dvd+rw-tools python2)
source=(http://downloads.sourceforge.net/burn-cd/$pkgname-$pkgver.gz)
md5sums=('ae6156ee69401dd6bec3294dd3fb9dc9')


package() {
  sed 's|/usr/bin/python|/usr/bin/python2|' -i $pkgname-$pkgver
  install -Dm 755 $pkgname-$pkgver "$pkgdir"/usr/bin/$pkgname
}

