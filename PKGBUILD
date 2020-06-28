# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: realitygaps <realitygaps AT yahoo DOT com>

pkgname=fengoffice
pkgver=3.5.1.5
pkgrel=1
pkgdesc="Feng Office is an integrated suite of software designed to help your organization run better."
arch=('i686' 'x86_64')
url="https://www.fengoffice.com/"
license=('GPL')
depends=('php')
install=${pkgname}.install
source=(https://downloads.sourceforge.net/opengoo/$pkgname/${pkgname}_${pkgver}/${pkgname}_$pkgver.zip)
sha512sums=('0877a575828c0f659252fb067cd23653b7bb4ba36317907cc3397c2396e8216fd9a5239d4c9d754d181815d5b37dd5bd3ea25c76f74217af89861d62c09be287')

package() {
  mkdir -p $pkgdir/usr/share/webapps/fengoffice
  cp -r $startdir/src/* $pkgdir/usr/share/webapps/$pkgname
}
