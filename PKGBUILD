pkgname=zola-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="An opinionated static site generator - Precompiled binary from official repository"
arch=('any')
url="https://github.com/getzola/zola"
license=('MIT')
provides=('zola')
conflicts=('zola')

source=("https://github.com/getzola/zola/releases/download/v${pkgver}/${pkgname/-bin}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a7083afca536d89f4c1da7f2fb0c49cbf04c30384029d2dc46144485b9118c3c')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
