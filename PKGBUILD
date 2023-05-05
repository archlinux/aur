# Maintainer: desbma
pkgname=r128gain
pkgver=1.0.7
pkgrel=2
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('ffmpeg' 'python' 'python-crcmod' 'python-ffmpeg' 'python-future' 'python-mutagen' 'python-tqdm')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('da11c4a96126b1831acb1d48b2ec819368a6965dbbd0489c38a9fc8cf8e0effc68ef3c8c5fc3aa714476d50077770523d719592347f89e59775eb29ce8f84103')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
