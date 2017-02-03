# Maintainer: grimi <grimi at poczta dot fm>↲
# Contributor: Daniel Fiser <danfis@danfis.cz>

pkgname=burn-cd
pkgver=1.8.0
pkgrel=4
pkgdesc="Burn-CD is a handy frontend for the well-known cd/dvd writing packages cdrtools & dvd+rw-tools."
arch=(any)
url="http://burn-cd.sourceforge.net/"
license=('GPL')
depends=('cdrtools' 'dvd+rw-tools' 'python2')
source=("http://downloads.sourceforge.net/burn-cd/$pkgname-$pkgver.gz")
sha1sums=('5ff77716a1e8d1b3f48f93296dcf5467d6a80492')


package() {
  sed 's|/usr/bin/python|/usr/bin/python2|' -i $pkgname-$pkgver
  install -Dm 755 $pkgname-$pkgver "$pkgdir"/usr/bin/$pkgname
}

