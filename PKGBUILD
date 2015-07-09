# Maintainer: Aaron P <aaronbpaden@gmail.com>
# Contributer: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-check-errors
_pkgname=check-errors
pkgver=1.13.0
pkgrel=1
pkgdesc="Chicken Scheme Egg: Argument checks & errors"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/check-errors"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper>=1.5.2' )
options=(docs !libtool !emptydirs)

build() {
	cd "$srcdir/"
	chicken-install -r "${_pkgname}":"${pkgver}"
}

package() {
	cd "$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
