#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=respond.js
pkgver=1.4.2
pkgrel=1
pkgdesc='A fast & lightweight polyfill for min/max-width CSS3 Media Queries (for IE 6-8, and more).'
arch=('any')
url='https://github.com/scottjehl/Respond'
license=('MIT')
source=("https://github.com/scottjehl/Respond/archive/$pkgver.tar.gz")
sha256sums=('6d242b265fc2dccb559e1e9814f9671f75c1520907d85647bab2a0a084f24137')

package() {
  cd $srcdir/Respond-$pkgver
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ./dest/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
  cp -a ./"LICENSE-MIT" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
