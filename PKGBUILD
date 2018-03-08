pkgname=gutenberg-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="An opinionated static site generator - Precompiled binary from official repository"
arch=('any')
url="https://github.com/Keats/gutenberg"
license=('MIT')
provides=('gutenberg')
conflicts=('gutenberg')

source=("https://github.com/Keats/gutenberg/releases/download/v${pkgver}/${pkgname/-bin}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('4afc2d7487f1d3cb6ccbcae198512412903adc7da137ca54cf47326ff5e311ce')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
