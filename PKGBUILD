# Maintainer: Guru <anjanaya@gmail.com>
pkgname=forgejo-mcp-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="MCP server for Forgejo integration with AI assistants like Claude, the binary package"
arch=('x86_64' 'aarch64')
url="https://git.b4mad.industries/agentic-forges/forgejo-mcp"
license=('MIT')
provides=('forgejo-mcp')
conflicts=('forgejo-mcp')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://git.b4mad.industries/agentic-forges/forgejo-mcp/releases/download/v${pkgver}/forgejo-mcp_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://git.b4mad.industries/agentic-forges/forgejo-mcp/releases/download/v${pkgver}/forgejo-mcp_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('bf8f744d53dd06c0e7830ee13a0507464b3ab301fcf01de4744db03d770039df')
sha256sums_aarch64=('b434a5874afe87bfe2e985d563b0cdbf029530aa5cfac85f2bf80be145c90d0a')

package() {
    cd "forgejo-mcp_${pkgver}_linux_amd64"
    install -Dm755 forgejo-mcp "${pkgdir}/usr/bin/forgejo-mcp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}