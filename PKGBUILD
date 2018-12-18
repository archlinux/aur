pkgname=zola-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="An opinionated static site generator - Precompiled binary from official repository"
arch=('any')
url="https://github.com/getzola/zola"
license=('MIT')
provides=('zola')
conflicts=('zola')

source=("https://github.com/getzola/zola/releases/download/v${pkgver}/${pkgname/-bin}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('f0c6a433f217d123da7d89b744c0cdf277a3ef5c3973f424c784f33a74c535a9')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
