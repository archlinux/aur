# Maintainer: agony <27015 at riseup dot net>

pkgname=mcp-grafana-bin
pkgver=2.3.0
pkgrel=1
pkgdesc='MCP server for Grafana (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/grafana/mcp-grafana'
license=('Apache-2.0')
provides=("mcp-grafana=${pkgver}")
conflicts=('mcp-grafana')
install=mcp-grafana.install
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("mcp-grafana-${pkgver}-x86_64.tar.gz::${_release}/mcp-grafana_Linux_x86_64.tar.gz")
source_aarch64=("mcp-grafana-${pkgver}-aarch64.tar.gz::${_release}/mcp-grafana_Linux_arm64.tar.gz")
sha256sums_x86_64=('f808ea13d236e549a9fffa14b28398d30b5393623141307c916e26f5e7746671')
sha256sums_aarch64=('33ec8d857df1215bf833e57351990b8654e193a5066350af59735d7d8c040ee9')

package() {
  install -Dm755 mcp-grafana -t "${pkgdir}/usr/bin"
}
