# Maintainer: Sergio Schneider <s p s f 6 4 at gmail dot com>
# Maintainer: Hugo Rodrigues <hugorodrigues at openmailbox dot com>

pkgname=syncthing-appmenu
pkgver=1.3
pkgrel=1
pkgdesc='Adds Syncthing Web GUI to applications menu'
arch=('any')
url="https://docs.syncthing.net/intro/gui.html"
license=('GPL')
depends=('bash' 'syncthing' 'xdg-utils')

source=(
	'syncthing.desktop'
	'syncthing.svg'
        'syncthing-appmenu.install'
	'.nvchecker.toml'
)

sha256sums=('3ef0afec14544195e1b770ee82b27e6231d9b555ba48d59c124401d6ad79821b'
            '519f08b9ba5d0308d62491a6788d1671208da3029af0a23940c93b4abe10728a'
            'f067589cd53a4240c3625d4a3438874f9bbd77453c8ef36e488eeaec2bd99fdb'
            '72d47d6ff706dfb1e63e658840c1ec063f4a224cb09b384b1444549741a14f01')

package() {
    install="${pkgname}.install"
	install -Dm644 "${srcdir}"/syncthing.desktop "${pkgdir}"/usr/share/applications/syncthing.desktop
	install -Dm644 "${srcdir}"/syncthing.svg "${pkgdir}"/usr/share/pixmaps/syncthing.svg
}
