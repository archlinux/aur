pkgname=bookokrat-bin
pkgver=0.3.8
pkgrel=1
pkgdesc="Terminal-based EPUB and PDF reader with rich TUI"
arch=('x86_64')
url="https://github.com/bugzmanov/bookokrat"
license=('AGPL-3.0-only')
provides=('bookokrat')
conflicts=('bookokrat')

source=(
  "https://github.com/bugzmanov/bookokrat/releases/download/v${pkgver}/bookokrat-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
)
sha256sums=('750f886280e9eaece124e692dfe75d9ba5977975ab92a46cbea9af82d4d4e93c')

package() {
  install -Dm755 bookokrat "${pkgdir}/usr/bin/bookokrat"
}

