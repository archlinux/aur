# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=angularjs
pkgver=1.4.4
pkgrel=1
pkgdesc="An open-source JavaScript framework, whose goal is to augment browser-based applications with model–view–controller (MVC) capability, in an effort to make both development and testing easier."
arch=(any)
url="http://angularjs.org"
license=('MIT')
depends=('jquery')
source=("https://ajax.googleapis.com/ajax/libs/${pkgname}/${pkgver}/angular.js" "https://ajax.googleapis.com/ajax/libs/${pkgname}/${pkgver}/angular.min.js")
md5sums=('d4820f67157e827a405b3609bf12aab3' 'feeb76d0de3487eb412c1928625e8fca')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/angularjs"
  install -m644 "angular.js" "${pkgdir}/usr/share/angularjs"
  install -m644 "angular.min.js" "${pkgdir}/usr/share/angularjs"
}

# vim:set ts=2 sw=2 et:
