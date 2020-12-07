# Maintainer: Denton Liu <liu.denton@gmail.com>
# Contributor: Matthew T Hoare <matthew.t.hoare at gmail dot com>

pkgname=dashbinsh
pkgver=0.1
pkgrel=5
pkgdesc="Relink /bin/sh to dash"
arch=('any')
license=('GPL')
depends=('dash')
provides=('sh')
install="${pkgname}.install"
source=("${pkgname}.hook")
sha512sums=('8135b7225ff50b475321425059afc567bd54debb7a113337c442ca5394c137f357c886366a6367d7befb9c221ee4a4ac6ea5df8ad47ec3274a86e30baa7bc6e7')

package() {
  cd "$srcdir"
	install -Dm 644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
}
