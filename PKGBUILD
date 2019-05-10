# Maintainer: desbma
pkgname=r128gain
pkgver=0.9.0
pkgrel=1
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('python' 'python-setuptools' 'python-mutagen' 'python-crcmod' 'ffmpeg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('1cdd8543ca01a3d66eee9da3f2446f9a7cfd32bdc29af4b77b37894e4115cf648a1790a20502e14415684414b0cd0266f001d3796f1cee0e369b25e176b6d7ad')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
