# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=angularjs
pkgver=1.4.9
pkgrel=1
pkgdesc="An open-source JavaScript framework, whose goal is to augment browser-based applications with model–view–controller (MVC) capability, in an effort to make both development and testing easier."
arch=(any)
url="http://angularjs.org"
license=('MIT')
depends=('jquery')
source=("https://ajax.googleapis.com/ajax/libs/${pkgname}/${pkgver}/angular.js" "https://ajax.googleapis.com/ajax/libs/${pkgname}/${pkgver}/angular.min.js")
md5sums=('9e75fabc0b1b629ec2283975719c5494' '9324788c75670e5a821cd5d2355f0754')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/angularjs"
  install -m644 "angular.js" "${pkgdir}/usr/share/angularjs"
  install -m644 "angular.min.js" "${pkgdir}/usr/share/angularjs"
}

# vim:set ts=2 sw=2 et:
