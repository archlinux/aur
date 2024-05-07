# Maintainer: Jaco Malan <jacom@codelog.co.za>
pkgbase=strain
pkgname=strain
pkgver=0.0.1
pkgrel=1
pkgdesc="A CPU stressing utility written in Rust"
arch=('x86_64')
url="https://github.com/JacoMalan1/strain"
license=('MIT')
provides=('strain')
conflicts=('strain')
source=("https://github.com/JacoMalan1/$pkgbase/releases/download/$pkgver/$pkgbase")
sha256sums=('c861270b18c444e205b5b174b89326299a1c510a7890359baf31cd357ff7863e')

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "./$pkgbase" "$pkgdir/usr/bin"
	chmod +x "$pkgdir/usr/bin/$pkgbase"
}
