# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Timo Schwichtenberg <therealbassx at yahoo dot de>
# Contributor: Link Dupont <link@fastmail.com>
pkgname=system76-wallpapers
pkgver=18.04.2~1714172930~24.04~ff1e25c
pkgrel=2
pkgdesc="A collection of System76 Wallpapers"
arch=('any')
url="https://github.com/pop-os/system76-wallpapers"
license=('LGPL-2.0-or-later')
options=('!strip')
source=("https://launchpad.net/~system76-dev/+archive/ubuntu/stable/+sourcefiles/$pkgname/$pkgver~dev/${pkgname}_${pkgver}~dev.tar.xz")
sha256sums=('50ab4160dd63ff88d5d5b9354e19e070445d37e04b04771d79cb368cc79e8949')

package() {
  install -Dm644 archive/backgrounds/* -t "$pkgdir/usr/share/backgrounds/"
  install -Dm644 "archive/$pkgname.xml" -t "$pkgdir/usr/share/gnome-background-properties/"
}
