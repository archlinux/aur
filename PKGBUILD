# Maintainer: agony <27015 at riseup dot net>

pkgname=mcp-grafana-bin
pkgver=2.2.0
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
sha256sums_x86_64=('f93bfbd94cde68cc2e43cf5ba55da4f8e28b1a36b14fb14dadd566fc36b1312b')
sha256sums_aarch64=('6478ef322152bf15c0cec565d6bdfa5c3d123e1080aaf03bd370418849267b16')

package() {
  install -Dm755 mcp-grafana -t "${pkgdir}/usr/bin"
}
