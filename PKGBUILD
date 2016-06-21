# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=ttf-masterforce-solid
pkgver=1.0
pkgrel=2
pkgdesc="Masterforce Solid font"
arch=('any')
url="https://www.searchfreefonts.com/free/masterforce-solid.htm"
license=('freeware')
makedepends=('unzip')
depends=(fontconfig xorg-font-utils)
source=("ttf-masterforce-solid.zip::https://www.searchfreefonts.com/download/download.ashx?d=208751")
install=$pkgname.install

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/fonts/TTF"
	cp ./*.ttf "$pkgdir/usr/share/fonts/TTF"
}

# vim:set ts=2 sw=2 et:
sha256sums=('bf29eb83c3dcb30d87c4fab3ef4f4c8ce1fb1b686d62c5595960b5d001559e97')
