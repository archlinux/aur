# Maintainer: XandrCopyrighted (or xxandr, XDR) <xxandrr@proton.me>

pkgname="cazic-bin"
pkgver=0.0.6
pkgrel=1
pkgdesc="Another music player created with Tauri!"
arch=('any')
url="https://github.com/XandrCopyrighted/Cazic/"
license=('MIT')

source=(
	"https://github.com/XandrCopyrighted/Cazic/releases/download/0.0.6/cazic.tar.gz"
	"https://raw.githubusercontent.com/XandrCopyrighted/Cazic/main/LICENSE"
	"cazic.desktop"
	"https://raw.githubusercontent.com/XandrCopyrighted/Cazic/main/assets/app-icon/32x32.png"
	"https://raw.githubusercontent.com/XandrCopyrighted/Cazic/main/assets/app-icon/128x128.png"
	"https://raw.githubusercontent.com/XandrCopyrighted/Cazic/main/assets/app-icon/128x128%402x.png"
)

sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

depends=(
	"gst-plugins-good"
	"webkit2gtk"
)

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cazic/LICENSE"
	install -Dm755 cazic "$pkgdir/usr/bin/cazic"
	install -Dm644 cazic.desktop "$pkgdir/usr/share/applications/cazic.desktop"
	install -Dm644 32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/cazic.png"
	install -Dm644 128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/cazic.png"
	install -Dm644 128x128%402x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/cazic.png"
}
