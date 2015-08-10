# Maintainer: Benjamin James <benjamin-james@utulsa.edu>:

pkgname=fortune-mod-darkknight
pkgver=20091218
pkgrel=3
pkgdesc="Fortune cookies: The Dark Knight (Movie)."
arch=('any')
license=('custom')
depends=(fortune-mod)
url="http://www.moviequotedb.com/movies/dark-knight-the.html"

source=('darkknight')
sha256sums=('44115c90ef33698d3761dd0180f9d370bd92d2e3ec635ed3ce771657dae7babe')

build() {
	strfile ${srcdir}/darkknight ${srcdir}/darkknight.dat
}

package() {
	  install -D -m644 ${srcdir}/darkknight ${pkgdir}/usr/share/fortune/darkknight
	  install -D -m644 ${srcdir}/darkknight.dat ${pkgdir}/usr/share/fortune/darkknight.dat
}
