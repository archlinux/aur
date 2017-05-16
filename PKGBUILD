# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=angularjs
pkgver=1.6.4
pkgrel=1
pkgdesc="An open-source JavaScript framework, whose goal is to augment browser-based applications with model–view–controller (MVC) capability, in an effort to make both development and testing easier."
arch=(any)
url="http://angularjs.org"
license=('MIT')
depends=('jquery')
source=("https://ajax.googleapis.com/ajax/libs/${pkgname}/${pkgver}/angular.js" "https://ajax.googleapis.com/ajax/libs/${pkgname}/${pkgver}/angular.min.js")
md5sums=('9178813723c9000e94ada81fb96bf544' 'be6af23e2a716c006da75d0291784254')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/angularjs"
  install -m644 "angular.js" "${pkgdir}/usr/share/angularjs"
  install -m644 "angular.min.js" "${pkgdir}/usr/share/angularjs"
}

# vim:set ts=2 sw=2 et:
