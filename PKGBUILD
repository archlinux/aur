pkgname=bookokrat-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Terminal-based EPUB reader with rich TUI"
arch=('x86_64')
url="https://github.com/bugzmanov/bookokrat"
license=('MIT')
provides=('bookokrat')
conflicts=('bookokrat')

source=(
  "https://github.com/bugzmanov/bookokrat/releases/download/v${pkgver}/bookokrat-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
)
sha256sums=('89816e729881dfa7ee2d7d34c4890737955d052b5f09f0a5cf00f890d787322f')

package() {
  install -Dm755 bookokrat "${pkgdir}/usr/bin/bookokrat"
}

