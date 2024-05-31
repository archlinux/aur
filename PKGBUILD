# Contributor: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>

pkgname=ideamaker
pkgver=5.0.5
pkgverminor=8310
pkgrel=1
pkgdesc="Fast and user friendly 3D slicer for FDM printers"
arch=('x86_64')
url="https://www.raise3d.com/pages/ideamaker"
license=('other')
depends=('mesa-libgl' 'desktop-file-utils' 'libxcrypt-compat')
makedepends=('binutils')
source_x86_64=("https://download.raise3d.com/ideamaker/release/${pkgver}/ideaMaker_${pkgver}.${pkgverminor}-ubuntu_amd64.deb")
sha256sums_x86_64=('a8f61fa597c19a21b3e3ee0eb014cddd1ba56ff0238d2e2f22ecd72c064285f4')


package() {
    tar xf "$srcdir/data.tar.xz" -C "${pkgdir}"
    mkdir -p "${pkgdir}/usr/bin"
    ln -fs "/usr/lib/x86_64-linux-gnu/ideamaker/ideamaker-start.sh" "${pkgdir}/usr/bin/ideamaker"
}
