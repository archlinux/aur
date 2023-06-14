# Maintainer: Abhiyan Dhakal <itsabhiyandhakal@gmail.com>
pkgname='power-menu-bin'
pkgver=0.1.2
pkgrel=1
pkgdesc="A power menu for window managers"
arch=('x86_64')
url="https://github.com/abhiyandhakal/power-menu.git"
license=('MIT')
makedepends=('git')
depends=('webkit2gtk'
					'curl'
					'wget'
					'openssl'
					'appmenu-gtk-module'
					'gtk3'
					'libappindicator-gtk3'
					'librsvg'
					'libvips'
					)
optdepends=('xorg-server')
provides=('power-menu')
source=("https://github.com/abhiyandhakal/power-menu/releases/download/v0.1.1/power-menu")
md5sums=('SKIP')

package() {
	install -Dm755 power-menu "$pkgdir/usr/bin/power-menu"
}
