# Contributor: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>

pkgname=ideamaker
pkgver=5.0.6
pkgverminor=8380
pkgrel=1
pkgdesc="Fast and user friendly 3D slicer for FDM printers"
arch=('x86_64')
url="https://www.raise3d.com/pages/ideamaker"
license=('other')
depends=('mesa-libgl' 'desktop-file-utils' 'libxcrypt-compat')
makedepends=('binutils')
source_x86_64=("https://downcdn.raise3d.com/ideamaker/release/${pkgver}-fix/ideaMaker_${pkgver}.${pkgverminor}-ubuntu_amd64.deb")
sha256sums_x86_64=('507efb836c617f0aabcb355d6ce44b5ad659207a77b9e51e2d01a06ddce726b7')


package() {
    tar xf "$srcdir/data.tar.xz" -C "${pkgdir}"
    mkdir -p "${pkgdir}/usr/bin"
    ln -fs "/usr/lib/x86_64-linux-gnu/ideamaker/ideamaker-start.sh" "${pkgdir}/usr/bin/ideamaker"
}
