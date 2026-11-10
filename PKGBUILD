# Maintainer: Albin Alm <your-email@example.com>
pkgname=straumr-bin
pkgver=2026.11.10.46
pkgrel=1
pkgdesc='CLI tool for managing, saving, and sending HTTP requests across workspaces'
arch=('x86_64')
url='https://github.com/albinalm/Straumr'
license=('GPL-3.0-only')
provides=('straumr')
conflicts=('straumr')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/albinalm/Straumr/releases/download/v${pkgver}/straumr-${pkgver}-linux-x64.tar.gz")
sha256sums=('9d0849b9ba28b6266df46cfe49e0f87e01ae6be83c22b749bea7fdaac00f8a3f')

package() {
    install -Dm755 straumr "${pkgdir}/usr/bin/straumr"
}
