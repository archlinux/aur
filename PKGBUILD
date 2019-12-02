# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=ideamaker
pkgver=3.4.2.3140
pkgrel=1
epoch=
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
source=("https://s3.amazonaws.com/ideamaker/linux/ideaMaker_${pkgver}-ubuntu_amd64.deb")
noextract=()
sha512sums=('362e5372258cca516ea6898609ead3cf04b11b1f2a6603b3a882c58ca199685f3762687498839290f534d8da831e3dd6ff7fb885d886c664184f04c33fb6d2ff')
validpgpkeys=()

package() {
    tar xf "$srcdir/data.tar.xz" -C "${pkgdir}"
    mkdir -p "${pkgdir}/usr/bin"
    ln -fs "/usr/lib/x86_64-linux-gnu/ideamaker/ideamaker-start.sh" "${pkgdir}/usr/bin/ideamaker"
}
