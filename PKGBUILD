# Maintainer: K1412 <FD.K1412@openaliasbox.org>
pkgname=scriptaculous
pkgver=1.9.0
pkgrel=2
pkgdesc="script.aculo.us is a JavaScript library providing dynamic visual effects
and user interface elements via the Document Object Model."
arch=('any')
url="http://script.aculo.us/"
license=('MIT')

source=('http://script.aculo.us/dist/scriptaculous-js-1.9.0.zip')
md5sums=('c9d74b367df4abe91cb76695a55860c7')

package() {
  mkdir -p ${pkgdir}/usr/share/javascript/${pkgname}/
  cd ${pkgname}-js-${pkgver}/
  cp -a ./src/* ${pkgdir}/usr/share/javascript/${pkgname}/ 
}
