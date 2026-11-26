# Maintainer: Albin Alm <your-email@example.com>
pkgname=straumr-bin
pkgver=2026.11.26.47
pkgrel=1
pkgdesc='CLI tool for managing, saving, and sending HTTP requests across workspaces'
arch=('x86_64')
url='https://github.com/albinalm/Straumr'
license=('GPL-3.0-only')
provides=('straumr')
conflicts=('straumr')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/albinalm/Straumr/releases/download/v${pkgver}/straumr-${pkgver}-linux-x64.tar.gz")
sha256sums=('b4d935f3ba76ca7dd3e8bbb89c6c047969a7311e9df29240e1caca1eb074ce25')

package() {
    install -Dm755 straumr "${pkgdir}/usr/bin/straumr"
}
