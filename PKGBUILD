# Maintainer: taotieren <admin@taotieren.com>

pkgname=kicad-pcb-diff
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="This program generates a PDF file showing the changes between two KiCad PCB files."
arch=('any')
url="https://github.com/INTI-CMNB/kicad_pcb-diff"
license=('GPL-2.0')
groups=()
depends=('python' 'kicad' 'python-wxpython' 'imagemagick' 'poppler' 'xdg-utils')
makedepends=("python-setuptools")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://ghproxy.com/${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('6904b04b913b4e22c0b9aca244456264b4cb0538f2dc80227fae6ce125246daf')
#validpgpkeys=()

package() {
    cd "${srcdir}/kicad_pcb-diff-${pkgver}"
#     python setup.py install --no-compile --root="$pkgdir"
#     install -dm0755 "${pkgdir}/usr/bin"
    make prefix="${pkgdir}"/usr install
}
