pkgname=gutenberg-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="An opinionated static site generator - Precompiled binary from official repository"
arch=('any')
url="https://github.com/Keats/gutenberg"
license=('MIT')
provides=('gutenberg')
conflicts=('gutenberg')

source=("https://github.com/Keats/gutenberg/releases/download/v${pkgver}/${pkgname/-bin}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('e41e65cd182dfce0aa77afe77c88f162839b9dfb527274476e2f9de3256bcc40')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
