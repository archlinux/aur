# Maintainer: Guru <anjanaya@gmail.com>
pkgname=forgejo-mcp-bin
pkgver=2.17.0
pkgrel=1
pkgdesc="MCP server for Forgejo integration with AI assistants like Claude, the binary package"
arch=('x86_64')
url="https://codeberg.org/goern/forgejo-mcp"
license=('MIT')
provides=('forgejo-mcp')
conflicts=('forgejo-mcp')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/goern/forgejo-mcp/releases/download/v${pkgver}/forgejo-mcp_${pkgver}_linux_amd64.tar.gz")
sha256sums=('effc1fc0e41f18443a051ccce9be4d295e1cc8798d62ef739eb009df00393108')

package() {
    cd "forgejo-mcp_${pkgver}_linux_amd64"
    install -Dm755 forgejo-mcp "${pkgdir}/usr/bin/forgejo-mcp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
