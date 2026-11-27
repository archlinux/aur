# Maintainer: Albin Alm <your-email@example.com>
pkgname=straumr-bin
pkgver=2026.11.27.48
pkgrel=1
pkgdesc='CLI tool for managing, saving, and sending HTTP requests across workspaces'
arch=('x86_64')
url='https://github.com/albinalm/Straumr'
license=('GPL-3.0-only')
provides=('straumr')
conflicts=('straumr')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/albinalm/Straumr/releases/download/v${pkgver}/straumr-${pkgver}-linux-x64.tar.gz")
sha256sums=('6fcc95e859beac54f7621c0a8567095e2a69e7f3564833ab0e0ec3592043fb71')

package() {
    install -Dm755 straumr "${pkgdir}/usr/bin/straumr"
}
