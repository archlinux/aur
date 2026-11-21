# Maintainer: agony <27015 at riseup dot net>

pkgname=mcp-toolbox-bin
pkgver=1.18.0
pkgrel=1
pkgdesc='MCP server for databases (prebuilt)'
arch=('x86_64')
url='https://github.com/googleapis/mcp-toolbox'
license=('Apache-2.0')
depends=('glibc')
provides=("mcp-toolbox=${pkgver}")
conflicts=('mcp-toolbox')
source=("mcp-toolbox-${pkgver}::https://storage.googleapis.com/mcp-toolbox-for-databases/v${pkgver}/linux/amd64/toolbox")
sha256sums=('ea848baf2bfa84cf93341a7ff10bd5b1961dfed1077e644a78e6128492db339d')

package() {
  install -Dm755 "mcp-toolbox-${pkgver}" "${pkgdir}/usr/bin/mcp-toolbox"
}
