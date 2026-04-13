# Maintainer: Albin Alm <your-email@example.com>
pkgname=straumr-bin
pkgver=2026.4.13.31
pkgrel=1
pkgdesc='CLI tool for managing, saving, and sending HTTP requests across workspaces'
arch=('x86_64')
url='https://github.com/albinalm/Straumr'
license=('GPL-3.0-only')
provides=('straumr')
conflicts=('straumr')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/albinalm/Straumr/releases/download/v${pkgver}/straumr-${pkgver}-linux-x64.tar.gz")
sha256sums=('f7670a06d55cde4a587a974f5cff13c2953ac2e18b8cc74af0f5b5e9fd17a3ba')

package() {
    install -Dm755 straumr "${pkgdir}/usr/bin/straumr"
}
