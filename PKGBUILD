# Maintainer: Albin Alm <your-email@example.com>
pkgname=straumr-bin
pkgver=2026.10.9.45
pkgrel=1
pkgdesc='CLI tool for managing, saving, and sending HTTP requests across workspaces'
arch=('x86_64')
url='https://github.com/albinalm/Straumr'
license=('GPL-3.0-only')
provides=('straumr')
conflicts=('straumr')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/albinalm/Straumr/releases/download/v${pkgver}/straumr-${pkgver}-linux-x64.tar.gz")
sha256sums=('3cd054d9973853c7fab07636f799d31f3196f7cddd84d5fb8f155e6baeb329c3')

package() {
    install -Dm755 straumr "${pkgdir}/usr/bin/straumr"
}
