# Maintainer:  twa022 <twa022 at gmail dot com>

pkgname=anoise-community-extension4
pkgver=0.0.1
pkgrel=1
pkgdesc="Ambient Noise Community Library Package 4"
arch=('any')
license=('GPL3')
url="https://code.launchpad.net/anoise"
depends=('anoise')
makedepends=('python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/~costales/+archive/ubuntu/anoise/+sourcefiles/${pkgname}/${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('4705dfba1ebe16aee5a8f72f0841585069e0dd2fbb12f589c6231c2be655cece')

package() {
  cd "${srcdir}/${pkgname/anoise-/}"
  python ./setup.py install --prefix=/usr --root="${pkgdir}"
}
