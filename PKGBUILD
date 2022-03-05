# Maintainer: desbma
pkgname=r128gain
pkgver=1.0.5
pkgrel=2
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('ffmpeg' 'python' 'python-crcmod' 'python-ffmpeg' 'python-future' 'python-mutagen' 'python-setuptools' 'python-tqdm')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('b6bf75810f9d17d2d2323a6ba4c78c0882e2a5c98a2af0bee39fe24f888969f1bcb4ec94dda6027a24fadfaa01cc59adf560f19a863ab0ad64f6545a33b80f65')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
