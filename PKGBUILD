# Maintainer: Albin Alm <your-email@example.com>
pkgname=straumr-bin
pkgver=2026.9.29.44
pkgrel=1
pkgdesc='CLI tool for managing, saving, and sending HTTP requests across workspaces'
arch=('x86_64')
url='https://github.com/albinalm/Straumr'
license=('GPL-3.0-only')
provides=('straumr')
conflicts=('straumr')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/albinalm/Straumr/releases/download/v${pkgver}/straumr-${pkgver}-linux-x64.tar.gz")
sha256sums=('9d3fcadf807cc482eb7bf2599f223823f187a89a800b2960cad35718d3f4db12')

package() {
    install -Dm755 straumr "${pkgdir}/usr/bin/straumr"
}
