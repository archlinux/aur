# Maintainer: czyt <czytcn@gmail.com>
pkgname=druk-bin
pkgver=1.11.1
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
sha256sums_x86_64=('3e027671a1a95114ba6d9015ba2df2d14f39b06ef055698f2b0a6bfc3721e0ad')
sha256sums_aarch64=('0b27f044eeaa4153dbb566b5e8a65b4ef85cfb7134c8ce4cf7ccc3d9e4f5e9bf')

package() {
    install -Dm755 "${srcdir}/druk" "${pkgdir}/usr/bin/druk"
}
