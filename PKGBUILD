# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lian-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="TUI frontend for paru/yay/pacman with AI-powered operation analysis"
arch=('x86_64')
url="https://github.com/Yueosa/lian"
license=('MIT')
optdepends=(
    'paru: AUR helper support (preferred)'
    'yay: AUR helper support'
)
provides=('lian')
conflicts=('lian' 'lian-git')
source=("https://github.com/Yueosa/lian/releases/download/v${pkgver}/lian_${pkgver}_linux_x86_64")
sha256sums=('423fbc7443e3ffd48935d5a2ec61275c0e38f9125904c4aac21973bc386853e7')

package() {
    install -Dm755 "lian_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lian"
}
