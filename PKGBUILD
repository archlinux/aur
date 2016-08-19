#Package from: mike2718 <https://github.com/mike2718>
#Maintainer : Sasasu <lizhaolong0123@gmail.com>
pkgname=moefmcmd
pkgver=20160819
pkgrel=1
pkgdesc="moe.fm bash script client"
arch=('any')
url="https://github.com/mike2718/moefmcmd.git"
license=('unknown')
depends=('mpg123' 'curl' 'jq')
makedepends=('git')
source=("$pkgname::git+https://github.com/mike2718/moefmcmd.git")
md5sums=('SKIP')

build() {
	cd "$srcdir"/"$_pkgname/$pkgname"
	cp moefmcmd.sh moefmcmd
}
package() {
	cd "$srcdir"/"$_pkgname/$pkgname"
	mkdir -p "$pkgdir"/usr/bin
	install -Dm755 "moefmcmd" "$pkgdir"/usr/bin
}
