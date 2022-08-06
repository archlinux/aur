# Maintainer: Arran <aur at arran dot nz>
pkgname=rofmoji
pkgver=0.2.2
pkgrel=1
url="https://codeberg.org/arran/rofmoji"
pkgdesc="Quickly find Emoji for your clipboard"
arch=('x86_64')
license=('GPL3')
depends=('rofi' 'libnotify')
optdepends=('wl-clipboard' 'xclip')
source=("https://codeberg.org/arran/rofmoji/archive/$pkgver.tar.gz")
sha256sums=('6ef8d201f2db6ac345698ff720aede0a3fa83d327ccb51c8acf684bb4b814648')
package() {
	cd "rofmoji"
	mkdir -p "$pkgdir/usr/bin"
	cp rofmoji "$pkgdir/usr/bin/"

        mkdir -p "$pkgdir/usr/share/rofmoji"
        cp emoji-list "$pkgdir/usr/share/rofmoji/"
}

