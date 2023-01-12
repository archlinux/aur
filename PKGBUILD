# Maintainer: taotieren <admin@taotieren.com>

pkgbase=kicad-pcb-diff
pkgname=kidiff
pkgver=2.4.3
pkgrel=0
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
provides=('kidiff' 'kicad-diff' 'kicad-pcb-diff')
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("KiDiff-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('e42d4ef010fd05c77a867bcfb7366d7b680f539599fc289c55c601511d5d9e22')
#validpgpkeys=()

package() {
    cd "${srcdir}/KiDiff-${pkgver}"
     python setup.py install --no-compile --root="$pkgdir"
#      install -dm0755 "${pkgdir}/usr/bin"
#    make prefix="${pkgdir}"/usr install
}
