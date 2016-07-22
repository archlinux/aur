# Maintainer: Fabio Zanini <fabio.zanini _at_ fastmail.fm>
_pypiname=CacheControl
pkgname=python-cachecontrol
pkgver=0.11.6
pkgrel=1
pkgdesc="Python library for reading and writing bzip2-compressed files"
arch=('any')
url="http://pypi.python.org/pypi/${_pypiname}"
license=('Apache')
depends=('python' 'python-lockfile')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pypiname:0:1}/${_pypiname}/${_pypiname}-$pkgver.tar.gz")
md5sums=('d3bd8200f56102f93749eee4296aef84')

build() {
  cd "${srcdir}/${_pypiname}-$pkgver"
  python setup.py build
}

package() {
  cd ${_pypiname}-$pkgver
  python setup.py install --root="${pkgdir}"
}
# vim:set ts=2 sw=2 et:
