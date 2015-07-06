# Maintainer: realitygaps <realitygaps AT yahoo DOT com>

pkgname=fengoffice
pkgver=2.6.3
pkgrel=1
pkgdesc="OpenGoo is an easy to use Open Source Web Office"
arch=('i686' 'x86_64')
url="http://www.fengoffice.com/"
license=('GPL')
depends=('php')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/opengoo/$pkgname/${pkgname}_${pkgver}/${pkgname}_$pkgver.zip)
md5sums=('bb849c2d79a94c5abae259eb5b30bf55')


build() {
  mkdir -p $startdir/pkg/${pkgname}/usr/share/webapps/fengoffice
  cp -r $startdir/src/* $startdir/pkg/${pkgname}/usr/share/webapps/$pkgname
}
