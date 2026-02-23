pkgname=bookokrat-bin
pkgver=0.3.6
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
sha256sums=('2529f5eb824f27e01871fa551a2ba7b71971d52c30c4d533c59ec9c4a35e6d83')

package() {
  install -Dm755 bookokrat "${pkgdir}/usr/bin/bookokrat"
}

