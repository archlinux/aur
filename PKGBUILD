# Maintainer: desbma
pkgname=r128gain
pkgver=1.0.0
pkgrel=1
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('ffmpeg' 'python' 'python-crcmod' 'python-ffmpeg' 'python-mutagen' 'python-setuptools' 'python-tqdm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('0dc44677a9360de1ea414b96e47e79e95f6f284a9cd2fadcbd1938e7ec0b32abda7df1f0d049faed5fee54796c90df736b8c422a2529d61502979594f3dd137c')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
