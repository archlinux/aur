# Maintainer: Arran <aur at arran dot nz>
pkgname=rofmoji
pkgver=0.2.1
pkgrel=1
url="https://codeberg.org/arran/rofmoji"
pkgdesc="Quickly find Emoji for your clipboard"
arch=('x86_64')
license=('GPL3')
depends=('rofi' 'libnotify')
optdepends=('wl-clipboard' 'xclip')
source=("https://codeberg.org/arran/rofmoji/archive/$pkgver.tar.gz")
sha256sums=('e2fcbe581ac1e13cbf1bb372e7b1bc146748d2b8d0a04bbd8845ad043f831e64')
package() {
	cd "rofmoji"
	mkdir -p "$pkgdir/usr/bin"
	cp rofmoji "$pkgdir/usr/bin/"

        mkdir -p "$pkgdir/usr/share/rofmoji"
        cp emoji-list "$pkgdir/usr/share/rofmoji/"
}

