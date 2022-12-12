# Maintainer: Scott Rapson <scott@electricui.com>

pkgname="arc-bin"
pkgver=0.5.8
pkgrel=1
pkgdesc="CLI helper for Electric UI project creation, sandbox development and building releases."
arch=('x86_64')
url="https://electricui.com/"
license=('custom')
optdepends=('nodejs: Electric UI projects run on node')
provides=('arc')
source=("$pkgname-$pkgver.tar.gz::https://registry.eui.io/arc/${pkgver}/arc_${pkgver}_linux_amd64.tar.gz"
        "LICENSE"
)
sha256sums=('690a3018f4c77e367fd63bcebf3ffac324ca472c80553dde08714a287bf65517'
            '2eb92ca0796a09ccb80ccf5a55c5513bcbd840407da149edcb4a1073db8aa60e'
)

package() {
	install -Dm755 "$srcdir"/arc -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
