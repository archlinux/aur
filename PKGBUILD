# Maintainer: desbma
pkgname=r128gain
pkgver=1.0.2
pkgrel=1
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('ffmpeg' 'python' 'python-crcmod' 'python-ffmpeg' 'python-future' 'python-mutagen' 'python-setuptools' 'python-tqdm')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('9fbbe7feedfcc66b89ff6eda3100d6402f7b64585acda38645e5a8cfd84bcccf213d3e2d0d753d9dbaeea187fb28ac7999c8aa28b48f7e41fa694b7752995de2')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
