pkgname=contextlite
pkgver=3.0.0
pkgrel=1
pkgdesc="Ultra-fast context engine for retrieval and AI applications"
arch=('x86_64')
url="https://contextlite.com"
license=('MIT')
depends=()
source=("https://github.com/Michael-A-Kuykendall/contextlite/releases/download/v${pkgver}/contextlite-${pkgver}-linux-amd64.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/contextlite" "${pkgdir}/usr/bin/contextlite"
}
