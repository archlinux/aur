# Maintainer: desbma
pkgname=r128gain
pkgver=0.8.3
pkgrel=1
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('python' 'python-setuptools' 'python-mutagen' 'python-crcmod' 'ffmpeg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('b7074f21cdbae22a98495ce8bc7a1b8610c6bcc74d9b3a8320c51200e6544746249da875429785434c869124b11e5f2db14cd0d91d3192f2c24014a3765734a6')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
