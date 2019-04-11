# Maintainer: desbma
pkgname=r128gain
pkgver=0.8.1
pkgrel=1
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('python' 'python-setuptools' 'python-mutagen' 'python-crcmod' 'ffmpeg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('8fb50e7e497b85cfadfc9bfee1296e4caae5c7dab05f84a32f7a44ce0828fa317a7d5eb7b7cfc667b2c15e3601af774fdee4a9e83c84b36c4bd5f8f629ffc429')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
