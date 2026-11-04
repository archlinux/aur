# Maintainer: agony <27015 at riseup dot net>

pkgname=neo4j-mcp-bin
pkgver=2.1.0
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
sha256sums_x86_64=('08df1b370d0e96a2d30dd1bcfd86f32233165956f0be119140e43d0636650723')
sha256sums_aarch64=('4da528ba2794211a22b15507d1cfadafac3ed601ca8da9b89fd7f9cac226d810')

package() {
  install -Dm755 neo4j-mcp -t "${pkgdir}/usr/bin"
}
