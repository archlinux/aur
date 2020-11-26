# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>

pkgname=ideamaker
pkgver=4.0.1
pkgverminor=4802
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
sha512sums=('413e200e8350f774b2f6be253e1a8ab8c6f6ffb41f7a4446bfc3a7705dbfec047d9544fc38bf5f26943f046b9ac5c8c70b31eb985e9e14cd5d350b3ceccf32b7')
validpgpkeys=()

package() {
    tar xf "$srcdir/data.tar.xz" -C "${pkgdir}"
    mkdir -p "${pkgdir}/usr/bin"
    ln -fs "/usr/lib/x86_64-linux-gnu/ideamaker/ideamaker-start.sh" "${pkgdir}/usr/bin/ideamaker"
}
