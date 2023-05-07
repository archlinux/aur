# Maintainer: Johannes Wienke <languitar@semipol.de>
# Contributor: bittin

pkgname=mopidy-mpd
pkgver=3.3.0
pkgrel=2
pkgdesc="Mopidy extension for controlling playback from MPD clients"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=('mopidy>=3.0'
         'python-pykka')
makedepends=('python3' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mopidy/mopidy-mpd/archive/v${pkgver}.tar.gz")
sha256sums=('69ac13e79d3f77452e49722fe3322e6e60cb39fe24556153a7b3a119a5b3a893')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
