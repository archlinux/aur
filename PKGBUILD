# Maintainer: czyt <czytcn@gmail.com>
pkgname=druk-bin
pkgver=1.35.0
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
sha256sums_x86_64=('6c7da1e5c72b14d9816e64edfe08d2d52d0c9e2d2d46af1329d6c606c418b6a2')
sha256sums_aarch64=('3fa1329e69905ec8ac3e0b72d7b98bea2a4df6fa847624c8c350ff069034675c')

package() {
    install -Dm755 "${srcdir}/druk" "${pkgdir}/usr/bin/druk"
}
