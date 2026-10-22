# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=gnome-shell-extension-tophat
pkgname="$_pkgbase-bin"
pkgver=24
pkgrel=1
pkgdesc="View CPU, memory, disk, and network activity in the GNOME top bar."
arch=('any')
url="https://github.com/fflewddur/tophat"
license=('GPL-3.0')
optdepends=('networkmanager: to monitor network devices')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase-v$pkgver.zip::https://github.com/fflewddur/tophat/releases/download/v$pkgver/tophat@fflewddur.github.io.v$pkgver.shell-extension.zip")
sha256sums=('e8dd8937e95928e1f2fbc74a4126ba3bc55a1ed1f86e6736e8013ef9e8ff5384')

package() {
	rm *.zip
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/tophat@fflewddur.github.io"
	cp -r * "$pkgdir/usr/share/gnome-shell/extensions/tophat@fflewddur.github.io/"
}
