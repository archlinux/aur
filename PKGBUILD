# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Maintainer: perlawk

pkgname=chicken-setup-helper
_pkgname=setup-helper
pkgver=1.5.5
pkgrel=1
pkgdesc="Chicken Scheme Egg: Installation/Setup Shortcut Routines"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/setup-helper"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)

build() {
	cd "$srcdir/"
	chicken-install -r "$_pkgname"
}

package() {
	cd "$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
