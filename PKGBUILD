# Maintainer: Arran <aur at arran dot nz>
pkgname=rofmoji
pkgver=0.1.0
pkgrel=1
url="https://codeberg.org/arran/rofmoji"
pkgdesc="Quickly find Emoji for your clipboard"
arch=('x86_64')
license=('GPL3')
depends=('rofi' 'libnotify' 'wl-clipboard')
source=("https://codeberg.org/arran/rofmoji/archive/$pkgver.tar.gz")
sha256sums=('3328db2a12ee1725ebc7c2fccf4b6669af2fb2af30d69938b77aa976fcbd8cfa')
package() {
	cd "rofmoji"
	mkdir -p "$pkgdir/usr/bin"
	cp rofmoji "$pkgdir/usr/bin/"

        mkdir -p "$pkgdir/usr/share/rofmoji"
        cp emoji-list "$pkgdir/usr/share/rofmoji/"
}

