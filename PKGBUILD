# Maintainer: Edward Springer <ehs0329 AT gmail DOT com>

pkgname=umpv
_srcname=mpv
pkgver=0.38.0
pkgrel=1
pkgdesc="mpv script that emulates \"unique application\" functionality on Linux"
arch=('any')
url="https://github.com/mpv-player/mpv"
license=('GPL')
depends=('mpv' 'python')
optdepends=('youtube-dl')
conflicts=('mpv-tools')
source=("$_srcname-$pkgver.tar.gz::https://github.com/mpv-player/$_srcname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('86d9ef40b6058732f67b46d0bbda24a074fae860b3eaae05bab3145041303066')

package() {
  cd "$_srcname-$pkgver/TOOLS"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
