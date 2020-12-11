# Maintainer: Johannes Wienke <languitar@semipol.de>
# Contributor: bittin

pkgname=mopidy-mpd
pkgver=3.1.0
pkgrel=1
pkgdesc="Mopidy extension for controlling playback from MPD clients"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=('mopidy>=3.0'
         'python-setuptools'
         'python-pykka')
makedepends=('python3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mopidy/mopidy-mpd/archive/v${pkgver}.tar.gz")
md5sums=('2d2458108db4e99a320b0384e4e428c3')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
