# Maintainer: Sergio Schneider <s p s f 6 4 at gmail dot com>
# Maintainer: Hugo Rodrigues <hugorodrigues at openmailbox dot com>

pkgname=syncthing-appmenu
pkgver=1.1
pkgrel=1
pkgdesc='Adds Syncthing Web GUI to applications menu'
arch=('any')
license=('GPL')
depends=('bash' 'syncthing')

source=(
	'syncthing.desktop'
	'syncthing.svg'
)
sha256sums=('4647869b8c4b6732b5b701e78a07c679c423fd117e1a075016c30a34ede561a4'
            '519f08b9ba5d0308d62491a6788d1671208da3029af0a23940c93b4abe10728a')

package() {
	install -Dm644 "${srcdir}"/syncthing.desktop "${pkgdir}"/usr/share/applications/syncthing.desktop
	install -Dm644 "${srcdir}"/syncthing.svg "${pkgdir}"/usr/share/pixmaps/syncthing.svg
}
