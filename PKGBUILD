# Maintainer: 8100d1r0n (echo "ODEwMGQxcjBuKGF0KXJpc2V1cChkb3QpbmV0Cg=="|base64 -d)
pkgname=archlinuxinfo
pkgver=2
pkgrel=6
pkgdesc="C program to display system infomation alongside the Arch Linux logo"
arch=('x86_64')
url="https://github.com/8100d1r0n/logo"
license=('GPL2')
depends=('glibc')
source=(https://raw.githubusercontent.com/8100d1r0n/logo/master/$pkgname.c)
sha512sums=('SKIP')
package() {
	msg2 "Compile..."
	make $pkgname
	msg2 "Install..."
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
