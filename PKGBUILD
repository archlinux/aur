# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Yan Burdonsky <psyrccio@gmail.com>
pkgname=anoise-gui
pkgver=0.0.4
pkgrel=4
pkgdesc="GUI for Ambient Noise Player"
arch=('any')
license=('GPL3')
url="https://code.launchpad.net/anoise"
depends=('anoise' 'python' 'gtk3')
makedepends=('python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/~costales/+archive/ubuntu/anoise/+sourcefiles/${pkgname}/${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('b97553fe661c55d3563dc8031834b51a36387ca3eb856eb78c046e4d8efc868b')

package() {
  cd "${srcdir}/${pkgname}"
  python ./setup.py install --prefix=/usr --root="${pkgdir}"
}
