# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=python2-tkreadonly
_pkgname=tkreadonly
pkgver=0.6.0
pkgrel=1
pkgdesc="A set of Tkinter widgets to display readonly text and code."
url="http://github.org/pybee/tkreadonly"
arch=('any')
license=('BSD')
depends=('python2')
source=("https://pypi.python.org/packages/source/t/tkreadonly/tkreadonly-0.6.0.tar.gz#md5=bb74326471acdbbbc8641d37b6344d5b")
sha256sums=('4a98c0c884042f834051246e71c9ddeca3789cda548a9b83ce1bc4106d128857')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 ./setup.py install --prefix=/usr --root="${pkgdir}" -O1
}

# vim:set ts=2 sw=2 et:
