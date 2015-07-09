# Maintainer: Aaron P <aaronbpaden@gmail.com>
# Contributer: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-condition-utils
_pkgname=condition-utils
pkgver=1.1.1
pkgrel=1
pkgdesc="Chicken Scheme Egg: SRFI 12 Condition Utilities"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/condition-utils"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-check-errors>=1.12.0' )

build() {
	cd "$srcdir/"
	chicken-install -r "${_pkgname}":"${pkgver}"
}

package() {
	cd "$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
