# Maintainer: Chrysostomus @forum.manjaro.org

pkgname=brandr
pkgver=0.2
pkgrel=2
pkgdesc="An interactive xrandr interface using bash"
arch=(any)
url="https://github.com/Chrysostomus/$pkgname"
license=MIT
depends=('awk'
	'bash'
	'xorg-xrandr')
optdepends=('srandrd: Dynamic loading of saved settings')
makedepends=('git')
source=("git://github.com/Chrysostomus/$pkgname")
md5sums=('SKIP')

package () {
	cd "$srcdir"
        install -Dm755 "$srcdir/$pkgname/brandr" "$pkgdir/usr/bin/brandr"
        install -Dm755 "$srcdir/$pkgname/autorandr.sh" "$pkgdir/usr/bin/autorandr.sh"
}