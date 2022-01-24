# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

pkgname=updvcspkg
pkgver=1.0.0
pkgrel=1
pkgdesc="Check upstream updates for VCS packages from AUR"
arch=(any)
url="https://github.com/egormanga/${pkgname}"
license=(GPL)
depends=(safe-rm)
makedepends=(git)
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm644 'updvcspkg' -t "${pkgdir}/usr/bin"
}
