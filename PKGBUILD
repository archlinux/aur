# Maintainer: René Wagner <rwagner at rw-net dot de>
pkgname=astro
pkgver=0.23.0
pkgrel=1
pkgdesc="A Gemini web browser using shell script"
arch=('any')
url="https://github.com/blmayer/astro"
license=('MIT')
depends=('sed' 'less' 'openssl' 'coreutils')
source=("https://github.com/blmayer/astro/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7b8264ea0df5dad570d1c2b53f64c528591cb552c1a97d37ff53aa358b8ec5da')

package() {
	mkdir -p "$pkgdir/usr/bin/"
	cd "$srcdir/${pkgname}-${pkgver}"
	make PREFIX="$pkgdir/usr" LICENSEDIR="$pkgdir/usr/share/licenses/astro" install
}
