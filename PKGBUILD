# Maintainer: Johannes Wienke <languitar@semipol.de>
# Previous Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-alsamixer
pkgver=1.1.1
pkgrel=1
pkgdesc="Mopidy extension for ALSA volume control"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=('mopidy>=0.19'
         'python2-pykka>=1.1'
         'python2-setuptools'
         'python2-pyalsaaudio')
makedepends=('python2')
source=("https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('fc7e327f6f206a18a05639726d57947f')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
