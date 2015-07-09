# Maintainer: Aaron P <aaronbpaden@gmail.com>
# Contributer: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-record-variants
_pkgname=record-variants
pkgver=0.5.1
pkgrel=1
pkgdesc="Chicken Scheme Egg: Optimized record access"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/record-variants"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)

build() {
	cd "$srcdir/"
	chicken-install -r "${_pkgname}":"${pkgver}"
}

package() {
	cd "$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
