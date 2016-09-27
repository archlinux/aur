# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname="aliasrc"
pkgver=1.0
pkgrel=1
pkgdesc="Another rc for a faster command line"
arch=('any')
url="https://github.com/nullptrT/aliasrc"
license=('GPL3')
depends=()
makedepends=()
conflicts=()
source=("git+https://github.com/nullptrT/aliasrc.git"
	"aliasrc.install")
md5sums=('SKIP'
         'a82a1ea241b90b005b21998b00be273d')

package() {
	cd "$srcdir"
	install -d "$pkgdir/etc/aliasrc.d"
	for f in "$srcdir/aliasrc.d/*.aliasrc"; do
		cp f "$pkgdir/etc/aliarc.d/"
	done
	cp aliasrc "$pkgdir/etc"
}
