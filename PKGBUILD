# Maintainer: Neolux Lee <aur.neolux@neolux.cn.eu.org>

pkgname=neolux-tic-tac-toe
pkgver=1.0
pkgrel=0
pkgdesc='A simple tic-tac-toe game written in GTK'
arch=(
    'x86_64'
)
url='https://github.com/neoluxis/GTK-Tic-Tac-Toe'
depends=(
    'gtk4'
)
source=("neolux-tictactoe-archlinux::${url}/releases/download/${pkgver}/TicTacToe-GTK-archlinux")
sha256sums=('bbd034cd6d593a8bd212cb7e7d7ebbfccd22338f948185ccf961c7c38ddad5a7')
build() {
chmod +x "${srcdir}/neolux-tictactoe-archlinux"
}
package() {
install -Dm755 "${srcdir}/neolux-tictactoe-archlinux" "${pkgdir}/usr/bin/neolux-tictactoe"
}
