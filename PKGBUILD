# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Krzysztof Sobczyk <sobczyk.kris@gmail.com>
# Old Contributor: Fabien Devaux <fdev31@gmail.com>
# Contributor: Patrick Pflug / Sakaschi <patrickpflug92@gmail.com>
pkgname=ideamaker-stable
pkgversion=3.6.1
pkgbuild=4415
pkgver=${pkgversion}.${pkgbuild}
pkgrel=6
epoch=
pkgdesc="Fast and user friendly 3D slicer for FDM printers"
arch=('x86_64')
url="https://www.raise3d.com/pages/ideamaker"
license=('other')
groups=()
depends=('mesa-libgl' 'desktop-file-utils' 'glu' 'libidn11' 'librtmp0')
makedepends=('binutils')
checkdepends=()
optdepends=()
provides=()
conflicts=(ideamaker)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://download.raise3d.com/ideamaker/release/${pkgversion}/ideaMaker_${pkgver}-ubuntu_amd64.deb")
noextract=()
sha512sums=('5386bd1b8952d141b50ef25974c81f1abd0a3a449ac9f494156f9ce048f6a419ab920d98cd009105bdae22c1b0b43ae257ea9b0155b0d92f3cd8f3dbac5837fb')
validpgpkeys=()

package() {
    tar xf "$srcdir/data.tar.xz" -C "${pkgdir}"
    mkdir -p "${pkgdir}/usr/bin"
    ln -fs "/usr/lib/x86_64-linux-gnu/ideamaker/ideamaker-start.sh" "${pkgdir}/usr/bin/ideamaker"
}
