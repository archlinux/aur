# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=perli
pkgver=0.1.6
pkgrel=1
pkgdesc="Multi-platform Perl REPL"
arch=('any')
url="https://github.com/mklement0/perli"
license=('MIT')
depends=('perl>=5.6.2')
optdepends=('rlwrap: provide command-line editing support')
source=("https://github.com/mklement0/perli/archive/v${pkgver}.tar.gz")
sha256sums=('210be26bdd6f8e84948d3a1366d3908e06c518684714dd99ca343fdca01ae329')

package() {
	cd "$pkgname-$pkgver"
	install -D --mode=755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -D --mode=644 man/"${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"
	install -D --mode=644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
