# Maintainer: David Birks <david@birks.dev>

pkgname=mcp-cli-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='Lightweight CLI for interacting with MCP (Model Context Protocol) servers'
arch=('x86_64')
url='https://github.com/philschmid/mcp-cli'
license=('MIT')
provides=('mcp-cli')
conflicts=('mcp-cli')
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}::https://github.com/philschmid/mcp-cli/releases/download/v${pkgver}/mcp-cli-linux-x64")
b2sums_x86_64=('a3706e24a4d3bfd5db9a3815363febcb5c31ba25ec0a2f86cacd2522eafc41a8d2af9fccc23c9f6bcdae5e8857ccdab976a45f8d9e1c1beb2e0e728ded99d8e9')

package() {
  # Install binary
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/mcp-cli"
}
