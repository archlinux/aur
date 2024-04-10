# Maintainer: Nick G. <wirlaburla@worlio.com>

_pkgname=icecast
pkgname=${_pkgname}-dinit
pkgver=1.0.0
pkgrel=1
pkgdesc="Streaming audio over the Internet (dinit)"
arch=('any')
source=("${_pkgname}.service")
depends=("${_pkgname}")
sha256sums=('eb42d85047d449d4c8bb6e919f7e16aff68c3b8773cc9d9ce81ec4aec1e57038')

package() {
	install -Dm644 ${_pkgname}.service "$pkgdir/etc/dinit.d/$_pkgname"
}
