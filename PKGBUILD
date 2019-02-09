# Maintainer: Nathan Monfils <nathan.monfils@hotmail.fr>

pkgname=fortune-mod-portal-game
pkgver=1.0
pkgrel=1
pkgdesc="Portal and Portal 2 fortune cookie file"
url="https://en.wikiquote.org/"
arch=('any')
license=('unknown')
depends=('fortune-mod')
conflicts=('fortune-mod-portal')
groups=('fortune-mods')
source=(portal)
md5sums=('8fa36b14727d84000930069164de5cf5')

build() {
  cd "$srcdir"
  strfile portal portal.dat
}

package () {
  install -D -m644 portal $pkgdir/usr/share/fortune/portal
  install -D -m644 portal.dat $pkgdir/usr/share/fortune/portal.dat
}
