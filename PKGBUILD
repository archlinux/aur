# Maintainer: czyt <czytcn@gmail.com>
pkgname=druk-bin
pkgver=1.40.0
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
sha256sums_x86_64=('5d3349faf3f3f017d0abac9747eb4c1a853abeacb1d7e929bad786155cd8dcd6')
sha256sums_aarch64=('4ea4f8f6cb7aaa6aa753dde4855e3ff7562ea9f15b51353d3e031f115d03ca42')

package() {
    install -Dm755 "${srcdir}/druk" "${pkgdir}/usr/bin/druk"
}
