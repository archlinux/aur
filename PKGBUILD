# Maintainer: Sergio Schneider <s p s f 6 4 at gmail dot com>
# Maintainer: Hugo Rodrigues <hugorodrigues at openmailbox dot com>

pkgname=syncthing-appmenu
pkgver=1.1
pkgrel=2
pkgdesc='Adds Syncthing Web GUI to applications menu'
arch=('any')
url="https://docs.syncthing.net/intro/gui.html"
license=('GPL')
depends=('bash' 'syncthing' 'xdg-utils')

source=(
	'syncthing.desktop'
	'syncthing.svg'
)
sha256sums=('7524bc76a7d466ea0f83a944bfb57b568565df19fefc59e444259d21b37d0c64'
            '519f08b9ba5d0308d62491a6788d1671208da3029af0a23940c93b4abe10728a')

package() {
	install -Dm644 "${srcdir}"/syncthing.desktop "${pkgdir}"/usr/share/applications/syncthing.desktop
	install -Dm644 "${srcdir}"/syncthing.svg "${pkgdir}"/usr/share/pixmaps/syncthing.svg
}
