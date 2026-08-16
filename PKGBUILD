# Maintainer: czyt <czytcn@gmail.com>
pkgname=druk-bin
pkgver=1.20.4
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
sha256sums_x86_64=('6e6fc239883248523412dc7bbfc6379ac3bdac0514975d9aec81b6718e2ba1ca')
sha256sums_aarch64=('08332f48077b0a5b56a36ce5a2a3ab2635a3576742ebb88d369b0b2576f7530a')

package() {
    install -Dm755 "${srcdir}/druk" "${pkgdir}/usr/bin/druk"
}
