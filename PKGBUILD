pkgname=gutenberg-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="An opinionated static site generator - Precompiled binary from official repository"
arch=('any')
url="https://github.com/Keats/gutenberg"
license=('MIT')
provides=('gutenberg')
conflicts=('gutenberg')

source=("https://github.com/Keats/gutenberg/releases/download/v${pkgver}/${pkgname/-bin}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('5b30ecbca750d3fe9d6acf8fc27273ce93f690c0d118040ca0b6c153b162a06b')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
