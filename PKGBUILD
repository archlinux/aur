# Maintainer: Nitin Mathew <nitn_mathew2000@hotmail.com>

pkgname=springy
pkgver=2.7.1
pkgrel=1
pkgdesc='A force directed graph layout algorithm in JavaScript.'
arch=('any')
url='http://getspringy.com/'
license=('MIT')
source=("https://github.com/dhotson/springy/archive/${pkgver}.tar.gz")
sha256sums=('261ff4407f45c2fc5729889eedd4e71ea27019bbf63935001c08ee23e32e9cb1')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -d ${pkgdir}/usr/share/doc/${pkgname}
  install -d ${pkgdir}/usr/share/${pkgname}/demos
  cp -a ${srcdir}/${pkgname}-${pkgver}/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
  cp -a ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cp -a ${srcdir}/${pkgname}-${pkgver}/README.mkdn ${pkgdir}/usr/share/doc/${pkgname}/
  cp -a ${srcdir}/${pkgname}-${pkgver}/*.html ${pkgdir}/usr/share/${pkgname}/demos/
  cp -a ${srcdir}/${pkgname}-${pkgver}/*.json ${pkgdir}/usr/share/${pkgname}/demos/
}
