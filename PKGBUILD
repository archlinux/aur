# Maintainer: Guru <anjanaya@gmail.com>
pkgname=forgejo-mcp-bin
pkgver=2.29.0
pkgrel=1
pkgdesc="MCP server for Forgejo integration with AI assistants like Claude, the binary package"
arch=('x86_64')
url="https://codeberg.org/goern/forgejo-mcp"
license=('MIT')
provides=('forgejo-mcp')
conflicts=('forgejo-mcp')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/goern/forgejo-mcp/releases/download/v${pkgver}/forgejo-mcp_${pkgver}_linux_amd64.tar.gz")
sha256sums=('b7bfe43cbddacd2e9dc3ad07f2ad03b8c5218286bbd3a9e5320b8cbacbfef428')

package() {
    cd "forgejo-mcp_${pkgver}_linux_amd64"
    install -Dm755 forgejo-mcp "${pkgdir}/usr/bin/forgejo-mcp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
