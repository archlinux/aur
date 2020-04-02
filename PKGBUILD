pkgname=zola-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="An opinionated static site generator - Precompiled binary from official repository"
arch=('any')
url="https://github.com/getzola/zola"
license=('MIT')
provides=('zola')
conflicts=('zola')

source=("https://github.com/getzola/zola/releases/download/v${pkgver}/${pkgname/-bin}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('7bce21ad56d0cab213b5b9188076b93d9d130b9b046cd118305dc2b9b43b84b8')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
