# Maintainer: Edward Springer <ehs0329 AT gmail DOT com>

pkgname=umpv
_srcname=mpv
pkgver=0.37.0
pkgrel=1
pkgdesc="mpv script that emulates \"unique application\" functionality on Linux"
arch=('any')
url="https://github.com/mpv-player/mpv"
license=('GPL')
depends=('mpv' 'python')
optdepends=('youtube-dl')
conflicts=('mpv-tools')
source=("$_srcname-$pkgver.tar.gz::https://github.com/mpv-player/$_srcname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1d2d4adbaf048a2fa6ee134575032c4b2dad9a7efafd5b3e69b88db935afaddf')

package() {
  cd "$_srcname-$pkgver/TOOLS"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
