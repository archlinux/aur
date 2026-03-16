pkgname=concurrently-bin
pkgver=0.1.1
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
sha256sums=('b3f32509c1f4d3701265eee1ecac6d9a8e7fc3b4814b371adbf73d2fbbb97f6d')

package() {
  install -Dm755 concurrently "${pkgdir}/usr/bin/concurrently"
}
