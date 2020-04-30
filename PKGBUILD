# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>

pkgname=zoom-firejail
pkgver=0.1.1
pkgrel=1
pkgdesc=".desktop file for running Zoom in Firejail"
arch=('x86_64')
license=('MIT')
depends=('zoom' 'firejail')
source=('ZoomFirejail.desktop')
sha512sums=('ab411bc11d8a7bc1befbc25eaaacae7df836c536e5dbf2396fdf7250018df2e7c56443a51c05859d37124f340737a7c9e96192f13a4b12c8bbf6100ae2184de8')

package() {
    install -Dm644 ZoomFirejail.desktop "$pkgdir"/usr/share/applications/ZoomFirejail.desktop
}
