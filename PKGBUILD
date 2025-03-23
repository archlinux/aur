# Maintainer: SelfRef <arch@selfref.dev>

_basename=gnome-shell-extension-pano
pkgname=${_basename}-bin
pkgver=23.alpha4
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
sha256sums=('786c6d729cd1954bc3c18ef57aff3f95d167b0dee0475c4c709fb75a912a60ca')

package() {
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/pano@elhan.io"
	cp -r * "$pkgdir/usr/share/gnome-shell/extensions/pano@elhan.io/"
}
