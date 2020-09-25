# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>

pkgname=ideamaker
pkgver=3.6.1
pkgverminor=4415
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
sha512sums=('5386bd1b8952d141b50ef25974c81f1abd0a3a449ac9f494156f9ce048f6a419ab920d98cd009105bdae22c1b0b43ae257ea9b0155b0d92f3cd8f3dbac5837fb')
validpgpkeys=()

package() {
    tar xf "$srcdir/data.tar.xz" -C "${pkgdir}"
    mkdir -p "${pkgdir}/usr/bin"
    ln -fs "/usr/lib/x86_64-linux-gnu/ideamaker/ideamaker-start.sh" "${pkgdir}/usr/bin/ideamaker"
}
