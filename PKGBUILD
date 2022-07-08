# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=ttf-tangiers
pkgver=1.0
pkgrel=1
pkgdesc="A free alternative to the Algerian font"
arch=('any')
url="http://www.fontsner.com/font/Tangiers_Normal-32393.html"
license=('freeware')
depends=(fontconfig xorg-font-utils)
source=("Tangiers_Normal.ttf::https://www.fontsner.com/download/32393-317dc7dcf26bc7975e10e929007332c2.ttf")
install=$pkgname.install

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/fonts/TTF"
	chmod -x ./*.ttf
	cp -Lr ./*.ttf "$pkgdir/usr/share/fonts/TTF"
}

# vim:set ts=2 sw=2 et:
sha256sums=('541153dac413f6081b40fbb6a71cea48db3ecfb2a2aa38297e26dcff983671f4')
