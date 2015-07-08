# Maintainer: Aaron P <aaronbpaden@gmail.com>
# Contributer: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-easyffi
_pkgname=easyffi
pkgver=1.99.7
pkgrel=2
pkgdesc="Chicken Scheme Egg: Generates bindings from C/C++ declarations"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/easyffi"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-silex' 'chicken-matchable')
options=(docs !libtool !emptydirs)

build() {
	cd "$srcdir/"
	chicken-install -r "${_pkgname}":"${pkgver}"
}

package() {
	cd "$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
