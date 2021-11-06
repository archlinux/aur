# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=python-polygon-api-client
pkgver=0.2.11
pkgrel=1
pkgdesc=" A python client library for accessing Polygon's APIs "
arch=('any')
url="https://github.com/polygon-io/client-python"
license=('MIT')
depends=('python' 'python-atomicwrites' 'python-attrs' 'python-certifi' 'python-chardet' 'python-idna' 'python-importlib-metadata' 'python-more-itertools' 'python-packaging' 'python-pluggy' 'python-py' 'python-pyparsing' 'python-pytest' 'python-requests' 'python-six' 'python-urllib3' 'python-wcwidth' 'python-websocket-client' 'python-websockets' 'python-zipp')
options=(!emptydirs)
source=("https://github.com/polygon-io/client-python/archive/refs/tags/v${pkgver}.tar.gz")
sha384sums=('db59f017df99ec27a03e044c9a6de94bf07608324ab5eecbb01758b580dc0c417e642a1ab328129615c1e0d646b6c132')

package() {
    cd "$srcdir/client-python-${pkgver}"
    export VERSION=${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1
}
