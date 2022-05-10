# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=python-alpaca-trade-api
pkgver=2.1.0
pkgrel=1
pkgdesc="Python client for Alpaca's trade API"
arch=('any')
url="https://github.com/alpacahq/alpaca-trade-api-python"
license=('Apache-2.0')
depends=('python' 'python-pandas' 'python-numpy' 'python-requests' 'python-urllib3' 'python-websocket-client' 'python-websockets' 'python-msgpack' 'python-aiohttp' 'python-pyaml')
options=(!emptydirs)
source=("https://github.com/alpacahq/alpaca-trade-api-python/archive/refs/tags/v${pkgver}.tar.gz")
sha384sums=('ee2a824d7ee39d2b4bdadc027987bb170577e61a29692ab5155ee378479975f491669895ff5473d9fc02a82c80839529')

package() {
    cd "$srcdir/alpaca-trade-api-python-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
