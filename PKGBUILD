# Maintainer: desbma
pkgname=r128gain
pkgver=0.7.1
pkgrel=1
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('python' 'python-setuptools' 'python-mutagen' 'python-crcmod' 'ffmpeg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('77d495450fb35715b0cbabcf03a1d05c1f86eb5487b615fe2e073ed9dff224d744b981a08cc584cee7f2edd346901f31b85ab359cab1e913a532bff5ccf15d3e')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
