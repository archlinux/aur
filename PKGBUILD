pkgname=concurrently-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Parallel Claude Code agent TUI — spawn multiple agents, chat with all of them at once"
arch=('x86_64')
url="https://github.com/brianmatzelle/concurrently"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
provides=('concurrently')
conflicts=('concurrently')

source=(
  "https://github.com/brianmatzelle/concurrently/releases/download/v${pkgver}/concurrently-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('071ce7129d3f0787de1fd563dc2a44bf8303e8c990b9e4b3ec1f2981fd90d1ce')

package() {
  install -Dm755 concurrently "${pkgdir}/usr/bin/concurrently"
}
