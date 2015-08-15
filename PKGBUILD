# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=acestream-proxy-player
pkgver=0.1.0
pkgrel=1
pkgdesc="AceProxy Player allows you to open Ace Stream links with VLC Media Player"
arch=('any')
url="https://github.com/jonian/acestream-proxy-player"
license=('GPL')
groups=()
depends=('acestream-proxy' 'vlc')
makedepends=()
optdepends=()
provides=('acestream-proxy-player')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/jonian/acestream-proxy-player/archive/v$pkgver.tar.gz)
noextract=()
md5sums=('SKIP')

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"

  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/aceproxy-player"

  ln -s "/opt/aceproxy-player/aceproxy-player.py" "$pkgdir/usr/bin/aceproxy-player"
  mv "$pkgdir/opt/aceproxy-player/aceproxy-player.desktop" "$pkgdir/usr/share/applications/aceproxy-player.desktop"
}
