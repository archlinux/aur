# Maintainer: dimtpap <dimtpap@protonmail.com>
pkgname=coppwr-bin
_pkgname=coppwr
pkgver=1.6.0
pkgrel=2
pkgdesc='Low level PipeWire control GUI'
arch=('x86_64')
url='https://dimtpap.ovh/coppwr'
license=('GPL3')
depends=('pipewire' 'libxkbcommon' 'libxkbcommon-x11')
optdepends=('xdg-desktop-portal: Camera and Screencast XDP support')
provides=('coppwr')
conflicts=('coppwr')
source=("$_pkgname::https://github.com/dimtpap/coppwr/releases/download/$pkgver/coppwr"
        "$_pkgname-$pkgver.tar.gz::https://github.com/dimtpap/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("a6eee2bb28d799fc08ac038dd72e86424f0e5bd8a503306fb8d9a706996853fe"
            "b6ed84f3313a0a0a76d0303605d1ed55aa4ea94adb713f810680c7bde0637a8e")

package() {
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	cd "$_pkgname-$pkgver"

	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 "assets/io.github.dimtpap.coppwr.desktop" "$pkgdir/usr/share/applications/io.github.dimtpap.coppwr.desktop"
	install -Dm644 "assets/io.github.dimtpap.coppwr.metainfo.xml" "$pkgdir/usr/share/metainfo/io.github.dimtpap.coppwr.metainfo.xml"
	install -Dm644 "assets/icon/scalable.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.dimtpap.coppwr.svg"
	install -Dm644 "assets/icon/512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/io.github.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/io.github.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/io.github.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/io.github.dimtpap.coppwr.png"
}
