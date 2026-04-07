# Maintainer: Albin Alm <your-email@example.com>
pkgname=straumr-bin
pkgver=2026.4.7.25
pkgrel=1
pkgdesc='CLI tool for managing, saving, and sending HTTP requests across workspaces'
arch=('x86_64')
url='https://github.com/albinalm/Straumr'
license=('GPL-3.0-only')
provides=('straumr')
conflicts=('straumr')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/albinalm/Straumr/releases/download/v${pkgver}/straumr-${pkgver}-linux-x64.tar.gz")
sha256sums=('9ac7e5758a64836998a21857e139601be9369e4fcf9bfc6742aedefb4579f6ba')

package() {
    install -Dm755 straumr "${pkgdir}/usr/bin/straumr"
}
