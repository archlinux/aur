# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=mopidy-internetarchive
pkgver=3.0.1
pkgrel=2
pkgdesc="Mopidy extension for playing audio from the Internet Archive"

arch=('any')
url="https://github.com/tkem/mopidy-internetarchive"
license=('APACHE')
depends=('mopidy>=3.0' 'python-pykka' 'python-requests' 'python-cachetools' 'python-uritools')
makedepends=('python' 'python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/tkem/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bf3266bb3b13863e97122c7485d275da05dbfdcf5abbe79a37c23d8f6f987a9d')

package() {
    cd "${pkgname}-${pkgver}"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
