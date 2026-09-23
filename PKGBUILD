# Maintainer: czyt <czytcn@gmail.com>
pkgname=druk-bin
pkgver=1.35.2
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
sha256sums_x86_64=('d669c09bcdab43f4f15638c18cb6fbdb0b75cc4e4757ab0a13cb36cf79d0f250')
sha256sums_aarch64=('a099d9f28a94e38623470bb14341fd2d5ee42f9b1f152d58c321030864db3a42')

package() {
    install -Dm755 "${srcdir}/druk" "${pkgdir}/usr/bin/druk"
}
