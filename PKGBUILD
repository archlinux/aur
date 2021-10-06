# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>

pkgname=ideamaker
pkgver=4.2.1
pkgverminor=5320
pkgrel=1
pkgdesc="Fast and user friendly 3D slicer for FDM printers"
arch=('x86_64')
url="https://www.raise3d.com/pages/ideamaker"
license=('other')
groups=()
depends=('mesa-libgl' 'desktop-file-utils')
makedepends=('binutils')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://download.raise3d.com/ideamaker/release/${pkgver}/ideaMaker_${pkgver}.${pkgverminor}-ubuntu_amd64.deb")
noextract=()
sha256sums=('46b83c75e116ad62ad1b9056fa33905c58c7d1758af3ec3d13c38eaf3ea491cd')
validpgpkeys=()

package() {
    tar xf "$srcdir/data.tar.xz" -C "${pkgdir}"
    mkdir -p "${pkgdir}/usr/bin"
    ln -fs "/usr/lib/x86_64-linux-gnu/ideamaker/ideamaker-start.sh" "${pkgdir}/usr/bin/ideamaker"
}
