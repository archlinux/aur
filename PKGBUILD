# Maintainer: Daniel Perez <tuvistavie@gmail.com>

pkgname=fundle-git
pkgver=20181111
pkgrel=1
pkgdesc='A minimalist package manager for fish shell'
arch=('i686' 'x86_64')
url='https://github.com/tuvistavie/fundle'
license=('MIT')
depends=('fish')
makedepends=('git')
source=('git+https://github.com/tuvistavie/fundle.git')
sha1sums=('SKIP')

package() {
	install -d "$pkgdir/etc/fish/functions"
	install -d "$pkgdir/etc/fish/completions"
	install "fundle/functions/fundle.fish" "$pkgdir/etc/fish/functions/fundle.fish"
	install "fundle/completions/fundle.fish" "$pkgdir/etc/fish/completions/fundle.fish"
}
