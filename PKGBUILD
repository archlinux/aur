# Maintainer: Max Beck <rytonemail@gmail.com>
_npmname=reflow-build
_npmver=2.2.1
pkgname=reflow
pkgver=2.2.1
pkgrel=1
pkgdesc="coordinate your multi-language projects with ease"
arch=(any)
url="https://gitlab.com/rytone/reflow"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'git')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
md5sums=('SKIP') 

package() {
	cd "$srcdir"
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p "$_npmdir"
	cd "$_npmdir"
	npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
