# Maintainer: Mike Redd <mredd -at- zerotuezero dot com>
# Contributor: Mike Redd <mredd -at- zerotuezero dot com>

pkgname=fortune-mod-peepshow
_pkgname=peepshow
pkgver=1
pkgrel=2
pkgdesc="Peep Show BBC Sitcom fortune cookie file"
url="http://dl.dropbox.com"
arch=('any')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source=($_pkgname)
md5sums=('67bec6c2b5f47b98d767f6e6cabedf87')

build() {
  cd "$srcdir"
  strfile $_pkgname $_pkgname.dat
}

package () {
  install -D -m644 $_pkgname $pkgdir/usr/share/fortune/$_pkgname
  install -D -m644 $_pkgname.dat $pkgdir/usr/share/fortune/$_pkgname.dat
}


