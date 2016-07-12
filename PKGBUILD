# Maintainer: Hugo Rodrigues <hugorodrigues at openmailbox dot com>

pkgname=syncthing-appmenu
pkgver=1.0.0
pkgrel=1
pkgdesc='Adds Syncthing Web GUI to applications menu'
arch=('any')
license=('GPL')
source=(
	'syncthing.desktop'
	'syncthing.svg'
)
sha256sums=(
	'17c97f58a24726c52d1771d6ccd7db70c7a707126dde8d1cf48e12caec3fe220'
	'519f08b9ba5d0308d62491a6788d1671208da3029af0a23940c93b4abe10728a'
)

package() {
	install -Dm644 "${srcdir}"/syncthing.desktop "${pkgdir}"/usr/share/applications/syncthing.desktop
	install -Dm644 "${srcdir}"/syncthing.svg "${pkgdir}"/usr/share/pixmaps/syncthing.svg
}
