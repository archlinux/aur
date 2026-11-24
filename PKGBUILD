# Maintainer: agony <27015 at riseup dot net>

pkgname=mcp-grafana-bin
pkgver=2.4.0
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
sha256sums_x86_64=('6758ec29de0c300f662a4c74682048e7ab34722515296095928dd0d9c9bfc01f')
sha256sums_aarch64=('94923a8d83c373f62117a430d372433cd2c92da99587657d7520e4c627e4dba3')

package() {
  install -Dm755 mcp-grafana -t "${pkgdir}/usr/bin"
}
