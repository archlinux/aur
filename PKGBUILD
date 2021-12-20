# Maintainer: taotieren <admin@taotieren.com>

pkgname=kibot
pkgver=0.11.0
pkgrel=1
epoch=
pkgdesc="KiCad automation utility"
arch=('any')
url="https://github.com/INTI-CMNB/KiBot"
license=('GPL-3.0')
groups=()
depends=('python')
makedepends=("python-setuptools")
checkdepends=()
optdepends=()
provides=()
conflicts=(kibot-git)
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://ghproxy.com/${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('6dc9376dc9402ab9bb0bec9f6ad69aa306ee63633546c46aa1f4ca49e7c41bc3')
#validpgpkeys=()

package() {
    cd "${srcdir}/KiBot-${pkgver}"
    python setup.py install --no-compile --root="$pkgdir"
}
