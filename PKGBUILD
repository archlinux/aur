# Maintainer: czyt <czytcn@gmail.com>
pkgname=druk-bin
pkgver=1.21.1
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
sha256sums_x86_64=('6cd9185348e78ad9e9c1139d52fa9af3812d4af77fe207415ace4d9d9ebe645d')
sha256sums_aarch64=('f2964b7c391555ba81d7bd2dd7d02dd9637ca9e74ca66123de79b796a6be06d9')

package() {
    install -Dm755 "${srcdir}/druk" "${pkgdir}/usr/bin/druk"
}
