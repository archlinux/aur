# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lian-bin
pkgver=2.0.3
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
sha256sums=('4ce55aca47c0d327730863ce60dca8d8b84cf04e16efa4e65db857379db5dbde')

package() {
    install -Dm755 "lian_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lian"
}
