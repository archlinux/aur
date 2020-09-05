# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>
pkgname=passmenu2
pkgver=1
pkgrel=1
pkgdesc="Shell script to browse pass using dmenu with support for folders"
arch=(any)
url="https://tools.suckless.org/dmenu/scripts/"
license=('custom')
depends=('pass')
optdepends=('xdotool: --type option support')
source=("https://tools.suckless.org/dmenu/scripts/passmenu2")
md5sums=('36deedee64fac213dce73ce02b9ec0f0')

package() {
	install -Dm 755 $srcdir/passmenu2 $pkgdir/usr/bin/passmenu2
}
