# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=nauz-file-detector-bin
pkgver=0.09
pkgrel=1
epoch=
pkgdesc="Linker/Compiler/Tool detector for Windows, Linux and MacOS."
arch=(x86_64)
url="https://github.com/horsicq/Nauz-File-Detector"
license=('MIT')
groups=()
depends=(glibc gcc-libs qt5-base)
makedepends=()
checkdepends=()
optdepends=()
provides=(nauz-file-detector)
conflicts=(nauz-file-detector-git)
replaces=()
backup=()
options=()
install=
changelog=
source=(https://raw.githubusercontent.com/horsicq/Nauz-File-Detector/0349d29484d46094a7de551994e13355d9e4ef58/LICENSE
"https://github.com/horsicq/Nauz-File-Detector/releases/download/0.09/nauz-file-detector-0.09-1-x86_64.pkg.tar.zst")
noextract=()
sha256sums=('c83ff8cc9bdc01529005cf34e61fb43b22d907f8bfecee940973f4ae193fbded'
            '131ad834132b3bd3a542c25360ca1c113bf795b745187cb6127fa3c38ae92107')
validpgpkeys=()

package() {
	install -Dm644 LIC* -t $pkgdir/usr/share/licenses/$pkgname/
	rm -v LIC*
	rm -v *.pkg.tar.zst
	cp -av * $pkgdir
}
