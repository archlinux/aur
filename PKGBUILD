pkgname=bookokrat-bin
pkgver=0.3.10
pkgrel=1
pkgdesc="Terminal-based EPUB and PDF reader with rich TUI"
arch=('x86_64')
url="https://github.com/bugzmanov/bookokrat"
license=('AGPL-3.0-only')
provides=('bookokrat')
conflicts=('bookokrat')

source=(
  "https://github.com/bugzmanov/bookokrat/releases/download/v${pkgver}/bookokrat-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('c6eb2e6b96c948f0c7a045771baaad709ecd16cacca7b3da765b8d3b49e3f668')

package() {
  install -Dm755 bookokrat "${pkgdir}/usr/bin/bookokrat"
}

