# Maintainer: desbma
pkgname=r128gain
pkgver=0.8.0
pkgrel=1
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('python' 'python-setuptools' 'python-mutagen' 'python-crcmod' 'ffmpeg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ef5f397a4a0924f9a6d7d0465e74ca82c93c62337790982af3a33f3627aad86e4d862fb6646d23b45f1e1ece7ae5715bbdc8c8c8f25c5186494e7c31126860a5')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
