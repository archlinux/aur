# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_ com>

pkgname=btanks-data
pkgver=0.9.8083
pkgrel=3
pkgdesc="Fast 2d tank arcade game with multiplayer and split-screen modes."
arch=(any)
url="http://btanks.sourceforge.net"
license=('GPL')
depends=()
source=(http://downloads.sourceforge.net/btanks/btanks-$pkgver.tar.bz2)
md5sums=('49cb95c0eec47d3436c4fdf65e7c9d12')

package() {
  cd "$srcdir"/btanks-$pkgver
  mkdir -p "$pkgdir"/usr/share/btanks
  cp -r "$srcdir"/btanks-$pkgver/data "$pkgdir"/usr/share/btanks/data
}
