#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=paper.js
pkgver=0.10.2
pkgrel=1
pkgdesc='A JavaScript vector graphics framework that runs on top of the HTML5 Canvas.'
arch=('any')
url='http://paperjs.org/'
license=('MIT')
source=("http://paperjs.org/download/paperjs-v$pkgver.zip")
sha256sums=('d5e10315912126bc558452396f605c984b214bbd66380d02be48c8d35cbd3701')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/doc/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ./dist/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
  cp -a ./{docs,examples} ${pkgdir}/usr/share/doc/${pkgname}/
  cp -a ./LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
