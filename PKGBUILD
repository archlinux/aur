# Maintainer: Albin Alm <your-email@example.com>
pkgname=straumr-bin
pkgver=2026.9.18.36
pkgrel=1
pkgdesc='CLI tool for managing, saving, and sending HTTP requests across workspaces'
arch=('x86_64')
url='https://github.com/albinalm/Straumr'
license=('GPL-3.0-only')
provides=('straumr')
conflicts=('straumr')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/albinalm/Straumr/releases/download/v${pkgver}/straumr-${pkgver}-linux-x64.tar.gz")
sha256sums=('3b5c43d7b6d1f674c6b0dcc43640d3cbf11f7f86d40de3b7c3c3c95f6c7b9c90')

package() {
    install -Dm755 straumr "${pkgdir}/usr/bin/straumr"
}
