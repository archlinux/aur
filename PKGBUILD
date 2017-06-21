# Maintainer: Joseph Brains <jnbrains@gmail.com>
_pkgname=aiohttp-cors
pkgname=python-${_pkgname}-gns3
pkgver=0.5.1
pkgrel=1
pkgdesc="CORS support for aiohttp (GNS3)"
arch=("any")
url="https://pypi.python.org/pypi/${_pkgname}"
license=('Apache')
groups=('gns3')
depends=('python' 'python-aiohttp-gns3')
makedepends=('python-setuptools')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
md5sums=('0ea7e6a2401b140009e58b791dfbbaca')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
