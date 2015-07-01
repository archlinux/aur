# Maintainer: Mike Redd <mredd -a.t- 0tue0.com>
# Contributor: Mike Redd <mredd -a.t- 0tue0.com>

pkgname=fortune-mod-entourage-ari_gold
_pkgname=entourage-ari
pkgver=1
pkgrel=2
pkgdesc="Ari Gold (Entourage) [HBO] fortune cookie file"
url="http://www.arigoldquotes.com"
arch=('any')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source=('entourage-ari')
md5sums=('c810f6bcead74d23e43236cc50c05841')

build() {
  cd "$srcdir"
  strfile $_pkgname $_pkgname.dat
}

package () {
  install -D -m644 $_pkgname $pkgdir/usr/share/fortune/$_pkgname
  install -D -m644 $_pkgname.dat $pkgdir/usr/share/fortune/$_pkgname.dat
}
