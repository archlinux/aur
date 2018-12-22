# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Yan Burdonsky <psyrccio@gmail.com>

pkgname=anoise-community-extension1
pkgver=0.0.1
pkgrel=4
pkgdesc="Ambient Noise Community Library Package 1"
arch=('any')
license=('GPL3')
url="https://code.launchpad.net/anoise"
depends=('anoise')
makedepends=('python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/~costales/+archive/ubuntu/anoise/+sourcefiles/${pkgname}/${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('605aafb84a4669cc6d64dec2d93b3585dc260971bcc5db7d63478f8f8901c7b4')

package() {
  cd "${srcdir}/community"
  python ./setup.py install --prefix=/usr --root="${pkgdir}"
}
