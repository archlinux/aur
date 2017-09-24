# Maintainer: desbma
pkgname=r128gain
pkgver=0.5.1
pkgrel=1
pkgdesc="Fast audio loudness (ReplayGain / R128) scanner & tagger"
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('python' 'python-mutagen' 'ffmpeg')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('601358730ef1cbd3fd6c62e677c846d66bf72e93d2b624abf872101f318d7876b2a1727695b4eb9b3f4bd879b008d99ef8d12c1af4461bc9a1ffaf3a1b74ca5e')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
