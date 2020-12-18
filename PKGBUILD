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
md5sums=('f934c04425a0825b221acb96cdfdaeb2')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
