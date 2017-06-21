# Maintainer: Joseph Brains <jnbrains@gmail.com>
_pkgname=zipstream
pkgname=python-${_pkgname}-gns3
pkgver=1.1.4
pkgrel=1
pkgdesc="Zipfile generator (GNS3)"
arch=('any')
url="https://pypi.python.org/pypi/${_pkgname}"
license=('GPL3')
groups=('gns3')
depends=('python')
makedepends=('python-setuptools')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
md5sums=('9d3755748c15eb622604e99dddac3652')

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
