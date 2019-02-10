# Maintainer: osch <oliver@luced.de>
pkgname=lrexrepl
pkgver=0.2.0
pkgrel=1
rockrel=1
pkgdesc="Commandline tool: Search and Replace in multiple files using Regular Expressions and Lua"
arch=('i686' 'x86_64')
url="https://luarocks.org/modules/osch/$pkgname"
license=('MIT')
depends=('lua' 'lrexlib-pcre' 'lua-filesystem')
source=("https://github.com/osch/$pkgname/archive/v$pkgver.tar.gz")
noextract=()

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 lrexrepl "$pkgdir/usr/bin/lrexrepl"
}

md5sums=('45432d2704627298edd8e8c88238744a')
