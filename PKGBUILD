# Maintainer: milkii on freenode
pkgname=mpv-autoload
_srcname=mpv
pkgver=0.29.0
pkgrel=2
pkgdesc="Autoload all other media files in directory to mpv playlist."
arch=('any')
url="https://github.com/mpv-player/mpv"
license=('GPL')
depends=('mpv' 'bash')
install=mpv-autoload.install
source=("https://raw.githubusercontent.com/mpv-player/mpv/master/TOOLS/lua/autoload.lua")
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  install -Dm755 "autoload.lua" "$pkgdir/usr/share/mpv/scripts/autoload.lua"
}
