# Maintainer: Chrysostomus @forum.manjaro.org

pkgname=bmenu
pkgver=0.4.1
pkgrel=4
pkgdesc="Simple system menu for commandline"
arch=(any)
url="https://github.com/Chrysostomus/$pkgname"
license=MIT
depends=('awk'
	'bash'
	'elinks'
	'pacli'
	'sed'
	'fzf')
optdepends=(
	'brandr'
	'ranger')
makedepends=('git')
source=("git://github.com/Chrysostomus/$pkgname#branch=aur")
md5sums=('SKIP')

package () {
	cd "$srcdir"
	install -dm755 $pkgdir/usr/bin
	cp -r $srcdir/$pkgname/bin $pkgdir/usr
	chmod a+x $pkgdir/usr/bin/*
}