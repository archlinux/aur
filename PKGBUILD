# Maintainer: desbma
pkgname=r128gain
pkgver=0.9.3
pkgrel=2
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('ffmpeg' 'python' 'python-crcmod' 'python-mutagen' 'python-setuptools' 'python-tqdm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('dadfa97b3a1ccd73550732a7be58fc67123a302b6b4a0d458bcc8b1eb29ddea434f85d52f694d688606f4a2302d1fb25011243c5b09cc8e598f50bef9a6aaf41')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
