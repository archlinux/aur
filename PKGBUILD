# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=detect-it-easy-bin
pkgver=3.21
pkgrel=1
pkgdesc="Program for determining types of files for Windows, Linux and MacOS."
arch=(x86_64)
url="http://ntinfo.biz/"
license=('MIT')
depends=(qt5-script qt5-base glibc hicolor-icon-theme libgcc libstdc++)
provides=(detect-it-easy)
conflicts=(detect-it-easy)
source=("https://github.com/horsicq/DIE-engine/releases/download/${pkgver}/detect-it-easy-${pkgver}-1-x86_64.pkg.tar.zst"
)
sha256sums=('7fb930ae53f80f50720c54f0d7a4c9c1a624ba084baa2b43a040f338565e13e1')

package() {
	rm -v *.tar.zst
	cp -av * "$pkgdir"
	install -vDm644 "$pkgdir"/usr/share/licenses/detect-it-easy/LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"/
}
