# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=gnome-shell-extension-tophat
pkgname="$_pkgbase-bin"
pkgver=22
pkgrel=1
pkgdesc="View CPU, memory, disk, and network activity in the GNOME top bar."
arch=('any')
url="https://github.com/fflewddur/tophat"
license=('GPL-3.0')
optdepends=('networkmanager: to monitor network devices')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase-v$pkgver.zip::https://github.com/fflewddur/tophat/releases/download/v$pkgver/tophat@fflewddur.github.io.v$pkgver.shell-extension.zip")
sha256sums=('28815e5eaafa8ced369034b2ce42986236f2795bad7739fbed9b1ba6fa9c3590')

package() {
	rm *.zip
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/tophat@fflewddur.github.io"
	cp -r * "$pkgdir/usr/share/gnome-shell/extensions/tophat@fflewddur.github.io/"
}
