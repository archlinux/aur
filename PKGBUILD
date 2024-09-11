# Maintainer: DarkToaster <admin@darksys.pw>
pkgname=suyu-bin
pkgver=0.0.4
pkgrel=3
pkgdesc="suyu is a Nintendo Switch emulator, based on yuzu, with additional features. It is written in C++ with portability in mind."
arch=('x86_64')
url="https://git.suyu.dev/suyu/suyu"
license=('GPL3')
depends=(
	"enet"
	"qt5-base"
	"qt5-multimedia"
	)
source=("https://git.darksys.pw/aur/suyu-bin/suyu"
        "suyu.desktop"
        "suyu.png")
sha256sums=('46bbcc6e16262ec32bdad6ccd7deb8d8127ae582b1be9b10cd4313205c9f30e9'
            'SKIP'
            'SKIP')

options=("!strip")

package() {
    install -Dm755 "$srcdir/suyu" "$pkgdir/usr/bin/suyu-bin"
    install -Dm644 "$srcdir/suyu.desktop" "$pkgdir/usr/share/applications/suyu.desktop"
    install -Dm644 "$srcdir/suyu.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/suyu.png"
}
