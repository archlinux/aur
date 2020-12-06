# Maintainer: Denton Liu <liu.denton@gmail.com>

pkgname=reflector-mirrorlist-update
pkgver=1.0
pkgrel=1
pkgdesc="Use reflector to update mirrorlist when pacman-mirrorlist is updated"
arch=('any')
license=('GPL')
depends=('sh' 'systemd' 'reflector')
source=("${pkgname}.hook")
sha256sums=('86c37645da78cfd7fe29cfe9e4fbe798dc0d9b0c3aa306364178d0f7d5b3c7f1')

package() {
	cd "$srcdir"
	install -Dm 644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
}
