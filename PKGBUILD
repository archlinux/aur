# Maintainer: czyt <czytcn@gmail.com>
pkgname=druk-bin
pkgver=1.31.0
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
sha256sums_x86_64=('5e05ce2c1deb3dd7dced341f206e54e9ff68b55ab74fa2b484d13652a4d158e8')
sha256sums_aarch64=('6981a35b9b92af3a507777e5dd52f4933a71738fc5f36901fe05e09c61fb8d75')

package() {
    install -Dm755 "${srcdir}/druk" "${pkgdir}/usr/bin/druk"
}
