pkgname=bookokrat-bin
pkgver=0.3.7
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
sha256sums=('a78b08b645b324eaecfc0e92ed76ae1e3d783b797f65ebe25d5a9ff6ad6c9df4')

package() {
  install -Dm755 bookokrat "${pkgdir}/usr/bin/bookokrat"
}

