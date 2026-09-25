# Maintainer: czyt <czytcn@gmail.com>
pkgname=druk-bin
pkgver=1.35.3
pkgrel=1
pkgdesc="A terminal code editor with a file tree, tabs, search, git integration, and syntax highlighting"
arch=('x86_64' 'aarch64')
url="https://github.com/letstri/druk"
license=('MIT')
options=('!debug')
depends=('glibc')
provides=('druk')
conflicts=('druk')
source_x86_64=("druk-${pkgver}-linux-x86_64.tar.gz::https://github.com/letstri/druk/releases/download/v${pkgver}/druk-linux-x64.tar.gz")
source_aarch64=("druk-${pkgver}-linux-aarch64.tar.gz::https://github.com/letstri/druk/releases/download/v${pkgver}/druk-linux-arm64.tar.gz")
sha256sums_x86_64=('53bdab6e65e226567efd5f41def3faf262d2a344cb4e0170d7b340742ea190de')
sha256sums_aarch64=('7c8fdb93ab52bc6fd24b4c9f5d8edd524f59968a0a2b96dcc915b4751145b8e4')

package() {
    install -Dm755 "${srcdir}/druk" "${pkgdir}/usr/bin/druk"
}
