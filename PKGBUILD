#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=html5shiv
pkgver=3.7.3
pkgrel=1
pkgdesc='A JavaScript polyfill to enable styling of HTML5 elements in versions of Internet Explorer prior to version 9.'
arch=('any')
url='https://github.com/aFarkas/html5shiv'
license=('MIT' 'GPL2')
source=("https://github.com/aFarkas/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('0f1efebf625a5e4ba0d0f8b22e8007af7f22e871ff294c8988be7d7cfb5dd446')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ./dist/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
  cp -a ./"MIT and GPL2 licenses.md" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
