# Maintainer: Albin Alm <your-email@example.com>
pkgname=straumr-bin
pkgver=2026.9.22.40
pkgrel=1
pkgdesc='CLI tool for managing, saving, and sending HTTP requests across workspaces'
arch=('x86_64')
url='https://github.com/albinalm/Straumr'
license=('GPL-3.0-only')
provides=('straumr')
conflicts=('straumr')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/albinalm/Straumr/releases/download/v${pkgver}/straumr-${pkgver}-linux-x64.tar.gz")
sha256sums=('2d0fa70f0d9c7bbdf56bc09009ad87d97ea3f5b62091e30fa28ea01f74ae0556')

package() {
    install -Dm755 straumr "${pkgdir}/usr/bin/straumr"
}
