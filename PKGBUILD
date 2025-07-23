# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=backbonejs
_script=backbone
pkgver=1.6.0
pkgrel=1
pkgdesc="Backbone is a JavaScript library with a RESTful JSON interface, and is based on the model-view-presenter (MVP) application design paradigm."
arch=(any)
url=https://backbonejs.org
license=('MIT')
depends=()
source=("$url/$_script.js" "$url/$_script-min.js")
md5sums=('ddc851aaace75f11a91f1db004b0299f' 
  'd7041bc26b0268d6e8de5324e28be45f')

package() {
  cd "${srcdir}"
  install -Dm644 "${_script}-min.js" "${pkgdir}/usr/share/${pkgname}/${_script}-min.js"
  install -Dm644 "${_script}.js" "${pkgdir}/usr/share/${pkgname}/${_script}.js"
}

# vim:set ts=2 sw=2 et:
