# Maintainer: desbma
pkgname=r128gain
pkgver=0.6.0
pkgrel=1
pkgdesc="Fast audio loudness (ReplayGain / R128) scanner & tagger"
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('python' 'python-mutagen' 'ffmpeg')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ec5f7dd2b0c2b977935bfe96b1918fc851bda2dd15a559fd21588a533931cbae47c88c72d644705347bef0607aed02529bb4158f82b301d902bc25f357909d35')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
