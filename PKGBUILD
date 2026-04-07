# Maintainer: Albin Alm <your-email@example.com>
pkgname=straumr-bin
pkgver=2026.4.7.24
pkgrel=1
pkgdesc='CLI tool for managing, saving, and sending HTTP requests across workspaces'
arch=('x86_64')
url='https://github.com/albinalm/Straumr'
license=('GPL-3.0-only')
provides=('straumr')
conflicts=('straumr')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/albinalm/Straumr/releases/download/v${pkgver}/straumr-${pkgver}-linux-x64.tar.gz")
sha256sums=('0fbc29fb06d6690bf9130ffb91c520308c6bcaaa9f30b6906a385e174a376815')

package() {
    install -Dm755 straumr "${pkgdir}/usr/bin/straumr"
}
