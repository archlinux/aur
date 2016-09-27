# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname="aliasrc"
pkgver=1.0.0
pkgrel=2
pkgdesc="Another rc for a faster command line"
arch=('any')
url="https://github.com/nullptrT/aliasrc"
license=('GPL3')
depends=()
makedepends=()
conflicts=()
source=("aliasrc-v$pkgver.tar.gz::https://github.com/nullptrT/aliasrc/archive/v$pkgver.tar.gz"
	"aliasrc.install")
md5sums=('9616277f2cb6cb2d5b8c113198ae650f'
         'a82a1ea241b90b005b21998b00be273d')

package() {
	cd "$srcdir/aliasrc-$pkgver"

	install -d -m644 "$pkgdir/etc/aliasrc.d"
	install -m755 aliasrc.d/*.aliasrc $pkgdir/etc/aliasrc.d
	install -m755 aliasrc "$pkgdir/etc"
}
