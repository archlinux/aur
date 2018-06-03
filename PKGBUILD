# Maintainer: desbma
pkgname=r128gain
pkgver=0.7.0
pkgrel=3
pkgdesc="Fast audio loudness (ReplayGain / R128) scanner & tagger"
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('python' 'python-setuptools' 'python-mutagen' 'python-crcmod' 'ffmpeg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c6900e42420d06ac60b9666f926fa0ebf5b0e7d6ddad78b578a16ae6dba5bdda8003b7ce67a645974794c726d41204b5e6ec35ae2ccd8066c8c07d4bc2a38e54')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
