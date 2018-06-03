# Maintainer: desbma
pkgname=r128gain
pkgver=0.7.0
pkgrel=3
pkgdesc="Fast audio loudness (ReplayGain / R128) scanner & tagger"
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('python' 'python-setuptools' 'python-mutagen' 'python-crcmod' 'ffmpeg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('921d935c0baef0f3300b2e471659a875d7888dead3cbd9daa190ded17d771aef87101b23f442041459705c8fda81416ccb59e5fc0429e3b5d0a7fbe5339c41d6')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
