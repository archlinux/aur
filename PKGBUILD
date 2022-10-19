# Maintainer: Garlicbreadwolfs <garlicbreadwolfs AT riseup DOT net>

pkgname=zshbinsh
pkgver=2
pkgrel=1
pkgdesc="Relink /bin/sh to zsh"
arch=('any')
license=('Unlicense')
conflicts=('dashbinsh')
depends=('zsh')
provides=('sh')
install="${pkgname}.install"
source=("${pkgname}.hook")
sha256sums=('e6afcf9b0509694a4be3247e350bc39633e228d64558972c98b846ac5aeba3ff')
sha512sums=('6307fcaa604c20bb44a393be0f2c5258352d999061bf25de2bbf8fee35f060fbe4d24e5e658f9b0140535a54a2497d35e6cf6187e827899cf84c8db597e33bc7')

package() {
  cd "$srcdir"
	install -Dm 644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
}
