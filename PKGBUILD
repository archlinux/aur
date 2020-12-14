# Maintainer: Johannes Wienke <languitar@semipol.de>
# Previous Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>
# Contributor: bittin

pkgname=mopidy-alsamixer
pkgver=2.0.1
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2dcf0e2ab5ea9d91d7bf03ffb6da7a136353f4385913d5f500fdb8f05ec46fff')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
