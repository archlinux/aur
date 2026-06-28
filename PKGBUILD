pkgname=agentop-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Terminal dashboard for AI coding assistant sessions — token usage, cost, and cache efficiency"
arch=('x86_64' 'aarch64')
url="https://github.com/mohitmishra786/agentop"
license=('MIT')
provides=('agentop')
conflicts=('agentop')

source_x86_64=("agentop-${pkgver}-x86_64.tar.gz::https://github.com/mohitmishra786/agentop/releases/download/v${pkgver}/agentop_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("agentop-${pkgver}-aarch64.tar.gz::https://github.com/mohitmishra786/agentop/releases/download/v${pkgver}/agentop_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('1940698322c8401c19260e08311751a385417319e90676ade9021f1a6b3386a3')
sha256sums_aarch64=('67a0d1d744909b8a726b7c44c46f3f88ec918d2ca45a0d3994283a0b5eda6ac7')

package() {
  install -Dm755 agentop "$pkgdir/usr/bin/agentop"
  install -Dm644 agentop.1 "$pkgdir/usr/share/man/man1/agentop.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
