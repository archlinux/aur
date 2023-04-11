# Maintainer: Mordechai Hadad <mordechai.hadad01@gmail.com>
pkgname=bob-bin
pkgver=2.3.1
pkgrel=1
epoch=
pkgdesc="A version manager for neovim "
arch=('x86_64')
url="https://github.com/MordechaiHadad/bob"
license=('MIT')
makedepends=('unzip')
source=("bob.zip::https://github.com/MordechaiHadad/bob/releases/download/v${pkgver}/bob-linux-x86_64.zip")
sha256sums=('1d0d076850bc1bac0d899970592387981da44ae4b8c9660b99e3d4d0dd488058')

package() {
    install -Dm755 "${srcdir}/bob" "${pkgdir}/usr/bin/bob"
}
