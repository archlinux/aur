# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=arch-update
pkgver=1.3.2
pkgrel=1
pkgdesc="A clickeable icon that automatically changes to act as an update notifier/applier"
arch=('any')
url="https://github.com/Antiz96/arch-update"
license=('GPL3')
depends=('pacman-contrib')
optdepends=('yay: AUR support'
	    'paru: AUR support'
	    'libnotify: Desktop notification support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('586b2ce7ad7ea68ece22a9a0bfeda77e2c83ee67dd1fa1f2e55deabb9c820aa4')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
