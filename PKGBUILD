# Maintainer: Your Name <your.email@example.com>
_pkgname=hyper-mcp
pkgname=$_pkgname-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Hyper-MCP is a webassembly plugin based mcp server"
url="https://github.com/tuananh/hyper-mcp"
license=('Apache-2.0')
arch=('x86_64')
source=("https://github.com/tuananh/hyper-mcp/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('248b7f42357e11514d9e4f0183b291fff04bccf2b0a012d2f5103f40dfee4740')

package() {
    cd "${srcdir}"
    
    # Create installation directory
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

