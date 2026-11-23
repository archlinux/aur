# Maintainer: agony <27015 at riseup dot net>

pkgname=neo4j-mcp-bin
pkgver=2.1.2
pkgrel=1
pkgdesc='Neo4j official MCP server (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/neo4j/mcp'
license=('GPL-3.0-only')
provides=("neo4j-mcp=${pkgver}")
conflicts=('neo4j-mcp')
install=neo4j-mcp.install
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("neo4j-mcp-${pkgver}-x86_64.tar.gz::${_release}/neo4j-mcp_Linux_x86_64.tar.gz")
source_aarch64=("neo4j-mcp-${pkgver}-aarch64.tar.gz::${_release}/neo4j-mcp_Linux_arm64.tar.gz")
sha256sums_x86_64=('965064c1043c01f3dc05545de43b6af40e62651d1e5679f0863cee170db61fe5')
sha256sums_aarch64=('a737e42b95054440363b4c690f48ba49ca974f8b3fbd93bfe10695a57571c709')

package() {
  install -Dm755 neo4j-mcp -t "${pkgdir}/usr/bin"
}
