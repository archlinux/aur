# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=mopidy-internetarchive
pkgver=3.0.0
pkgrel=4
pkgdesc="Mopidy extension for playing audio from the Internet Archive"

arch=('any')
url="https://github.com/tkem/mopidy-internetarchive"
license=('APACHE')
depends=('mopidy>=3.0' 'python-pykka' 'python-requests' 'python-cachetools' 'python-uritools')
makedepends=('python' 'python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/tkem/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('381704f63e6fe3d3f4faee8240ac5bf44ad3a35a2b4f4d4d02a5a7e2ab5bb348')

package() {
    cd "${pkgname}-${pkgver}"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
