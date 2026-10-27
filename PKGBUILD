# Maintainer: David Birks <david@birks.dev>

pkgname=mcp-cli-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Lightweight CLI for interacting with MCP (Model Context Protocol) servers'
arch=('x86_64')
url='https://github.com/philschmid/mcp-cli'
license=('MIT')
provides=('mcp-cli')
conflicts=('mcp-cli')
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}::https://github.com/philschmid/mcp-cli/releases/download/v${pkgver}/mcp-cli-linux-x64")
b2sums_x86_64=('4fec83301f69b869ba26655243c697b49ed305e88aa8d5fec9b880debd6f445bade1f8a28058c6ffb28e07021f1ebf5884509eb00e085c1ac8560031a844e347')

package() {
  # Install binary
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/mcp-cli"
}
