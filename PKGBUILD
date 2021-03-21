# Maintainer: Edward Springer <ehs0329 AT gmail DOT com>

pkgname=umpv
_srcname=mpv
pkgver=0.33.0
pkgrel=1
pkgdesc="mpv script that emulates \"unique application\" functionality on Linux"
arch=('any')
url="https://github.com/mpv-player/mpv"
license=('GPL')
depends=('mpv' 'python')
optdepends=('youtube-dl')
conflicts=('mpv-tools')
source=("$_srcname-$pkgver.tar.gz::https://github.com/mpv-player/$_srcname/archive/v$pkgver.tar.gz")
sha256sums=('f1b9baf5dc2eeaf376597c28a6281facf6ed98ff3d567e3955c95bf2459520b4')

package() {
  cd "$_srcname-$pkgver/TOOLS"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
