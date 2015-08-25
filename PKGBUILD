# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=backbonejs
_script=backbone
pkgver=1.2.2
pkgrel=1
pkgdesc="Backbone is a JavaScript library with a RESTful JSON interface, and is based on the model-view-presenter (MVP) application design paradigm."
arch=(any)
url=http://backbonejs.org
license=('MIT')
depends=()
source=("$url/$_script.js" "$url/$_script-min.js")
md5sums=('b0b19c4bd3a666315705c4620c2b469c'
  'f633f1a2a8ebc39a3ffffbf9e6418bcb')

package() {
  cd "${srcdir}"
  install -Dm644 "${_script}-min.js" "${pkgdir}/usr/share/${pkgname}/${_script}-min.js"
  install -Dm644 "${_script}.js" "${pkgdir}/usr/share/${pkgname}/${_script}.js"
}

# vim:set ts=2 sw=2 et:
