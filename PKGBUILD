# Maintainer: Shorin  <2433516202@qq.com>
pkgname=shorinclip
pkgver=1.0.0
pkgrel=1
pkgdesc="A wayland clipboard TUI script using fzf wl-clipboard cliphist and kitty image preview"
arch=('any')
url="https://github.com/SHORiN-KiWATA/shorinclip"
license=('MIT')
depends=('fzf' 'cliphist' 'wl-clipboard')
optdepends=('ffmpegthumbnailer: Video thumbnail support')

source=("https://raw.githubusercontent.com/SHORiN-KiWATA/shorinclip/refs/heads/main/shorinclip")

sha256sums=('50142c6b8176a0705bef42953d3d2618b16a86d2e904d710d5c1334c788278be')

package() {
    install -Dm755 "$srcdir/shorinclip" "$pkgdir/usr/bin/shorinclip"
}
