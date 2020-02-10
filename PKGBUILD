# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: liberodark

pkgname=frostwire
pkgver=6.8.4
_pkgver=292
pkgrel=1
pkgdesc="FrostWire is a free and easy Downloader, BitTorrent Client and Media Player"
arch=('x86_64')
url="http://www.frostwire.com"
license=('custom')
depends=('xdg-utils' 'jre10-openjdk')
optdepends=('mplayer')
source_x86_64=("https://github.com/frostwire/frostwire/releases/download/frostwire-desktop-6.8.4-build-$_pkgver/frostwire-$pkgver.amd64.tar.gz")
source=($pkgname.desktop
        $pkgname.png)
 
package() {
  cd $srcdir
  mkdir -p "$pkgdir/usr/bin/frostwire/"
  cp -r "frostwire-${pkgver}.amd64/." "$pkgdir/usr/bin/frostwire/"
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
sha256sums=('1a4b90abc9315c1bf7c59bf7b46825d45203b5fa1bb95c1cd62fb417513b0551'
            '905dae96dfad2851653cb30e7718524ce2609be703ed1f7a5cd5bdac37233604')
sha256sums_x86_64=('ff83c49c84b898af41141d073b2652c8f1aa93ecf5624da44e0bc6204cc940e3')
