# Maintainer: desbma
pkgname=r128gain
pkgver=0.8.2
pkgrel=1
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('python' 'python-setuptools' 'python-mutagen' 'python-crcmod' 'ffmpeg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('138dfebed978bab4a9a173d4b98ef3318b88ef3f19be535a9aa759910a4ba285888da37236a6a4211dfc5c4de89e80f49da04da70c885596961a5adf966e037e')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
