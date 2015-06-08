# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=ttf-enochian
pkgver=1.0
pkgrel=1
pkgdesc="A font for the language of both demons and angels."
arch=('any')
url="http://www.fontsaddict.com/font/enochian-plain.html"
license=('freeware')
makedepends=('unzip')
depends=(fontconfig xorg-font-utils)
source=("http://www.fontsaddict.com/download/enochian-plain.ttf")
md5sums=('bec37d31ac381a1ecda9975711503237')
install=$pkgname.install

build() {
	install -Dm644 "$srcdir/enochian-plain.ttf" "$pkgdir/usr/share/fonts/TTF/enochian-plain.ttf"
}

# vim:set ts=2 sw=2 et:
