# Maintainer: Albin Alm <your-email@example.com>
pkgname=straumr-bin
pkgver=2026.4.13.29
pkgrel=1
pkgdesc='CLI tool for managing, saving, and sending HTTP requests across workspaces'
arch=('x86_64')
url='https://github.com/albinalm/Straumr'
license=('GPL-3.0-only')
provides=('straumr')
conflicts=('straumr')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/albinalm/Straumr/releases/download/v${pkgver}/straumr-${pkgver}-linux-x64.tar.gz")
sha256sums=('b73a749aa3d33bb6c08760a69d98d2f504db4f84e59766de06c6d529723ec2d0')

package() {
    install -Dm755 straumr "${pkgdir}/usr/bin/straumr"
}
