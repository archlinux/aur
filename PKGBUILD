# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

## GPG keys available at https://github.com/torchedsammy.gpg

pkgname=lua-lunacolors
_pkg="${pkgname#lua-}"
pkgver=0.2.1
pkgrel=1
pkgdesc="ANSI colors library for Hilbish"
arch=('any')
url="https://github.com/rosettea/lunacolors"
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6cc64419c5783d8f91589f69353deec5160d5a6f606f4bbc6258492cc2717642')
# validpgpkeys=('784DF7A14968C5094E16839C904FC49417B44DCD' ## sammy (TorchedSammy)
#               '5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') ## GitHub

package() {
	cd "${_pkg^}-$pkgver"
	install -Dvm644 init.lua -t "$pkgdir/usr/share/hilbish/libs/lunacolors/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
