# Maintainer: René Wagner <rwagner at rw-net dot de>
pkgname=ereandel
pkgver=0.26.1
pkgrel=2
pkgdesc="A Gemini web browser using shell script"
arch=('any')
url="https://github.com/blmayer/ereandel"
license=('MIT')
depends=('sed' 'grep' 'openssl' 'coreutils')
source=("https://github.com/blmayer/ereandel/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('78bf4f35500ae9b1bc75ee22174cbdf2ff15eb694d9b46b9d3926ac943786201')
package() {
	mkdir -p "$pkgdir/usr/bin/"
	cd "$srcdir/${pkgname}-${pkgver}"
	make PREFIX="$pkgdir/usr" LICENSEDIR="$pkgdir/usr/share/licenses/${pkgname}" install
}
