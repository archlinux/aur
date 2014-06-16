# Contributor: nbags <neilbags@gmail.com>
# Maintainer: Olivier Mehani <shtrom-arch@ssji.net>:
pkgname=fortune-mod-chucknorris
pkgver=1
pkgrel=3
pkgdesc="Fortune cookies: Chuck Norris facts."
arch=(any)
license=(gpl)
depends=(fortune-mod)
makedepends=(coreutils)
source="http://www.k-lug.org/~kessler/chucknorris.tar.gz"
url="http://www.k-lug.org/~kessler/projects.html"
md5sums=(fa85d9f2062712b2431c9d42780265fd)

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/share/fortune
  fold -w 80 -s fortune-chucknorris/chucknorris > \
  	$startdir/pkg/usr/share/fortune/chucknorris || exit 1
  strfile $startdir/pkg/usr/share/fortune/chucknorris || exit 2
}
