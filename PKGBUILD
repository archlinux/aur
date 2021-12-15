# Maintainer: desbma
pkgname=r128gain
pkgver=1.0.4
pkgrel=2
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('ffmpeg' 'python' 'python-crcmod' 'python-ffmpeg' 'python-future' 'python-mutagen' 'python-setuptools' 'python-tqdm')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('a8321a1f6c1c6894a185ea813c41f0a18862f402685780611cb4df50fbfdf9645afa870ea4c9c27a5131fa86f0cf404581d31df36fc74617c9c057e5c6c9ec7e')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
