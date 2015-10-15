# Maintainer: Chrysostomus @forum.manjaro.org

pkgname=pacli
pkgver=0.1
pkgrel=1
pkgdesc="An interactive pacman interface using pmenu"
arch=(any)
url="https://github.com/Chrysostomus/$pkgname"
license=MIT
depends=('pmenu'
	'pacman'
	'yaourt'
	'downgrade'
	'bash')
makedepends=('git')
source=("git://github.com/Chrysostomus/$pkgname")
md5sums=('SKIP')

package () {
	cd "$srcdir"
        install -Dm755 "$srcdir/$pkgname/pacli" "$pkgdir/usr/bin/pacli"
}