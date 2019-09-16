# Maintainer: "Jameson Pugh <imntreal@gmail.com>"

pkgname=node-spellchecker
_npmname=spellchecker
pkgver=3.7.0
pkgrel=1
pkgdesc="node.js bindings to native spellchecker"
arch=('any')
url='http://atom.github.io/node-spellchecker'
license=('MIT')
depends=('nodejs') 
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('7cba92d59735486a7edf79c0ed91f94374b405bd6e6a1f2ae6a041fd1350b083')

package() {
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" "${_npmname}-${pkgver}.tgz"
}

# vim:set ts=2 sw=2 et:
