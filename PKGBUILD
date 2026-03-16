pkgname=concurrently-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Concurrent subagent workflow TUI — like Claude Code, but parallel"
arch=('x86_64')
url="https://github.com/brianmatzelle/concurrently"
license=('MIT')
depends=('gcc-libs' 'openssl')
provides=('concurrently')
conflicts=('concurrently')

source=(
  "https://github.com/brianmatzelle/concurrently/releases/download/v${pkgver}/concurrently-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('4797766e56a017e6932fad8a5286abd6c00c56ce5a3c5622b0d790b8e1b57a6e')

package() {
  install -Dm755 concurrently "${pkgdir}/usr/bin/concurrently"
}
