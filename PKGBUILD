# Maintainer: Aaron P <aaronbpaden@gmail.com>
# Contributer: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-miscmacros
_pkgname=miscmacros
pkgver=2.96
pkgrel=1
pkgdesc="Chicken Scheme Egg: Various helper macros"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/miscmacros"
license=('BSD')
depends=('chicken>=4.5.0')
options=(docs !libtool !emptydirs)

build() {
	cd "$srcdir/"
	chicken-install -r "${_pkgname}":"${pkgver}"
}

package() {
	cd "$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
