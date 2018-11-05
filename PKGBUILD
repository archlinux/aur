# Maintainer: Sergey Kasmy <SleeplessSloth79@gmail.com>
pkgname=diskus-bin
_pkgname=diskus
pkgver=0.4.0
pkgrel=1
pkgdesc="A minimal, fast alternative to 'du -sh'"
arch=('x86_64')
url="https://github.com/sharkdp/$_pkgname"
license=('APACHE' 'MIT')
depends=('gcc-libs')
provides=("$_pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
md5sums=('27abb9bfb6dd7c782fcbb95ad7ad9400')

package() {
	cd "$_pkgname-v$pkgver-$arch-unknown-linux-gnu"

	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-APACHE"
	install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-MIT"
}
md5sums=('606fc30ee4d866fd21a6452b43e0a708')
