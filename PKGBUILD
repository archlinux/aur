# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

pkgname=updvcspkg
pkgver=1.5.1
pkgrel=1
pkgdesc="Check upstream updates for VCS packages from AUR"
arch=(any)
url="https://github.com/egormanga/updvcspkg"
license=(GPL)
makedepends=(git)
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 'updvcspkg' -t "${pkgdir}/usr/bin"
}
