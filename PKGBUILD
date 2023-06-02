# Maintainer: dimtpap <dimtpap@protonmail.com>
pkgname=coppwr-bin
_pkgname=coppwr
pkgver=1.0.0
pkgrel=2
pkgdesc='Low level PipeWire control GUI'
arch=('x86_64')
url='https://dimtpap.xyz/coppwr'
license=('GPL3')
depends=('pipewire')
provides=('coppwr')
conflicts=('coppwr')
source=("$_pkgname::https://github.com/dimtpap/coppwr/releases/download/$pkgver/coppwr"
        "$_pkgname-$pkgver.tar.gz::https://github.com/dimtpap/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("7f895c23ab2ad71158e2216954e892735e2a8d81b06af3511bc55820479ec5a9"
            "032f2355223af4e7e2f383cf2822531d1f4b5a8bad2550a199ba1e444442417a")

package() {
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	cd "$_pkgname-$pkgver"

	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 "assets/xyz.dimtpap.coppwr.desktop" "$pkgdir/usr/share/applications/xyz.dimtpap.coppwr.desktop"
	install -Dm644 "assets/xyz.dimtpap.coppwr.metainfo.xml" "$pkgdir/usr/share/metainfo/xyz.dimtpap.coppwr.metainfo.xml"
	install -Dm644 "assets/icon/scalable.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/xyz.dimtpap.coppwr.svg"
	install -Dm644 "assets/icon/512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/xyz.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/xyz.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/xyz.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/xyz.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/xyz.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/xyz.dimtpap.coppwr.png"
}
