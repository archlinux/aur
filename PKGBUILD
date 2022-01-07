# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Timo Schwichtenberg <therealbassx at yahoo dot de>
# Contributor: Link Dupont <link@fastmail.com>
pkgname=system76-wallpapers
pkgver=18.04.2~1611351210~21.04~52abc1e~dev
pkgrel=1
pkgdesc="A collection of System76 Wallpapers"
arch=('any')
url="https://github.com/pop-os/system76-wallpapers"
license=('GPL')
source=("https://launchpad.net/~system76-dev/+archive/ubuntu/stable/+sourcefiles/$pkgname/$pkgver/${pkgname}_${pkgver}.tar.xz")
sha256sums=('845c5937adfd4dbe32589a154c7ee33f4b59b4fa3297f2f16d19b4c59f8fb4c4')

package() {
  _commit='52abc1e8996891210beb66ae75796f5986bfea82_hirsute'

  install -Dm644 "$_commit/backgrounds/"* -t "$pkgdir/usr/share/backgrounds"
  install -Dm644 "$_commit/$pkgname.xml" -t "$pkgdir/usr/share/gnome-background-properties"
}
