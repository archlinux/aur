# Maintainer: "Jameson Pugh <imntreal@gmail.com>"

pkgname=node-spellchecker
_npmname=spellchecker
pkgver=3.7.1
pkgrel=1
pkgdesc="node.js bindings to native spellchecker"
arch=('any')
url='http://atom.github.io/node-spellchecker'
license=('MIT')
depends=('nodejs') 
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('14db1e7d75c5500eac97e3ad63a2dfeb5ff30084e6b061f27b262ff24a3372d8')

package() {
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" "${_npmname}-${pkgver}.tgz"
}

# vim:set ts=2 sw=2 et:
