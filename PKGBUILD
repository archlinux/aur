# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname="layan-cursor-theme-git"
pkgver=1
pkgrel=1
epoch=1
pkgdesc="A x-cursor theme inspired by layan gtk theme and based on capitaine-cursors"
arch=(
	"any"
)
url="https://github.com/vinceliuice/Layan-cursors"
license=(
	"GPL3"
)
makedepends=(
	"git"
)
provides=(
	"layan-cursor-theme"
)
conflicts=(
	"layan-cursor-theme"
)
source=(
	"git+$url.git"
)
b2sums=(
	"SKIP"
)

package()
{
	install -d "$pkgdir/usr/share/icons"
	
	cd "Layan-cursors" || exit
	cp -r "dist" "$pkgdir/usr/share/icons/Layan-cursors"
	cp -r "dist-border" "$pkgdir/usr/share/icons/Layan-border-cursors"
	cp -r "dist-white" "$pkgdir/usr/share/icons/Layan-white-cursors"
}
