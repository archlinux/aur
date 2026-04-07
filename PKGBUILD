# Maintainer: Albin Alm <albinalm@proton.me>
pkgname=straumr-bin
pkgver=2026.4.7.14
pkgrel=1
pkgdesc='CLI tool for managing, saving, and sending HTTP requests across workspaces'
arch=('x86_64')
url='https://github.com/albinalm/Straumr'
license=('GPL-3.0-only')
provides=('straumr')
conflicts=('straumr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/albinalm/Straumr/releases/download/v${pkgver}/straumr-${pkgver}-linux-x64.tar.gz")
sha256sums=('67251224dd02639c49c3f76ba9edb366557a7516a33b94217fefb89ebb2aa007')

package() {
    install -Dm755 straumr "${pkgdir}/usr/bin/straumr"
}
