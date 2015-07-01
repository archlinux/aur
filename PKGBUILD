# Maintainer: Mike Redd <mredd -at- zerotuezero dot com>
# Contributor: Mike Redd <mredd -at- zerotuezero dot com>

pkgname=fortune-mod-iasip
_pkgname=iasip
pkgver=1
pkgrel=2
pkgdesc="It's Always Sunny In Philadelphia fortune cookie file"
url="http://dl.dropbox.com"
arch=('any')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source=($_pkgname)
md5sums=('8edff282ff81cbaa24363c0ea353f624')

build() {
  cd "$srcdir"
  strfile $_pkgname $_pkgname.dat
}

package () {
  install -D -m644 $_pkgname $pkgdir/usr/share/fortune/$_pkgname
  install -D -m644 $_pkgname.dat $pkgdir/usr/share/fortune/$_pkgname.dat
}
