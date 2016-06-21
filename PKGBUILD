# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=ttf-dasroy
pkgver=1.0
pkgrel=1
pkgdesc="A titling font by Fabio Corubolo"
arch=('any')
url="http://www.fontineed.com/font/DasRoy_Small_Caps"
license=('freeware')
makedepends=('unzip')
depends=(fontconfig xorg-font-utils)
source=("http://www.fontineed.com/downloads/DasRoy_Small_Caps.zip")
noextract=("DasRoy_Small_Caps.zip")
md5sums=('4c2f2807db71a554471d627d8f963a3b')
install=$pkgname.install

package() {
	cd "$srcdir"
	unzip "${noextract[0]}"
	mkdir -p "$pkgdir/usr/share/fonts/TTF"
	chmod -x ./*.ttf
	cp -r ./*.ttf "$pkgdir/usr/share/fonts/TTF"
}

# vim:set ts=2 sw=2 et:
