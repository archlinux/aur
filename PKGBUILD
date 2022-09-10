# Maintainer: 0xMRTT <0xMRTT@tuta.io>

pkgname=dg-gnome-theme
pkgver=0.1.0
pkgrel=1
pkgdesc="A Libadwaita + macOS + Yaru theme for GNOME"
url="https://github.com/dgmarie/dg-gnome-theme"
arch=(any)
license=(GPL)
depends=('gnome-shell-extensions' )
makedepends=('sassc' 'git' 'ninja' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')


package() {
        cd "$pkgname"
	true | ./install.sh
}
