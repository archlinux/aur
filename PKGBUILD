# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=python-alpaca-trade-api
pkgver=1.4.0
pkgrel=1
pkgdesc="Python client for Alpaca's trade API"
arch=('any')
url="https://github.com/alpacahq/alpaca-trade-api-python"
license=('Apache-2.0')
depends=('python' 'python-pandas' 'python-numpy' 'python-requests' 'python-urllib3' 'python-websocket-client' 'python-websockets' 'python-msgpack' 'python-aiohttp' 'python-pyaml')
options=(!emptydirs)
source=("https://github.com/alpacahq/alpaca-trade-api-python/archive/refs/tags/v.${pkgver}.tar.gz")
sha384sums=('b86ed07cb5fd0318047ce42288f8f41cae42517e70dbbc2c3237be3d74deb14da35a84135c8f2afc84ba957e21171b47')

package() {
    cd "$srcdir/alpaca-trade-api-python-v.${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
