# Maintainer: Kazuki Przyborowski <kazukiprzyborowski[at]gmail[dot]com>
pkgname=python-pyupcean
pkgver=2.7.11
pkgrel=3
pkgdesc="PyUPC-EAN is a barcode library/module for python3."
arch=('any')
url="https://github.com/GameMaker2k/PyUPC-EAN/"
license=('BSD')
replaces=('python-upcean')
depends=('python' 'python-pillow')
options=(!strip !emptydirs)
_gitrevision='89387c87e84d678d4ae59760687d7d8d91bd6fb4'
source=("https://github.com/GameMaker2k/PyUPC-EAN/archive/${_gitrevision}.tar.gz")
md5sums=('5d976a63199e0c4442a833c949233bd6')
sha256sums=('14fc72f6f8fa7ddccb121f7d0a29b0043ee99a5e84759d406aee178d800d17cd')
sha384sums=('022afc7845d2c5916c287520c2391166e07ef2175e1f829464662feaac7ad35bba62c9fd264905a197f9b71e5cfdff09')
sha512sums=('8de80dd3bf5e37c3f373905369848300ab0ab52dc742dda4b3b97ff1a58b9aaa69524d4321bd842dc675625849dba659abdd77fa9d252c4adba89dbe38d3a905')

package() {
  cd "${srcdir}/PyUPC-EAN-${_gitrevision}"
  /usr/bin/python ./setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
