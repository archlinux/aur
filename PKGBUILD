# Maintainer: Carp carpetbags@danwin1210.de
pkgname="tccalc"
pkgver=1.0
pkgrel=1
pkgdesc="A simple chemical thermodynamics calculator."
arch=('any')
url="https://gitlab.com/calcs1/tccalc"
license=('ISC')
depends=('bash' 'coreutils' 'sed' 'bc' 'man')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/calcs1/tccalc/-/raw/main/src/$pkgname-$pkgver.tar.gz")
sha256sums=('89e81a27144560499f5f46e1dc9795c40cf7a040309b12d20314634d2fe957db')


package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./tccalc "$pkgdir/usr/bin/tccalc"
	install -Dm644 ./chm1 "$pkgdir/usr/share/tccalc/chm1"
	install -Dm644 ./chmtables "$pkgdir/usr/share/tccalc/chmtables"
	install -Dm644 ./tccalc.1.gz "$pkgdir/usr/share/man/man1/tccalc.1.gz"
}
