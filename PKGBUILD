# Maintainer: Mordechai Hadad <mordechai.hadad01@gmail.com>
pkgname=bob-bin
pkgver=2.1.0
pkgrel=1
epoch=
pkgdesc="A version manager for neovim "
arch=('x86_64')
url="https://github.com/MordechaiHadad/bob"
license=('MIT')
makedepends=('unzip')
source=("bob.zip::https://github.com/MordechaiHadad/bob/releases/download/v${pkgver}/bob-linux-x86_64.zip")
sha256sums=('7c0554d729c3f39cc936dc00ea2a8641e389877e169c8b93611ae96a9644d256')

package() {
    install -Dm755 "${srcdir}/bob" "${pkgdir}/usr/bin/bob"
}
