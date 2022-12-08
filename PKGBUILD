# Maintainer: Scott Rapson <scott@electricui.com>

pkgname="arc-bin"
pkgver=0.5.7
pkgrel=1
pkgdesc="CLI helper for Electric UI project creation, sandbox development and building releases."
arch=('x86_64')
url="https://electricui.com/"
license=('MIT')
optdepends=('nodejs: Electric UI projects run on node')
provides=('arc')
source=("$pkgname-$pkgver.tar.gz::https://registry.eui.io/arc/${pkgver}/arc_${pkgver}_linux_amd64.tar.gz")
sha256sums=('17ea90f492fe51c5d98b6b62c1d0f8034296789171f99e9710002ad0224ddc28')

package() {
	install -Dm755 "$srcdir"/arc -t "${pkgdir}/usr/bin"
}
