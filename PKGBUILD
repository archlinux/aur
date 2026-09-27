# Maintainer: czyt <czytcn@gmail.com>
pkgname=druk-bin
pkgver=1.36.0
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
sha256sums_x86_64=('72b862ce5acc7ae5d26ce6f177eafbd1057d96d7e9bd99987e85e578a7b8362b')
sha256sums_aarch64=('5f6a0f9c04af72f371db6d9eb05aa9b7f26ae438805a7ce694ec791dd2160a19')

package() {
    install -Dm755 "${srcdir}/druk" "${pkgdir}/usr/bin/druk"
}
