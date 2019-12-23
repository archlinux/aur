# Maintainer: Johannes Wienke <languitar@semipol.de>
# Previous Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-alsamixer
pkgver=2.0.0
pkgrel=1
pkgdesc="Mopidy extension for ALSA volume control"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=('mopidy>=3.0'
         'python-setuptools'
         'python-pyalsaaudio'
         'python-pykka')
makedepends=('python3')
source=("https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('f796c8e45fc918c57557346614ed22cd')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
