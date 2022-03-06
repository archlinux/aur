# Maintainer: desbma
pkgname=r128gain
pkgver=1.0.6
pkgrel=2
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('ffmpeg' 'python' 'python-crcmod' 'python-ffmpeg' 'python-future' 'python-mutagen' 'python-setuptools' 'python-tqdm')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('040a742b722180ba859db6ab597c2718cbbf6aeadadec5e7be16000a4fba8efc0f84edf6d362fdd67db05e7412da6a1ae913de229b0acb75d21f7136cc8b7669')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
