# Maintainer: Sergio Schneider <s p s f 6 4 at gmail dot com>

pkgname=rclone-appmenu
pkgver=1.0
pkgrel=2
pkgdesc='Adds Rclone Web UI to applications menu'
arch=('any')
url="https://rclone.org/gui/"
license=('GPL')
depends=('bash' 'rclone' 'xdg-utils')

source=(
	'rclone.desktop'
	'rclone.svg'
)

sha256sums=('152106dfade98291bfd2dba32994ace35f7df55f0c61ebcd449449aeb9b94e08'
            '47d748b825bd9c03ddb9a7f22283a5a552af1874a45ab0484c8be36c9eabd26e')

package() {
	install -Dm644 "${srcdir}"/rclone.desktop "${pkgdir}"/usr/share/applications/rclone.desktop
	install -Dm644 "${srcdir}"/rclone.svg "${pkgdir}"/usr/share/pixmaps/rclone.svg
}
