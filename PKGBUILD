# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=angularjs-latest
pkgver=1.4.0
pkgsuffix=beta.6
pkgrel=1
pkgdesc="An open-source JavaScript framework, whose goal is to augment browser-based applications with model–view–controller (MVC) capability, in an effort to make both development and testing easier."
arch=(any)
url="http://angularjs.org"
license=('MIT')
depends=('jquery')
source=("https://ajax.googleapis.com/ajax/libs/angularjs/${pkgver}-${pkgsuffix}/angular.js" "https://ajax.googleapis.com/ajax/libs/angularjs/${pkgver}-${pkgsuffix}/angular.min.js")
md5sums=('b7cc700c5ffa0bfc1900df1314c209e3' 'f5ea98c23dc0213d70b70b023259d749')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/angularjs"
  install -m644 "angular.js" "${pkgdir}/usr/share/angularjs"
  install -m644 "angular.min.js" "${pkgdir}/usr/share/angularjs"
}

# vim:set ts=2 sw=2 et:
