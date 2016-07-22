# Maintainer: Fabio Zanini <fabio.zanini _at_ fastmail.fm>
_pypiname=bz2file
pkgname=python-bz2file
pkgver=0.98
pkgrel=1
pkgdesc="Python library for reading and writing bzip2-compressed files"
arch=('any')
url="http://pypi.python.org/pypi/${_pypiname}"
license=('PSF')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pypiname:0:1}/${_pypiname}/${_pypiname}-$pkgver.tar.gz")
md5sums=('27d6f711ae0db6cfd1eb37f95621dfb5')

build() {
  cd "${srcdir}/${_pypiname}-$pkgver"
  python setup.py build
}

package() {
  cd ${_pypiname}-$pkgver
  python setup.py install --root="${pkgdir}"
}
# vim:set ts=2 sw=2 et:
