# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=ideamaker-rc
pkgver=3.1.7
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
provides=(ideamaker)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://s3.amazonaws.com/ideamaker/linux/ideaMaker_${pkgver}-ubuntu_amd64.deb")
noextract=()
md5sums=('f5885367f1c3633af3cb6bbb416049bf')
validpgpkeys=()

package() {
    tar xf "$srcdir/data.tar.xz" -C "${pkgdir}"
    mkdir -p "${pkgdir}/usr/bin"
    ln -fs "/usr/lib/x86_64-linux-gnu/ideamaker/ideamaker-start.sh" "${pkgdir}/usr/bin/ideamaker"
}
