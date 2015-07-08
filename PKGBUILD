# Maintainer: Aaron P <aaronbpaden@gmail.com>
# Contributer: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-matchable
_pkgname=matchable
pkgver=3.3
pkgrel=2
pkgdesc="Chicken Scheme Egg: Hygienic MATCH replacement"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/matchable"
license=('public')
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
