# Maintainer: AdrianoML <adriano dot lols a_t gmail dot com>

pkgname=kbd-br-thinkpad
pkgver=1.0
pkgrel=1
pkgdesc="Brazilian ABNT-2 Thinkpad keyboard layout for kernel terminals. This will enable you to type with the / and ? key instead of restoring to AltGr + Q or W"
arch=('i686' 'x86_64')
license=('BSD')
source=("br-thinkpad.map.gz")
md5sums=('4cd1f67416c20bda6071c7be75d60a37')

build() {
    return 0
}

package() {
  mkdir -p "$pkgdir/usr/share/kbd/keymaps/i386/qwerty"
  cp 'br-thinkpad.map.gz' "$pkgdir/usr/share/kbd/keymaps/i386/qwerty/"
}

