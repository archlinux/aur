# Maintainer: dimtpap <dimtpap@protonmail.com>
pkgname=coppwr-bin
_pkgname=coppwr
pkgver=1.4.0
pkgrel=1
pkgdesc='Low level PipeWire control GUI'
arch=('x86_64')
url='https://dimtpap.ovh/coppwr'
license=('GPL3')
depends=('pipewire')
optdepends=('xdg-desktop-portal: Camera and Screencast XDP support')
provides=('coppwr')
conflicts=('coppwr')
source=("$_pkgname::https://github.com/dimtpap/coppwr/releases/download/$pkgver/coppwr"
        "$_pkgname-$pkgver.tar.gz::https://github.com/dimtpap/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("1ad9a041ebf87c2fc08ca416f18bd540203d5c38860fb083b93049d6cd588576"
            "966bf2b40cb55e3b34275d109c0b029d2570b4ef58ed4e556f9367428ee71177")

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
