# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=mopidy-internetarchive
pkgver=2.0.3
pkgrel=1
pkgdesc="Mopidy extension for playing audio from the Internet Archive"

arch=('any')
url="https://github.com/tkem/mopidy-internetarchive"
license=('APACHE')
depends=('mopidy>=1.1' 'python2-pykka>=1.1' 'python2-requests>=2.0' 'python2-cachetools>=1.0' 'python2-uritools>=1.0')
makedepends=('python2' 'python2-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/tkem/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('3153d84e5c323744a0d4d84987b1d6b6')

package() {
    cd "${pkgname}-${pkgver}"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
