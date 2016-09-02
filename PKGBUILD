# Maintainer: Kazuki Przyborowski <kazukiprzyborowski[at]gmail[dot]com>
pkgname=python2-pyupcean
pkgver=2.7.15
pkgrel=1
pkgdesc="PyUPC-EAN is a barcode library/module for python2."
arch=('any')
url="https://github.com/GameMaker2k/PyUPC-EAN/"
license=('BSD')
replaces=('python2-upcean' 'python2-pyupcean')
depends=('python2' 'python2-pillow')
options=(!strip !emptydirs)
_gitrevision='274ba3e403d7e2c565e073e79ab5953936f441ea'
source=("https://github.com/GameMaker2k/PyUPC-EAN/archive/${_gitrevision}.tar.gz")
md5sums=('e10d67ff6d755c3f003a64895463e01d')
sha224sums=('ea8303b2e0eeb624ce8b2bb6aae98d573dc04af9437febb346dd4ab9')
sha256sums=('1024ba166aad7b77f32de4711f521be6c51c7cc160b4e527e1765e2f0a4be9e4')
sha384sums=('1afc012ce2a645e8a9ecbe70a081f10e91d767f5e98d06207f2a20f69d781efb924fb605847b6d09b589a260fbc8f3ed')
sha512sums=('9ada1674264bc158be23f7d11d6e1541328e80793dc228fbd5e271bc1a832e1ce26f41316c0c203149859979618e8eac76221e8e467529a9d11665270d4d35e4')

package() {
  cd "${srcdir}/PyUPC-EAN-${_gitrevision}"
  /usr/bin/python2 ./setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
