# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=detect-it-easy-bin
pkgver=3.09
pkgrel=1
pkgdesc="Program for determining types of files for Windows, Linux and MacOS."
arch=(x86_64)
url="http://ntinfo.biz/"
license=('MIT')
depends=(qt5-script qt5-base gcc-libs glibc)
provides=(detect-it-easy)
conflicts=(detect-it-easy)
source=("https://github.com/horsicq/DIE-engine/releases/download/${pkgver}/detect-it-easy-${pkgver}-1-x86_64.pkg.tar.zst"
)
sha256sums=('75a0766d2a1599583e0b3ab3ce399c062400fdbd9afbab0676a1690e9a6869f7')

package() {
	rm -v *.tar.zst
	cp -av * "$pkgdir"
	install -vDm644 "$pkgdir"/usr/share/licenses/detect-it-easy/LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"/
}
