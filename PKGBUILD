# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=mopidy-mpd
pkgver=3.0.0
pkgrel=1
pkgdesc="Mopidy extension for controlling playback from MPD clients"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=('mopidy>=3.0'
         'python-setuptools'
         'python-pykka')
makedepends=('python3')
source=("https://github.com/mopidy/mopidy-mpd/archive/v${pkgver}.tar.gz")
md5sums=('596b16cfd33bb9a576e784f275ccafbc')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
