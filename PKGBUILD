# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Timo Schwichtenberg <therealbassx at yahoo dot de>
# Contributor: Link Dupont <link@fastmail.com>
pkgname=system76-wallpapers
pkgver=18.04.2~1611351210~23.04~52abc1e
pkgrel=1
pkgdesc="A collection of System76 Wallpapers"
arch=('any')
url="https://github.com/pop-os/system76-wallpapers"
license=('LGPL-2.0-or-later')
source=("https://launchpad.net/~system76-dev/+archive/ubuntu/stable/+sourcefiles/$pkgname/$pkgver~dev/${pkgname}_${pkgver}~dev.tar.xz")
sha256sums=('91b78608a9769fae1d3062805cd73288629b04bf94ec64ba8e4acb35a63591d5')
validpgpkeys=('63C46DF0140D738961429F4E204DD8AEC33A7AFF') # Pop OS (ISO Signing Key) <info@system76.com>

package() {
  install -Dm644 archive/backgrounds/* -t "$pkgdir/usr/share/backgrounds"
  install -Dm644 "archive/$pkgname.xml" -t "$pkgdir/usr/share/gnome-background-properties"
}
