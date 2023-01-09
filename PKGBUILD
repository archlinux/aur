# Maintainer: Thayne McCombs <astrothayne+aur@gmail.com>
pkgname=bemoji
pkgver=0.3.0
pkgrel=2
pkgdesc="Emoji picker that remembers your favorites"
arch=('any')
url="https://github.com/marty-oehme/bemoji"
license=('MIT')
depends=('curl')
optdepends=(
  'bemenu: Emoji picker menu'
  'wofi: Emoji picker menu'
  'rofi: Emoji picker menu'
  'dmenu: Emoji picker menu'
  'wl-clipboard: Clipboard support'
  'xclip: Clipboard support'
  'xsel: Clipboard support'
  'wtype: Auto-typing support'
  'xdotool: Auto-typing support'
)
conflicts=("${pkgname}-git")
source=("https://github.com/marty-oehme/bemoji/archive/refs/tags/0.3.0.tar.gz")

package() {
	cd "$pkgname-$pkgver"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm755 -t "${pkgdir}/usr/bin" bemoji
}
sha256sums=('8a61b267ad79340da62c0826ca6cd12f6fccc2ccefb78bdbb6a6cbadd8cd3169')
