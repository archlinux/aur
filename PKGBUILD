# Maintainer: Guru <anjanaya@gmail.com>
pkgname=forgejo-mcp-bin
pkgver=2.25.1
pkgrel=1
pkgdesc="MCP server for Forgejo integration with AI assistants like Claude, the binary package"
arch=('x86_64')
url="https://codeberg.org/goern/forgejo-mcp"
license=('MIT')
provides=('forgejo-mcp')
conflicts=('forgejo-mcp')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/goern/forgejo-mcp/releases/download/v${pkgver}/forgejo-mcp_${pkgver}_linux_amd64.tar.gz")
sha256sums=('d4d1a073b7b440b25fd07f514cb2ae26ddf5dc897eb905d412b322318324fbb5')

package() {
    cd "forgejo-mcp_${pkgver}_linux_amd64"
    install -Dm755 forgejo-mcp "${pkgdir}/usr/bin/forgejo-mcp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
