# Maintainer: Joseph Brains <jnbrains@gmail.com>
_pkgname=typing
pkgname=python-${_pkgname}-gns3
pkgver=3.6.1
pkgrel=1
pkgdesc='Type Hints for Python (GNS3)'
arch=('any')
url="https://pypi.python.org/pypi/${_pkgname}"
license=('PSF')
groups=('gns3')
depends=('python')
makedepends=('python-setuptools')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
md5sums=('3fec97415bae6f742fb3c3013dedeb89')

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
