# Maintainer: Thibault Suzanne <thi [DOT] suzanne [AT] gmail [DOT] com>

pkgname=ttf-inconsolata-hellenic
pkgver=1.17
pkgrel=2
pkgdesc="Monospace font for pretty code listings and for the terminal (augmented with Hellenic glyphs)"
arch=("any")
url="http://www.cosmix.org/software/"
license=("custom:OFL")
depends=("fontconfig" "xorg-font-utils")
makedepends=("unzip")
source=("${url}files/InconsolataHellenic.zip")
md5sums=('ef6725eb45236c1620baba06a25e14d2')
install=${pkgname}.install

package() {
    install -Dm644 $srcdir/InconsolataHellenic.ttf $pkgdir/usr/share/fonts/TTF/ttf-inconsolata-hellenic.ttf
}
