# Maintainer: czyt <czytcn@gmail.com>
pkgname=druk-bin
pkgver=1.29.1
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
sha256sums_x86_64=('8dd9c78a928411e08ef1ddabea4bbd4be7fa08891ead00fbaf63526ae864f779')
sha256sums_aarch64=('f3b555a5fb47a50c752b49f9e1f706f304f1b1da3f0679dbb6cffd3f7c704a00')

package() {
    install -Dm755 "${srcdir}/druk" "${pkgdir}/usr/bin/druk"
}
