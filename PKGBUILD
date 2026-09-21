# Maintainer: czyt <czytcn@gmail.com>
pkgname=druk-bin
pkgver=1.32.0
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
sha256sums_x86_64=('5cc3d8062918df8d87184c3eb1474d660d8be5f0c3c2a149bdb0d168702a0e69')
sha256sums_aarch64=('b950d746fc035d9e40d341cbf74d88f02cc32f45874b4026cb000990d6fa087a')

package() {
    install -Dm755 "${srcdir}/druk" "${pkgdir}/usr/bin/druk"
}
