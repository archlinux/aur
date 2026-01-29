# Maintainer: Your Name <your.email@example.com>
_pkgname=hyper-mcp
pkgname=$_pkgname-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Hyper-MCP is a webassembly plugin based mcp server"
url="https://github.com/hyper-mcp-rs/hyper-mcp"
license=('Apache-2.0')
arch=('x86_64')
source=("https://github.com/hyper-mcp-rs/hyper-mcp/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('53b89e9d7d3ee721d6187b5a736bcbf3f1ce15ce53c0a06b7244cfa78e3c27de')

package() {
    cd "${srcdir}"
    
    # Create installation directory
    install -Dm755 "${_pkgname}-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/${_pkgname}"
}

