# Maintainer: Sergey Kasmy <SleeplessSloth79@gmail.com>
pkgname=du-dup-bin
_pkgname=dup
pkgver=0.2.0
pkgrel=1
pkgdesc="A minimal, fast alternative to 'du -sh'"
arch=('x86_64')
url="https://github.com/sharkdp/dup"
license=('APACHE' 'MIT')
provides=('dup')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
md5sums=("d1807140da1c71a767e7cf1c8cf2bdcb")

package() {
	cd "$_pkgname-v$pkgver-$arch-unknown-linux-gnu"

	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-APACHE"
	install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-MIT"
}
