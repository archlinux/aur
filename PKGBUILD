# Maintainer: Thayne McCombs <astrothayne+aur@gmail.com>
pkgname=bemoji
pkgver=0.4.0
pkgrel=1
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
source=("https://github.com/marty-oehme/bemoji/archive/refs/tags/v$pkgver.tar.gz")

package() {
	cd "$pkgname-$pkgver"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm755 -t "${pkgdir}/usr/bin" bemoji
}
sha256sums=('3cd6da53fdc34f295b31f6dda8b304b2d2f6973a1eb28dacf0bc0355276cd06c')
