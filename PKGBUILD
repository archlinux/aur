# Maintainer: Fabio Zanini <fabio.zanini _at_ fastmail.fm>
_pypiname=CacheControl
pkgname=python-cachecontrol
pkgver=0.12.1
pkgrel=1
pkgdesc="httplib2 caching for requests"
arch=('any')
url="http://pypi.python.org/pypi/${_pypiname}"
license=('Apache')
depends=('python' 'python-lockfile')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/3a/f7/075de886ad249f4ca08615ebd8bec9ce995ed6852790b6d9df38ae059e43/${_pypiname}-$pkgver.tar.gz")
md5sums=('c6c5944d3a6f73bb752a4b4e2e1ffca5')

build() {
  cd "${srcdir}/${_pypiname}-$pkgver"
  python setup.py build
}

package() {
  cd ${_pypiname}-$pkgver
  python setup.py install --root="${pkgdir}"
}
# vim:set ts=2 sw=2 et:
