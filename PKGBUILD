# Maintainer: EFE KANDEMIR  <817c0d3r@gmail.com>
pkgname=archlinuxinfo
pkgver=1
pkgrel=1
pkgdesc="C program to display system infomation alongside the Arch Linux logo"
arch=('any')
url="https://github.com/817c0d3r/dotfiles/tree/master/bin"
license=('GPL')
depends=("gcc")
source=(https://raw.githubusercontent.com/817c0d3r/dotfiles/master/bin/${pkgname}2.c)
sha512sums=('b93042079f8e1efaf7d64864c33852cbc53169da8c32f37797c3507410699a722bfd3945d2421cb784c0dbb4bb80e7647896f4065b07867fa6d33795433ee39a')
package() {
	msg "Compile..."
	make ${pkgname}2
	msg "Install..."

	install -Dm755 ${pkgname}2 "$pkgdir/usr/bin/${pkgname}"
}
