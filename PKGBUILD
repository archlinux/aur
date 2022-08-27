# Maintainer: taotieren <admin@taotieren.com>

pkgname=kicad-pcb-diff
pkgver=2.3.1
pkgrel=1
epoch=
pkgdesc="Tool to generate a PDF file showing the changes between two KiCad PCB/SCH files. Also a git plug-in."
arch=('any')
url="https://github.com/INTI-CMNB/KiDiff"
license=('GPL-2.0')
groups=()
depends=('python' 'kicad' 'python-wxpython' 'imagemagick' 'librsvg' 'poppler' 'xdg-utils')
makedepends=("python-setuptools")
checkdepends=()
optdepends=("kiauto-git: KiCad automation scripts.")
provides=('kidiff' 'kicad-diff')
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("KiDiff-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('88bfac8eb4c3a660a1ae10dca26100df7b9256fe77003e19fc010b4fd95278b6')
#validpgpkeys=()

package() {
    cd "${srcdir}/KiDiff-${pkgver}"
#     python setup.py install --no-compile --root="$pkgdir"
#     install -dm0755 "${pkgdir}/usr/bin"
    make prefix="${pkgdir}"/usr install
}
