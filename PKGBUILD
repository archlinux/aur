# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=ttf-tangiers
pkgver=1.0
pkgrel=1
pkgdesc="A free alternative to the Algerian font"
arch=('any')
url="http://www.fontsner.com/font/Tangiers_Normal-32393.html"
license=('freeware')
depends=(fontconfig xorg-font-utils)
source=("Tangiers_Normal.ttf::http://www.fontsner.com/download/32393")
md5sums=('27581eea27909741e2411bbf4e26c236')
install=$pkgname.install

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/fonts/TTF"
	chmod -x ./*.ttf
	cp -Lr ./*.ttf "$pkgdir/usr/share/fonts/TTF"
}

# vim:set ts=2 sw=2 et:
