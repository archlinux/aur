# Maintainer: Jordan Klassen <forivall@gmail.com>

pkgname=ttf-noto-emoji-monochrome
epoch=1
pkgver=2015_07_08
pkgrel=1
pkgdesc='Monochrome Android emojis from Noto font project.'
_ref=cba9c622628d5f0968b81fd3a46edb12120ebee7
arch=(any)
license=('Apache')
depends=(fontconfig xorg-font-utils)
url='https://github.com/googlei18n/noto-emoji'
source=("noto-emoji.zip::https://github.com/googlei18n/noto-emoji/archive/$_ref.zip")
install=$pkgname.install

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/noto-emoji-$_ref/NotoEmoji-Regular.ttf" "$pkgdir/usr/share/fonts/TTF/"
}

md5sums=('7f3a93b8cf40347d60f9741a61d6db92')
