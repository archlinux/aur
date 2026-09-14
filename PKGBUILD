# Maintainer: czyt <czytcn@gmail.com>
pkgname=druk-bin
pkgver=1.25.0
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
sha256sums_x86_64=('4603e3bac762987d976d79528803007100e5e552018b0d17ebb107ca407dfa41')
sha256sums_aarch64=('4e0eb103278e3fe833676e76bb6631ffea91fff0c4535531d6e9803836fb6fcb')

package() {
    install -Dm755 "${srcdir}/druk" "${pkgdir}/usr/bin/druk"
}
