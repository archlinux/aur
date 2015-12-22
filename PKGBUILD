# Maintainer: Blood iron  <8100d1r0n@riseup.net>
pkgname=archlinuxinfo
pkgver=2
pkgrel=4
pkgdesc="C program to display system infomation alongside the Arch Linux logo"
arch=('i686' 'x86_64')
url="https://github.com/8100d1r0n/logo"
license=('GPL2')
depends=('glibc')
makedepends=('make')
source=(https://raw.githubusercontent.com/8100d1r0n/logo/master/$pkgname.c)
sha512sums=('SKIP')
package() {
	msg "Compile..."
	make $pkgname
	msg "Install..."
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
