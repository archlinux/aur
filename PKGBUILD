# Maintainer: Jaco Malan <jacom@codelog.co.za>
pkgbase=strain
pkgname=strain
pkgver=0.0.2
pkgrel=1
pkgdesc="A CPU stressing utility written in Rust"
arch=('x86_64')
url="https://github.com/JacoMalan1/strain"
license=('MIT')
provides=('strain')
conflicts=('strain')
source=("https://github.com/JacoMalan1/$pkgbase/releases/download/$pkgver/$pkgbase")
sha256sums=('fdfef8b605c975a45ac8d9243deccb4a373c7b225d1e5f03613ecf903ed06cc3')

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "./$pkgbase" "$pkgdir/usr/bin"
	chmod +x "$pkgdir/usr/bin/$pkgbase"
}
