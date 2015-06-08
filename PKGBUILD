# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=ttf-masterforce-solid
pkgver=1.0
pkgrel=1
pkgdesc="Masterforce Solid font"
arch=('any')
url="http://www.allfreefonts.com/font-4313-masterforce_solid.html"
license=('freeware')
makedepends=('unzip')
depends=(fontconfig xorg-font-utils)
source=("http://www.allfreefonts.com/download-4313-masterforce_solid-font.zip")
md5sums=('9e6b00117aec82dc212ea755ddbb1a96')
install=$pkgname.install

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/fonts/TTF
	chmod -x ./*.TTF
	cp -r ./*.TTF $pkgdir/usr/share/fonts/TTF
}

# vim:set ts=2 sw=2 et: