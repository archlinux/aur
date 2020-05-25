# Maintainer: danb <danielbusch1992@googlemail.com>

pkgname=makefontpkg
pkgver=20200526
pkgrel=1
pkgdesc="Tool for creating packages from TrueType and OpenType fonts"
arch=(x86_64 i686)
url='http://github.com/misterdanb/makefontpkg'
license=(Beerware)
depends=(python3 pacman-contrib)
makedepends=(git)
options=('!strip' '!emptydirs')
source=('makefontpkg::git://github.com/misterdanb/makefontpkg.git')
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
