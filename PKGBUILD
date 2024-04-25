# Maintainer: Rsplwe <i@rsplwe.com>

pkgname=snipaste
pkgver=2.9_Beta
pkgrel=1
pkgdesc="Snip & Paste!"
arch=('x86_64')
url="https://www.snipaste.com"
license=('custom')

depends=(fuse2)
makedepends=()
options=(!strip)

source_x86_64=(
	"Snipaste.AppImage::https://download.snipaste.com/archives/Snipaste-2.9-Beta-x86_64.AppImage"
	"Snipaste.desktop"
	"Snipaste.png"
	"Snipaste"
)
sha256sums_x86_64=(
	"6c67c965a3860f8747182325b534c4420b54e63fad5315bed12531f845810d43"
	"817acbb77d33b11767d4064171aa246b5b7d32723529e6cb9207db666ce6d77d"
    "d48295bddc8dfc7108e281950d21b76224772c9406ccee4028350f96d3facc4a"
	"a7b331657c84957fa0f1c1979549071e9f9a00c1c9ee577fd26fbebec83708c9"
)

package() {
	cd "$srcdir"

	install -Dm755 -t "$pkgdir/opt/snipaste" Snipaste.AppImage
	install -Dm755 -t "$pkgdir/usr/bin" Snipaste
	install -Dm644 -t "$pkgdir/usr/share/pixmaps" Snipaste.png
	install -Dm644 -t "$pkgdir/usr/share/applications" Snipaste.desktop
}
