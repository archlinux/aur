# Maintainer: Guru <anjanaya@gmail.com>
pkgname=forgejo-mcp-bin
pkgver=2.11.0
pkgrel=1
pkgdesc="MCP server for Forgejo integration with AI assistants like Claude, the binary package"
arch=('x86_64')
url="https://codeberg.org/goern/forgejo-mcp"
license=('MIT')
provides=('forgejo-mcp')
conflicts=('forgejo-mcp')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/goern/forgejo-mcp/releases/download/v${pkgver}/forgejo-mcp_${pkgver}_linux_amd64.tar.gz")
sha256sums=('07c7728e39e65da6646f8816d2a1f080c31a389bb0a7f2744658438cf022690f')

package() {
    cd "forgejo-mcp_${pkgver}_linux_amd64"
    install -Dm755 forgejo-mcp "${pkgdir}/usr/bin/forgejo-mcp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
