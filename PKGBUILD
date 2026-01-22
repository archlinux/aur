pkgname=bookokrat-bin
pkgver=0.2.2
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
sha256sums=('64abd4a58aed096cc73349da0919da0929658945c0300ac8646709e26fa0ab39')

package() {
  install -Dm755 bookokrat "${pkgdir}/usr/bin/bookokrat"
}

