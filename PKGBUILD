# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Krzysztof Sobczyk <sobczyk.kris@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
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
sha512sums=('1e37b30e4d18fa4e51f7c446c28c6cd862f7f1bf91122d058d2b0eb872b65bb59f363a607f0f9234962783e23804225164a084b18bfee405782db8b0245c48af')
validpgpkeys=()

package() {
    tar xf "$srcdir/data.tar.xz" -C "${pkgdir}"
    mkdir -p "${pkgdir}/usr/bin"
    ln -fs "/usr/lib/x86_64-linux-gnu/ideamaker/ideamaker-start.sh" "${pkgdir}/usr/bin/ideamaker"
}
