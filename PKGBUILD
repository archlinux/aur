# Maintainer: agony <27015 at riseup dot net>

pkgname=mcp-toolbox-bin
pkgver=1.16.0
pkgrel=1
pkgdesc='MCP server for databases (prebuilt)'
arch=('x86_64')
url='https://github.com/googleapis/mcp-toolbox'
license=('Apache-2.0')
depends=('glibc')
provides=("mcp-toolbox=${pkgver}")
conflicts=('mcp-toolbox')
source=("mcp-toolbox-${pkgver}::https://storage.googleapis.com/mcp-toolbox-for-databases/v${pkgver}/linux/amd64/toolbox")
sha256sums=('ca04ab10581c019ed3e905d0331b51faaed8e48f92d97fe592ce2312acf3769f')

package() {
  install -Dm755 "mcp-toolbox-${pkgver}" "${pkgdir}/usr/bin/mcp-toolbox"
}
