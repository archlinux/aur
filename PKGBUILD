# Maintainer: ThePilot <afuturepilotis at gmail dot com>
# Contributor: Valerio Pizzi <pival81@yahoo.com>

pkgname=vivacious-colors-gtk-theme
pkgver=16.04.4
pkgrel=1
pkgdesc="Vivacious Colors GTK Theme by the RAVEfinity Open Design Team. Features a clean, vibrant and customizable look in 4 Styles. Light, Dark, Blackout, Fusion (Hybrid). Every style comes in 13 vivid colors. In Regular & Pro Versions."
arch=('any')
url="http://www.ravefinity.com/p/vivacious-colors-gtk-theme.html"
license=('GPL2')
options=('!strip' '!zipman')
depends=('gtk-engine-murrine')
optdepends=('vivacious-colors' 'gtk3>=3.16' 'gtk3<3.20')
source=("$pkgname-$pkgver.tar.gz::https://googledrive.com/host/0B7iDWdwgu9QAMkhfOWh4TUh1RUE")
md5sums=('bebf501111f2394f619d8ce504f49758')

package() {
  	mkdir -p "$pkgdir/usr/share/themes/"
	cd "$srcdir/"
	cp -r Vivacious-* "$pkgdir/usr/share/themes/"
}
