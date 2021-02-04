# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Timo Schwichtenberg <therealbassx at yahoo dot de>
# Contributor: Link Dupont <link@fastmail.com>
pkgname=system76-wallpapers
pkgver=18.04.2~1611351210~20.04~52abc1e~dev
pkgrel=1
pkgdesc="A collection of System76 Wallpapers"
arch=('any')
url="https://github.com/pop-os/system76-wallpapers"
license=('GPL')
source=("https://launchpad.net/~system76-dev/+archive/ubuntu/stable/+sourcefiles/$pkgname/$pkgver/${pkgname}_${pkgver}.tar.xz")
sha256sums=('7944886badd733568b2d09c925e3a9c84d45372e8209068d2fed7fbc340bc1c2')

package() {
	_commit='52abc1e8996891210beb66ae75796f5986bfea82_focal'

	install -d "$pkgdir/usr/share/backgrounds"
	install -Dm644 "$_commit/backgrounds/"* "$pkgdir/usr/share/backgrounds"
	install -Dm644 "$_commit/$pkgname.xml" -t "$pkgdir/usr/share/gnome-background-properties"
}
