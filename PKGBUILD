# Maintainer: agony <27015 at riseup dot net>

pkgname=mcp-toolbox-bin
pkgver=1.17.0
pkgrel=1
pkgdesc='MCP server for databases (prebuilt)'
arch=('x86_64')
url='https://github.com/googleapis/mcp-toolbox'
license=('Apache-2.0')
depends=('glibc')
provides=("mcp-toolbox=${pkgver}")
conflicts=('mcp-toolbox')
source=("mcp-toolbox-${pkgver}::https://storage.googleapis.com/mcp-toolbox-for-databases/v${pkgver}/linux/amd64/toolbox")
sha256sums=('887b8dc1a49386baf81b28bd4d09ab06db845cd9b261de04c63eabf961a7e3bf')

package() {
  install -Dm755 "mcp-toolbox-${pkgver}" "${pkgdir}/usr/bin/mcp-toolbox"
}
