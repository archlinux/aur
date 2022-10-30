# Maintainer: Mordechai Hadad <mordechai.hadad01@gmail.com>
pkgname=bob-bin
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc="A version manager for neovim "
arch=('x86_64')
url="https://github.com/MordechaiHadad/bob"
license=('MIT')
makedepends=('unzip')
source=("bob.zip::https://github.com/MordechaiHadad/bob/releases/download/v${pkgver}/bob-linux-x86_64.zip")
sha256sums=('96422dbb2a3db3c4b00b574218b3dcd6fa077dabcc8ab7e296f46c0b997df016')

package() {
    install -Dm755 "${srcdir}/bob" "${pkgdir}/usr/bin/bob"
}
