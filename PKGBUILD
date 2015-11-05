# Maintainer: EFE KANDEMIR  <817c0d3r@gmail.com>
pkgname=archlinuxinfo
pkgver=2
pkgrel=3
pkgdesc="C program to display system infomation alongside the Arch Linux logo"
arch=('any')
url="https://github.com/817c0d3r/Logo"
license=('GPL')
depends=("gcc")
source=(https://raw.githubusercontent.com/817c0d3r/Logo/master/${pkgname}.c)
sha512sums=('SKIP')
package() {
	msg "Compile..."
	make ${pkgname}
	msg "Install..."
	install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
