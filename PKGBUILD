# Maintainer: czyt <czytcn@gmail.com>
pkgname=druk-bin
pkgver=1.7.0
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
sha256sums_x86_64=('6b655ed56530f2dfb11eef6c91268f10ba7788ed518f4d892565ea2371f583c5')
sha256sums_aarch64=('f172cf1d4217afa2cd82b0d9854fbbfab53d0bf338d7e94ea0819ce132436c54')

package() {
    install -Dm755 "${srcdir}/druk" "${pkgdir}/usr/bin/druk"
}
