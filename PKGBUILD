# Maintainer: Mordechai Hadad <mordechai.hadad01@gmail.com>
pkgname=bob-bin
pkgver=2.2.0
pkgrel=1
epoch=
pkgdesc="A version manager for neovim "
arch=('x86_64')
url="https://github.com/MordechaiHadad/bob"
license=('MIT')
makedepends=('unzip')
source=("bob.zip::https://github.com/MordechaiHadad/bob/releases/download/v${pkgver}/bob-linux-x86_64.zip")
sha256sums=('16d7a87d48356788fee173cbf33ecf2892b79cc5bbbc35ccb019dd2d686309e3')

package() {
    install -Dm755 "${srcdir}/bob" "${pkgdir}/usr/bin/bob"
}
