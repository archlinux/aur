# Maintainer: John Ackerman <afuturepilotis at gmail dot com>
# Contributor: Valerio Pizzi <pival81@yahoo.com>

pkgname=vivacious-colors-gtk-theme
pkgver=16.04.3
pkgrel=1
pkgdesc="Vivacious Colors GTK Theme by the RAVEfinity Open Design Team. Features a clean, vibrant and customizable look in 4 Styles. Light, Dark, Blackout, Fusion (Hybrid). Every style comes in 13 vivid colors. In Regular & Pro Versions."
arch=('any')
url="http://www.ravefinity.com/p/vivacious-colors-gtk-theme.html"
license=('GPL2')
options=('!strip' '!zipman')
url="https://aur.archlinux.org/packages/vivacious-colors-gtk-theme/"
depends=('gtk3>=3.16' 'gtk<3.20' 'gtk-engine-murrine')
optdepends=('vivacious-colors')
source=("$pkgname-$pkgver.tar.gz::https://googledrive.com/host/0B7iDWdwgu9QARTktREI0bWVTbzg")
md5sums=('0080cfc469d499947a48f1d53f0a6a4c')

package() {
  	mkdir -p "$pkgdir/usr/share/themes/"
	cd "$srcdir/"
	cp -r Vivacious-* "$pkgdir/usr/share/themes/"
}
