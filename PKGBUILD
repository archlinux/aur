# Maintainer: XDR <xxdr@duck.com>
pkgname="cazic-bin"
pkgver=0.0.7
pkgrel=2
pkgdesc="Another music player created with Tauri!"
arch=('x86_64')
url="https://github.com/XDRwastaken/Cazic"
license=('MIT')

source=(
	"https://github.com/XDRwastaken/Cazic/releases/download/${pkgver}/Cazic_Linux.tar.gz"
	"https://raw.githubusercontent.com/XDRwastaken/Cazic/main/LICENSE"
	"cazic.desktop"
	"https://raw.githubusercontent.com/XDRwastaken/Cazic/8129aae8f796c01abab3efa572cdd3e9f9efddde/icons/32x32.png"
	"https://raw.githubusercontent.com/XDRwastaken/Cazic/8129aae8f796c01abab3efa572cdd3e9f9efddde/icons/128x128.png"
	"https://raw.githubusercontent.com/XDRwastaken/Cazic/8129aae8f796c01abab3efa572cdd3e9f9efddde/icons/256x256.png"
)

sha256sums=(
        '2d04549b7948fd2a70ed1b216cf8019058eff88565bce1919ba3680e37deaf24'
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
	install -Dm644 256x256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/cazic.png"
}
