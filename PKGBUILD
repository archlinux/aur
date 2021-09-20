# Maintainer: Johannes Wienke <languitar@semipol.de>
# Contributor: bittin

pkgname=mopidy-mpd
pkgver=3.2.0
pkgrel=1
pkgdesc="Mopidy extension for controlling playback from MPD clients"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=('mopidy>=3.0'
         'python-pykka')
makedepends=('python3' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mopidy/mopidy-mpd/archive/v${pkgver}.tar.gz")
md5sums=('b376055cc7370dce61956aed98a9465e')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
