# Maintainer: grimi <grimi at poczta dot fm>↲
# Contributor: Daniel Fiser <danfis@danfis.cz>

pkgname=burn-cd
pkgver=1.8.1
pkgrel=1
pkgdesc="Smart console frontend for the cdrkit/cdrtools & dvd+rw-tools."
arch=(any)
url="http://burn-cd.sourceforge.net/"
license=('GPL')
depends=('cdrtools' 'dvd+rw-tools' 'python2')
#source=("http://downloads.sourceforge.net/burn-cd/$pkgname-$pkgver.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/aglyzov/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('8445937d904cf36e690764b1956e6736d4729cf639bc237a67df09d2f24218b2')


package() {
  cd $pkgname-$pkgver
  install -Dm 644 dotburn-cd.conf "$pkgdir"/etc/burn-cd.conf
  install -Dm 755 $pkgname-$pkgver "$pkgdir"/usr/bin/$pkgname
}

