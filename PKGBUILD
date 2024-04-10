# Maintainer: Nick G. <wirlaburla@worlio.com>

_pkgname=anope
pkgname=${_pkgname}-dinit
pkgver=1.0.0
pkgrel=1
pkgdesc="A set of IRC Services designed for flexibility and ease of use (dinit)"
arch=('any')
source=("${_pkgname}.service")
depends=("${_pkgname}")
sha256sums=(
	'63f8b05c4095e11d9c6c2601c2cd972dbf70c93ad44fdd481c576335980b9f8b'
)

package() {
	install -Dm644 "${_pkgname}.service" "$pkgdir/etc/dinit.d/${_pkgname}"
}
