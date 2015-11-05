# Maintainer Daniel Perez <tuvistavie@gmail.com>

pkgname=fundle-git
pkgver=20151105
pkgrel=1
pkgdesc='A minimalist package manager for fish shell'
arch=('i686' 'x86_64')
url='https://github.com/tuvistavie/fundle'
license=('MIT')
depends=('fish')
makedepends=('git')
source=('git://github.com/tuvistavie/fundle')
sha1sums=('SKIP')

package() {
	mkdir -p "$pkgdir/etc/fish/functions"
	cp "fundle/fundle.fish" "$pkgdir/etc/fish/functions/fundle.fish"
}
