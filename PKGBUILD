pkgname=agentop-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Terminal dashboard for AI coding assistant sessions — token usage, cost, and cache efficiency"
arch=('x86_64' 'aarch64')
url="https://github.com/mohitmishra786/agentop"
license=('MIT')
provides=('agentop')
conflicts=('agentop')

source_x86_64=("agentop-${pkgver}-x86_64.tar.gz::https://github.com/mohitmishra786/agentop/releases/download/v${pkgver}/agentop_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("agentop-${pkgver}-aarch64.tar.gz::https://github.com/mohitmishra786/agentop/releases/download/v${pkgver}/agentop_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('d824156e4757732a59e4b435ec7fbc72dc874851060d89a7d5bcdb103d25626d')
sha256sums_aarch64=('d3402c0df8ac649ae1a94b0e26121a97f37cdb96e1660506d91d89349c16a154')

package() {
  install -Dm755 agentop "$pkgdir/usr/bin/agentop"
  install -Dm644 agentop.1 "$pkgdir/usr/share/man/man1/agentop.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
