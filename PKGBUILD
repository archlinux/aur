# Maintainer: Albin Alm <your-email@example.com>
pkgname=straumr-bin
pkgver=2026.9.18.35
pkgrel=1
pkgdesc='CLI tool for managing, saving, and sending HTTP requests across workspaces'
arch=('x86_64')
url='https://github.com/albinalm/Straumr'
license=('GPL-3.0-only')
provides=('straumr')
conflicts=('straumr')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/albinalm/Straumr/releases/download/v${pkgver}/straumr-${pkgver}-linux-x64.tar.gz")
sha256sums=('502eda3f670089dcdb4a336bb3d3d2feaa0fddbb68315f66044d36ee607d3304')

package() {
    install -Dm755 straumr "${pkgdir}/usr/bin/straumr"
}
