# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname="aliasrc"
pkgver=1.0.3
pkgrel=1
pkgdesc="Another rc for a faster command line"
arch=('any')
url="https://github.com/nullptrT/aliasrc"
license=('GPL3')
depends=()
makedepends=()
conflicts=()
source=("aliasrc-v$pkgver.tar.gz::https://github.com/nullptrT/aliasrc/archive/v$pkgver.tar.gz"
	"aliasrc.install")
md5sums=('e3f92c5b38a1e52fb2b3964d74fdba5d'
         'a82a1ea241b90b005b21998b00be273d')

package() {
	cd "$srcdir/aliasrc-$pkgver"

	install -d "$pkgdir/etc/aliasrc.d"
	install aliasrc.d/*.aliasrc $pkgdir/etc/aliasrc.d
	install aliasrc "$pkgdir/etc"
}
