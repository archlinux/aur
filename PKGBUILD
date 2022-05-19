# Maintainer: Garlicbreadwolfs <garlicbreadwolfs AT riseup DOT net>

pkgname=zshbinsh
pkgver=1
pkgrel=1
pkgdesc="Relink /bin/sh to zsh"
arch=('any')
license=('Unlicense')
conflicts=('dashbinsh')
depends=('zsh')
provides=('sh')
install="${pkgname}.install"
source=("${pkgname}.hook")
sha512sums=('SKIP')

package() {
  cd "$srcdir"
	install -Dm 644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
}
