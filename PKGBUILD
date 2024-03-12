# Maintainer: jo2k <aur dot jo at nubecula dot net>
# Contributor: Hugo Rodrigues <hugorodrigues at openmailbox dot com>

pkgname=syncthing-desktop-entries
pkgver=1.0.2
pkgrel=1
pkgdesc='Adds files to integrate Syncthing in your desktop environment.'
url='https://github.com/syncthing/syncthing'
arch=('any')
license=('GPL')
depends=('syncthing')
conflicts=('syncthing-appmenu')
source=(
    'syncthing-start.desktop'
    'syncthing-ui.desktop'
    'syncthing.svg'
)
sha256sums=('750f60ce1da6a9f30494d676141151d99eb4c7f6cc58e04cd1478cff94834b40'
            '07e5560cba895df128bef12d8a4397fd37dc0311311a390111ba1f46d96cc0b5'
            '32a59ba5e16eea315c533d38358107984049d54c8130122cd0a63480fffa80dd')

package() {
    install -Dm644 "${srcdir}"/syncthing-start.desktop "${pkgdir}"/usr/share/applications/syncthing-start.desktop
    install -Dm644 "${srcdir}"/syncthing-ui.desktop "${pkgdir}"/usr/share/applications/syncthing-ui.desktop
    install -Dm644 "${srcdir}"/syncthing.svg "${pkgdir}"/usr/share/pixmaps/syncthing.svg
}

