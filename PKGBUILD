# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=detect-it-easy-bin
pkgver=3.07
pkgrel=1
pkgdesc="Program for determining types of files for Windows, Linux and MacOS."
arch=(x86_64)
url="http://ntinfo.biz/"
license=('MIT')
depends=(qt5-script qt5-base gcc-libs glibc)
provides=(die diec diel)
conflicts=(detect-it-easy detect-it-easy-git)
source=("https://github.com/horsicq/DIE-engine/releases/download/${pkgver}/detect-it-easy-${pkgver}-1-x86_64.pkg.tar.zst"
)
sha256sums=('1acbda023f2bd42d835cd1d41a980ddede81396cfff510f05178df054285a527')

package() {
	rm -v *.tar.zst
	cp -av * $pkgdir
	install -vDm644 $pkgdir/usr/share/licenses/detect-it-easy/LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
