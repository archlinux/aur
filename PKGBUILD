# Maintainer: Shorin  <2433516202@qq.com>
pkgname=shorinclip
pkgver=1.1.0
pkgrel=2
pkgdesc="A wayland clipboard TUI script using fzf wl-clipboard cliphist and kitty image preview"
arch=('any')
url="https://github.com/SHORiN-KiWATA/shorinclip"
license=('MIT')
depends=('fzf' 'cliphist' 'wl-clipboard' 'ffmpegthumbnailer' 'chafa')

source=("https://raw.githubusercontent.com/SHORiN-KiWATA/shorinclip/refs/heads/main/shorinclip")
sha256sums=('c78619525d55b14d469efbbd342d1190027eadc45d794190b45473e9edf8fd54')

package() {
    install -Dm755 "$srcdir/shorinclip" "$pkgdir/usr/bin/shorinclip"
}
