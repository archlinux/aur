# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lian-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="TUI frontend for paru/yay/pacman with AI-powered operation analysis"
arch=('x86_64')
url="https://github.com/Yueosa/lian"
license=('MIT')
optdepends=(
    'paru: AUR helper support (preferred)'
    'yay: AUR helper support'
    'wl-clipboard: copy output to clipboard on Wayland (y key)'
    'xclip: copy output to clipboard on X11 (y key)'
    'xsel: copy output to clipboard on X11 (y key, fallback)'
)
provides=('lian')
conflicts=('lian' 'lian-git')
source=("https://github.com/Yueosa/lian/releases/download/v${pkgver}/lian_${pkgver}_linux_x86_64")
sha256sums=('d04dcee53aad0103c4af8c10f53c4e628a1480c56a1dd3e2a27bb84e6690dec9')

package() {
    install -Dm755 "lian_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lian"
}
