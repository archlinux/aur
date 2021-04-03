# Maintainer: Arran <aur at arran dot nz>
pkgname=rofmoji
pkgver=0.2.0
pkgrel=1
url="https://codeberg.org/arran/rofmoji"
pkgdesc="Quickly find Emoji for your clipboard"
arch=('x86_64')
license=('GPL3')
depends=('rofi' 'libnotify')
optdepends=('wl-clipboard' 'xclip')
source=("https://codeberg.org/arran/rofmoji/archive/$pkgver.tar.gz")
sha256sums=('aa833ce40d49970125ae9be7a0910a5f7eadcb5c40a851b68cb4deb9b3f82a55')
package() {
	cd "rofmoji"
	mkdir -p "$pkgdir/usr/bin"
	cp rofmoji "$pkgdir/usr/bin/"

        mkdir -p "$pkgdir/usr/share/rofmoji"
        cp emoji-list "$pkgdir/usr/share/rofmoji/"
}

