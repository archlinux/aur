# Maintainer: Arran <aur at arran dot nz>
pkgname=rofmoji
pkgver=0.1.1
pkgrel=1
url="https://codeberg.org/arran/rofmoji"
pkgdesc="Quickly find Emoji for your clipboard"
arch=('x86_64')
license=('GPL3')
depends=('rofi' 'libnotify' 'wl-clipboard')
source=("https://codeberg.org/arran/rofmoji/archive/$pkgver.tar.gz")
sha256sums=('d910ae7d9b75539689987c02ee434c983e6763d5d7d3e814025d642069f8af11')
package() {
	cd "rofmoji"
	mkdir -p "$pkgdir/usr/bin"
	cp rofmoji "$pkgdir/usr/bin/"

        mkdir -p "$pkgdir/usr/share/rofmoji"
        cp emoji-list "$pkgdir/usr/share/rofmoji/"
}

