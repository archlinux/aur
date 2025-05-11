# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_ com>

pkgname=btanks-data
pkgver=0.9.8083
pkgrel=4
pkgdesc="Fast 2d tank arcade game with multiplayer and split-screen modes (data)."
arch=(any)
url="https://btanks.sourceforge.net"
license=('GPL-2.0-only')
depends=()
source=("https://downloads.sourceforge.net/btanks/btanks-$pkgver.tar.bz2")
sha256sums=('3fd2ce6a2b45f7a60c3b114fa9aff13cb3dd9fbb6a65cdc9798b76c4fa2c4341')

package() {
  cd "$srcdir"/btanks-$pkgver
  mkdir -p "$pkgdir"/usr/share/games/btanks
  cp -r "$srcdir"/btanks-$pkgver/data "$pkgdir"/usr/share/games/btanks/data
}
