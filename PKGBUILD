# Maintainer: René Wagner <rwagner at rw-net dot de>
pkgname=astro
pkgver=0.25.1
pkgrel=1
pkgdesc="A Gemini web browser using shell script"
arch=('any')
url="https://github.com/blmayer/astro"
license=('MIT')
depends=('sed' 'less' 'openssl' 'coreutils')
source=("https://github.com/blmayer/astro/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('01bc8c76d001ef6bfcae0e3a6eb4dcb13d0b09b83e5145f7f775997a49c8abae')
package() {
	mkdir -p "$pkgdir/usr/bin/"
	cd "$srcdir/${pkgname}-${pkgver}"
	make PREFIX="$pkgdir/usr" LICENSEDIR="$pkgdir/usr/share/licenses/astro" install
}
