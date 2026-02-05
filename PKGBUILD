# Maintainer: Shorin  <2433516202@qq.com>
pkgname=shorinclip
pkgver=1.1.0
pkgrel=1
pkgdesc="A wayland clipboard TUI script using fzf wl-clipboard cliphist and kitty image preview"
arch=('any')
url="https://github.com/SHORiN-KiWATA/shorinclip"
license=('MIT')
depends=('fzf' 'cliphist' 'wl-clipboard' 'ffmpegthumbnailer' 'chafa')

source=("https://raw.githubusercontent.com/SHORiN-KiWATA/shorinclip/refs/heads/main/shorinclip")
sha256sums=('8f3cb7b2a91fbc825026c7a505da7ce9d7679adb3dd2bb8803564040a86353f7')

package() {
    install -Dm755 "$srcdir/shorinclip" "$pkgdir/usr/bin/shorinclip"
}
