# Maintainer: "Jameson Pugh <imntreal@gmail.com>"

pkgname=node-spellchecker
_npmname=spellchecker
pkgver=3.5.2
pkgrel=1
pkgdesc="node.js bindings to native spellchecker"
arch=('any')
url='http://atom.github.io/node-spellchecker'
license=('MIT')
depends=('nodejs') 
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('81925bed54eb7cd8d0cee664bb2877277a2d22a2be6fbf6ba100f7951c7c0684')

package() {
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" "${_npmname}-${pkgver}.tgz"
}

# vim:set ts=2 sw=2 et:
