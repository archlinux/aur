# Maintainer: Mordechai Hadad <mordechai.hadad01@gmail.com>
pkgname=bob-bin
pkgver=2.1.1
pkgrel=1
epoch=
pkgdesc="A version manager for neovim "
arch=('x86_64')
url="https://github.com/MordechaiHadad/bob"
license=('MIT')
makedepends=('unzip')
source=("bob.zip::https://github.com/MordechaiHadad/bob/releases/download/v${pkgver}/bob-linux-x86_64.zip")
sha256sums=('3405f2868214d5e227fb324c04c24d7f6691a4e5ff77ca8f4347d3c86b6442b1')

package() {
    install -Dm755 "${srcdir}/bob" "${pkgdir}/usr/bin/bob"
}
