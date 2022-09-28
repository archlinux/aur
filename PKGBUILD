# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Gregory <gregory.mkv@gmail.com

pkgname=xdg-utils-handlr
pkgver=0.6.4
pkgrel=2
pkgdesc="A shim for xdg-utils to use handlr under the hood"
arch=('x86_64')
url='https://github.com/chmln/handlr'
license=('MIT')
depends=('handlr')
provides=('xdg-utils')
conflicts=('xdg-utils' 'xdg-utils-mimeo')

source=('xdg-open')
sha256sums=('21fae4188078463026d6d30bda53483c3e27a1915b1f4a8cb1ae0437d4aca87e')

package() {
	install -Dm755 "$srcdir/xdg-open" "$pkgdir/usr/bin/xdg-open"
}
