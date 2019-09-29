# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>

pkgname=tizen-sdb
pkgver=2.2.29
pkgrel=1
pkgdesc="Tizen Smart Development Bridge"
arch=('i686' 'x86_64')
url="https://github.com/TizenTeam/sdb"
license=('Apache')
groups=()
provides=('tizen-sdb')
source=("git+https://github.com/TizenTeam/sdb#tag=2.2.1_release")
md5sums=('SKIP')

build() {
	cd $srcdir/sdb
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/sdb/bin/sdb" "$pkgdir/usr/bin/"
} 
