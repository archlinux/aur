# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>

pkgname=fortune-mod-entourage
_pkgname=entourage
pkgver=1
pkgrel=3
pkgdesc="Entourage [HBO] fortune cookie file"
url="http://en.wikiquote.org/wiki/Entourage_(TV_series)"
arch=('any')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source=('entourage')
md5sums=('886cb621f3235b5e79a2bb8a4c4c3add')

build() {
  cd "$srcdir"
  strfile $_pkgname $_pkgname.dat
}

package () {
  install -D -m644 $_pkgname $pkgdir/usr/share/fortune/$_pkgname
  install -D -m644 $_pkgname.dat $pkgdir/usr/share/fortune/$_pkgname.dat
}
