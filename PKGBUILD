# Maintainer: Edward Springer <ehs0329 AT gmail DOT com>

pkgname=umpv
_srcname=mpv
pkgver=0.34.1
pkgrel=1
pkgdesc="mpv script that emulates \"unique application\" functionality on Linux"
arch=('any')
url="https://github.com/mpv-player/mpv"
license=('GPL')
depends=('mpv' 'python')
optdepends=('youtube-dl')
conflicts=('mpv-tools')
source=("$_srcname-$pkgver.tar.gz::https://github.com/mpv-player/$_srcname/archive/v$pkgver.tar.gz")
sha256sums=('32ded8c13b6398310fa27767378193dc1db6d78b006b70dbcbd3123a1445e746')

package() {
  cd "$_srcname-$pkgver/TOOLS"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
