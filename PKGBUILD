# Maintainer: SelfRef <arch@selfref.dev>

_basename=gnome-shell-extension-pano
pkgname=${_basename}-bin
pkgver=23.alpha3
pkgrel=1
pkgdesc="Next-gen Clipboard Manager for Gnome Shell "
arch=('any')
url="https://github.com/oae/gnome-shell-pano"
license=('GPL-2.0')
depends=(
	'gnome-shell>=45'
	'libgda6'
)
provides=("$_basename")
conflicts=("$_basename")
source=("https://github.com/oae/gnome-shell-pano/releases/download/v${pkgver/\./-}/pano@elhan.io.zip")
sha256sums=('ad45f4e567af420ef4e18aa1c04231efa9fcb5a40456586b3faa4f8ec4f4982e')

package() {
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/pano@elhan.io"
	cp -r * "$pkgdir/usr/share/gnome-shell/extensions/pano@elhan.io/"
}