# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=detect-it-easy-bin
pkgver=3.08
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
sha256sums=('2e52e2e5b46486c641247e048795ea25d773fb3b1c51402e2850574b237a0e8c')

package() {
	rm -v *.tar.zst
	cp -av * $pkgdir
	install -vDm644 $pkgdir/usr/share/licenses/detect-it-easy/LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
