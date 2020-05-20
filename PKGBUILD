# Maintainer: Gregory <gregory.mkv@gmail.com
pkgname=xdg-utils-handlr
pkgver=0.3.1
pkgrel=2
pkgdesc="A shim for xdg-utils to use handlr under the hood"
arch=('x86_64')
url="https://github.com/chmln/handlr"
license=('MIT')
groups=()
depends=()
provides=('xdg-utils')
conflicts=('xdg-utils' 'xdg-utils-mimeo')
source=("xdg-open")
sha256sums=('SKIP')

package() {
	install -Dm755 $srcdir/xdg-open $pkgdir/usr/bin/xdg-open
}
