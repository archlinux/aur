# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=perli
pkgver=0.1.5
pkgrel=1
pkgdesc="Multi-platform Perl REPL"
arch=('x86_64')
url="https://github.com/mklement0/perli"
license=('MIT')
depends=('perl>=5.6.2')
optdepends=('rlwrap: provide command-line editing support')
source=("https://github.com/mklement0/perli/archive/v${pkgver}.tar.gz")
sha256sums=('ff5c6582c2839e230035db07716f5bcaa3725e8520e1f36089664e5d5b1f338b')

package() {
	cd "$pkgname-$pkgver"
	install -D --mode=755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -D --mode=644 man/"${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"
	install -D --mode=644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
