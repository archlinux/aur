# Maintainer: Joseph Brains <jnbrains@gmail.com>
_pkgname=aiohttp
pkgname=python-${_pkgname}-gns3
pkgver=1.3.5
pkgrel=1
pkgdesc='http client/server for asyncio (GNS3)'
arch=('any')
url="https://aiohttp.readthedocs.io/"
license=('Apache')
groups=('gns3')
depends=('python' 'python-yarl-gns3' 'python-chardet' 'python-multidict>=2.0' 'python-async-timeout>=1.1.0')
makedepends=('python-setuptools')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
md5sums=("fac473aa71b5e49a6978b5bcc393a7ef")

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
