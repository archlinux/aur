# Maintainer: Albin Alm <your-email@example.com>
pkgname=straumr-bin
pkgver=2026.4.7.15
pkgrel=1
pkgdesc='CLI tool for managing, saving, and sending HTTP requests across workspaces'
arch=('x86_64')
url='https://github.com/albinalm/Straumr'
license=('GPL-3.0-only')
provides=('straumr')
conflicts=('straumr')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/albinalm/Straumr/releases/download/v${pkgver}/straumr-${pkgver}-linux-x64.tar.gz")
sha256sums=('90ec775c211d0246a7a521f313311f112a7ced34d2dfaf7203a24b40d93c8670')

package() {
    install -Dm755 straumr "${pkgdir}/usr/bin/straumr"
}
