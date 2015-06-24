# Maintainer: Evan Penner  <evaninrussia@gmail.com>
pkgname=archlinuxinfo2
pkgver=1.0
pkgrel=1
pkgdesc="C program to display system infomation alongside the Arch Linux logo"
arch=('any')
url="https://github.com/817c0d3r/dotfiles/tree/master/bin"
license=('GPL')
depends=("git")
makedepends=("make")
source=(https://raw.githubusercontent.com/817c0d3r/dotfiles/master/bin/${pkgname}.c)
sha512sums=('SKIP')
package() {
	msg "Compile..."
	make ${pkgname}
	msg "Install..."
	install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
