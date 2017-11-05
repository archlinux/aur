# Maintainer: desbma
pkgname=r128gain
pkgver=0.6.1
pkgrel=1
pkgdesc="Fast audio loudness (ReplayGain / R128) scanner & tagger"
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('python' 'python-mutagen' 'ffmpeg')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('541c1c2fbf30998360e8cdb01b9316a37f6243d2ca2d50cbea1edf78ac484aa50fb1bc2812aec9a82c019bad2be0495475a573a144b2a3f3682e219673ef9578')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
