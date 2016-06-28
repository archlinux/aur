# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=backbonejs
_script=backbone
pkgver=1.3.3
pkgrel=1
pkgdesc="Backbone is a JavaScript library with a RESTful JSON interface, and is based on the model-view-presenter (MVP) application design paradigm."
arch=(any)
url=http://backbonejs.org
license=('MIT')
depends=()
source=("$url/$_script.js" "$url/$_script-min.js")
md5sums=('8a8d829617513f36185a0ab055d088ec' 
  '1f542a03bb9e6203b95cc9d0c39e0af7')

package() {
  cd "${srcdir}"
  install -Dm644 "${_script}-min.js" "${pkgdir}/usr/share/${pkgname}/${_script}-min.js"
  install -Dm644 "${_script}.js" "${pkgdir}/usr/share/${pkgname}/${_script}.js"
}

# vim:set ts=2 sw=2 et:
