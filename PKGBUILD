pkgname=gutenberg-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="An opinionated static site generator - Precompiled binary from official repository"
arch=('any')
url="https://github.com/Keats/gutenberg"
license=('MIT')
provides=('gutenberg')
conflicts=('gutenberg')

source=("https://github.com/Keats/gutenberg/releases/download/v${pkgver}/${pkgname/-bin}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('29a5e0c0d17bcc9d5396b74b2efe31a16a36b0793b5f4522ea8ee94386446d92')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
