# Maintainer: Acidhub <contact@acidhub.click>

pkgname=steam-tools
_pkgname=steam-tools-ng
pkgver=0.9.3
pkgrel=1
pkgdesc="Some useful tools to use with steam client or compatible programs and websites."
arch=('any')
url="https://github.com/ShyPixie/steam-tools-ng"
depends=('python' 'python-aiodns' 'python-cchardet' 'python-ujson' 'python-aiohttp' 'python-beautifulsoup4' 'python-requests' 'python-crypto' 'python-certifi')
makedepends=('python-setuptools')
license=('GPL')
source=("https://github.com/ShyPixie/$_pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('e7e2a168ff4d1edf32e1a4001249aa11311c9d8d860ae4c2817338a10e4265ed')

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root=$pkgdir --prefix=/usr
}


