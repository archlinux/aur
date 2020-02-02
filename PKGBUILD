# Maintainer: desbma
pkgname=r128gain
pkgver=1.0.1
pkgrel=1
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('ffmpeg' 'python' 'python-crcmod' 'python-ffmpeg' 'python-future' 'python-mutagen' 'python-setuptools' 'python-tqdm')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('feafb2529356f345fe86d033dbd49754b47c5835a4e7bc9e2a54e1e352af08d22091d3cf8684e55be3746a5711b9c47cb0e143feb30baaefc07c1bc8a3370328')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
