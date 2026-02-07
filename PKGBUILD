# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lian-bin
pkgver=2.0.1
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
sha256sums=('c0edc27c06f6137716ca9c8954c816df1115f75ab0464a767333fce2be9bf0a6')

package() {
    install -Dm755 "lian_${pkgver}_linux_x86_64" "$pkgdir/usr/bin/lian"
}
