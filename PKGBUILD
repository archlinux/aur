# Maintainer: desbma
pkgname=r128gain
pkgver=0.9.2
pkgrel=1
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('python' 'python-setuptools' 'python-mutagen' 'python-crcmod' 'ffmpeg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('2b03935b4a0bcc33269448c0dbbdd00fb6a8196f633cf1bd7f95eea6d226704ea9580bab4801fa36cc2ce0a29349bec2a39f2208adbca30c3a25016dedd02309')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
