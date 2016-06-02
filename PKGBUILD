# Maintainer: Kazuki Przyborowski <kazukiprzyborowski[at]gmail[dot]com>
pkgname=python2-pyupcean
pkgver=2.7.14
pkgrel=1
pkgdesc="PyUPC-EAN is a barcode library/module for python2."
arch=('any')
url="https://github.com/GameMaker2k/PyUPC-EAN/"
license=('BSD')
replaces=('python2-upcean')
depends=('python2' 'python2-pillow')
options=(!strip !emptydirs)
_gitrevision='7071ec3759de49c045e3cde1c720e3b0e5b19f21'
source=("https://github.com/GameMaker2k/PyUPC-EAN/archive/${_gitrevision}.tar.gz")
md5sums=('87bb25388e2c60df387c6d85fa2c8982')
sha224sums=('eb8dca48b8aacab6f17542a247ec3b8925433e38ae0c680e5f0753d0')
sha256sums=('5c23e9740ba623002cbbd650762e4ea6b2d20d4a6fa05842bfd05eb3a044a159')
sha384sums=('ca269af2a42e5ac2ce3d48fcea5cf8442cbd660a4506fbe728d47d1e1ffb564cf5139e80fb5cda041255b795bfb648ff')
sha512sums=('9138e314ccd5588b9327138d7ac5f770bb71567380f34b67fc601d3792ee9dc0d43617a994c8c0ee9c025141d70a8ede17ba99daa16016e8fcbf146e233862ee')

package() {
  cd "${srcdir}/PyUPC-EAN-${_gitrevision}"
  /usr/bin/python2 ./setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
