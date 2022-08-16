# Maintainer: June Ortiz <juneortiz@proton.me>
# Contributor:
pkgname=angularjs
pkgver=1.8.2
pkgrel=1
pkgdesc="An open-source JavaScript framework, whose goal is to augment browser-based applications with model–view–controller (MVC) capability, in an effort to make both development and testing easier."
arch=(any)
url="http://angularjs.org"
license=('MIT')
depends=('jquery')
source=("https://ajax.googleapis.com/ajax/libs/${pkgname}/${pkgver}/angular.js" "https://ajax.googleapis.com/ajax/libs/${pkgname}/${pkgver}/angular.min.js")
md5sums=('cfc66b5f5b12440249cb05a412a2041f' 'a8b55518d979465737523088a9007e74')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/javascript/${pkgname}"
  install -m644 "angular.js" "${pkgdir}/usr/share/javascript/${pkgname}"
  install -m644 "angular.min.js" "${pkgdir}/usr/share/javascript/${pkgname}"
}

