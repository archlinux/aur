#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=font-awesome
pkgver=4.7.0
pkgrel=2
pkgdesc='The iconic font and CSS toolkit.'
arch=('any')
url='http://fontawesome.io/'
license=('OFL' 'MIT')
source=("https://github.com/FortAwesome/Font-Awesome/archive/v$pkgver.tar.gz")
sha256sums=('de512ba0e1dead382bbfce372cde74b3f18971d876fffb635ee9333f0db05d43')

package() {
  cd ${srcdir}/Font-Awesome-${pkgver}  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ./{css,fonts,less,scss} ${pkgdir}/usr/share/javascript/${pkgname}/
}
