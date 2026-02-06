# Maintainer: Shorin  <2433516202@qq.com>
pkgname=shorinclip
pkgver=1.1.2
pkgrel=1
pkgdesc="A wayland clipboard TUI script using fzf wl-clipboard cliphist and kitty image preview"
arch=('any')
url="https://github.com/SHORiN-KiWATA/shorinclip"
license=('MIT')
depends=('fzf' 'cliphist' 'wl-clipboard' 'ffmpegthumbnailer' 'chafa')

source=("https://raw.githubusercontent.com/SHORiN-KiWATA/shorinclip/refs/heads/main/shorinclip")
sha256sums=('e321c7f3ceacb16c34a79feddbdbc45e87f62332da15c3978a577c0cc694e146')

package() {
    install -Dm755 "$srcdir/shorinclip" "$pkgdir/usr/bin/shorinclip"
}
