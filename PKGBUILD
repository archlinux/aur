# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Devaux Fabien <fdev31@gmail.com>
pkgname=dicom2
pkgver=bin
pkgrel=1
epoch=
pkgdesc="CLI program which allows you to convert medical images and DICOM files"
arch=('x86' 'x86_64')
url=""
license=('unknown')
groups=()
depends=()
makedepends=('gzip')
checkdepends=()
optdepends=()
provides=('dicom2')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.barre.nom.fr/medical/dicom2/files/linux/dicom2.gz")
noextract=()
md5sums=('08890ec19325e163c16417882ba2c8d3')
validpgpkeys=()


build() {
    chmod 755 dicom2
}


package() {
	install -D -m 755 dicom2 "$pkgdir/usr/bin/dicom2"
}
