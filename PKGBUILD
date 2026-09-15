# Maintainer: czyt <czytcn@gmail.com>
pkgname=druk-bin
pkgver=1.27.2
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
sha256sums_x86_64=('e9749a1bb0ff90e9af3ecb455c578d2421869bb20cf20d6e02d5149d5e74e5e0')
sha256sums_aarch64=('5774fd2b673c6f0cf5860b296a9d2bbb067eac589512fae9e2662901d87bddb4')

package() {
    install -Dm755 "${srcdir}/druk" "${pkgdir}/usr/bin/druk"
}
