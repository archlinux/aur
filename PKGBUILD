# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <youremail@domain.com>
pkgname=detect-it-easy-bin
pkgver=3.07
pkgrel=1
epoch=
pkgdesc="Program for determining types of files for Windows, Linux and MacOS."
arch=(x86_64)
url="http://ntinfo.biz/"
license=('MIT')
groups=()
depends=(qt5-script qt5-base gcc-libs glibc)
makedepends=()
checkdepends=()
optdepends=()
provides=(die diec diel)
conflicts=(detect-it-easy detect-it-easy-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/horsicq/DIE-engine/releases/download/3.07/detect-it-easy-3.07-1-x86_64.pkg.tar.zst"
        )
noextract=()
sha256sums=('1acbda023f2bd42d835cd1d41a980ddede81396cfff510f05178df054285a527')
validpgpkeys=()


package() {
	rm -v *.tar.zst
	cp -av * $pkgdir
	install -vDm644 $pkgdir/usr/share/licenses/detect-it-easy/LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
