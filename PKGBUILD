# Maintainer: czyt <czytcn@gmail.com>
pkgname=druk-bin
pkgver=1.10.0
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
sha256sums_x86_64=('ad3c2ad4e892599757f3f1c229c064e1e580e138e706c779c81af9b8ee55e9a5')
sha256sums_aarch64=('e04a63b0b57eb1cc41f5adf7cc9c3aa1fd9bb605a3cb8696119073188eda6fc4')

package() {
    install -Dm755 "${srcdir}/druk" "${pkgdir}/usr/bin/druk"
}
