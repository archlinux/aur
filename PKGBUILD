# Maintainer: Shorin  <2433516202@qq.com>
pkgname=shorinclip
pkgver=1.1.4
pkgrel=1
pkgdesc="A wayland clipboard TUI based on fzf wl-clipboard and cliphist. Use chafa for image preview"
arch=('any')
url="https://github.com/SHORiN-KiWATA/shorinclip"
license=('MIT')
depends=('fzf' 'cliphist' 'wl-clipboard' 'ffmpegthumbnailer' 'chafa')

source=("https://raw.githubusercontent.com/SHORiN-KiWATA/shorinclip/refs/heads/main/shorinclip")
sha256sums=('53a7884c813bc1690dfa2d53674529ce8c1c83a1b3b95ca11f7ee2999af629d6')

package() {
    install -Dm755 "$srcdir/shorinclip" "$pkgdir/usr/bin/shorinclip"
}
