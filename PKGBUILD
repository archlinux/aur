# Maintainer: René Wagner <rwagner at rw-net dot de>
pkgname=astro
pkgver=0.13.0
pkgrel=1
pkgdesc="A Gemini web browser using shell script"
arch=('any')
url="https://github.com/blmayer/astro"
license=('MIT')
depends=('sed' 'less' 'openssl')
source=("${pkgname}_src::git+https://github.com/blmayer/astro.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/bin/"
	cd "$srcdir/${pkgname}_src"
	make PREFIX="$pkgdir/usr" install
}
