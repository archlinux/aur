# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lian-bin
pkgver=2.0.2
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
sha256sums=('9950d36e785c29880759662720f83e1486b7dffa5fed914bf0ac0e193ec2130c')

package() {
    install -Dm755 "lian_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lian"
}
