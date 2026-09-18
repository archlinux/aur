# Maintainer: Albin Alm <your-email@example.com>
pkgname=straumr-bin
pkgver=2026.9.18.37
pkgrel=1
pkgdesc='CLI tool for managing, saving, and sending HTTP requests across workspaces'
arch=('x86_64')
url='https://github.com/albinalm/Straumr'
license=('GPL-3.0-only')
provides=('straumr')
conflicts=('straumr')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/albinalm/Straumr/releases/download/v${pkgver}/straumr-${pkgver}-linux-x64.tar.gz")
sha256sums=('c8c5be25f99ba5695153c4d7494cd00a5dce5789952563b469a01f067d56f467')

package() {
    install -Dm755 straumr "${pkgdir}/usr/bin/straumr"
}
