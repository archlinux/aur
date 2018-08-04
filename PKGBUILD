pkgname=gutenberg-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="An opinionated static site generator - Precompiled binary from official repository"
arch=('any')
url="https://github.com/Keats/gutenberg"
license=('MIT')
provides=('gutenberg')
conflicts=('gutenberg')

source=("https://github.com/Keats/gutenberg/releases/download/v${pkgver}/${pkgname/-bin}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('3ea40f75db8f4660a16913fd3599e0af7f8a15242bfe54864e53e91b6107d4bf')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
