pkgname=zola-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="An opinionated static site generator - Precompiled binary from official repository"
arch=('any')
url="https://github.com/getzola/zola"
license=('MIT')
provides=('zola')
conflicts=('zola')

source=("https://github.com/getzola/zola/releases/download/v${pkgver}/${pkgname/-bin}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('8afe40edff5e995afdc132e02442d24eb633ef4b6e81913d69cf97f17905b9c3')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
