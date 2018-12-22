# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Yan Burdonsky <psyrccio@gmail.com>

pkgname=anoise-community-extension3
pkgver=0.0.1
pkgrel=4
pkgdesc="Ambient Noise Community Library Package 3"
arch=('any')
license=('GPL3')
url="https://code.launchpad.net/anoise"
depends=('anoise')
makedepends=('python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/~costales/+archive/ubuntu/anoise/+sourcefiles/${pkgname}/${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('d5fbabff750418e646b73648aa2e0b6b01128defe307737bae371827f03a18c1')

package() {
  cd "${srcdir}/media3"
  python ./setup.py install --prefix=/usr --root="${pkgdir}"
}
