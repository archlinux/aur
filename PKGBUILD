# Maintainer: desbma
pkgname=r128gain
pkgver=0.5.0
pkgrel=1
pkgdesc="Fast audio loudness (ReplayGain / R128) scanner & tagger"
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('python' 'python-mutagen' 'ffmpeg')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('9c8f6ea74816c8c9a6a587393cd1b876b5bd6d3e0ef69e566d9ac696bdba6bab339fa07f99122d9c44676531bfcc3bba91aa97a92eafba2bfe616174cfaa4999')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
