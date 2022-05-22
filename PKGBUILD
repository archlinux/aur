# Maintainer: Garlicbreadwolfs <garlicbreadwolfs AT riseup DOT net>

pkgname=zshbinsh
pkgver=1
pkgrel=2
pkgdesc="Relink /bin/sh to zsh"
arch=('any')
license=('Unlicense')
conflicts=('dashbinsh')
depends=('zsh')
provides=('sh')
install="${pkgname}.install"
source=("${pkgname}.hook")

# For 32-bit machines
sha256sums=('b13cab38386bff8e886f3a3a49ca7f1434637852c1be5523f384441cb9ecbb19')

# For 64-bit machines
sha512sums=('ffba4ceddc503b4c4c7593c3ef9a76ade4669729479071dd68d287dc556a9e314d4523fac990c481b3851a14ad4885eb8d9898c03474b3979c1c9eb5e482ff94')

package() {
  cd "$srcdir"
	install -Dm 644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
}
