# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Yan Burdonsky <psyrccio@gmail.com>

pkgname=anoise-community-extension2
pkgver=0.0.4
pkgrel=2
pkgdesc="Ambient Noise Community Library Package 2"
arch=('any')
license=('GPL3')
url="https://code.launchpad.net/anoise"
depends=('anoise')
makedepends=('python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/~costales/+archive/ubuntu/anoise/+sourcefiles/${pkgname}/${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('64fc8eecdd00aad0c8d42a8b6016490b49dde64b79232f2f795e69ba8c267f49')

package() {
  cd "${srcdir}/${pkgname/anoise-/}"
  python ./setup.py install --prefix=/usr --root="${pkgdir}"
}
