# Maintainer:  twa022 <twa022 at gmail dot com>

pkgname=anoise-community-extension5
pkgver=0.0.1
pkgrel=1
pkgdesc="Ambient Noise Community Library Package 5"
arch=('any')
license=('GPL3')
url="https://code.launchpad.net/anoise"
depends=('anoise')
makedepends=('python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/~costales/+archive/ubuntu/anoise/+sourcefiles/${pkgname}/${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('3d47b51b7ad05913bfe20e016e698396d7964d957cedcc48482639441b98974b')

package() {
  cd "${srcdir}/${pkgname/anoise-/}"
  python ./setup.py install --prefix=/usr --root="${pkgdir}"
}
