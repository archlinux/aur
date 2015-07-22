# Maintainer: Kel <humanoidanalog@gmail.com>

pkgname=ttf-noto-emoji-monochrome
pkgver=1.0
pkgrel=1
pkgdesc='Monochrome Android emojis from Noto font project.'
arch=(any)
license=('Apache')
depends=(fontconfig xorg-font-utils)
url='https://code.google.com/p/noto/'
source=('https://noto.googlecode.com/git/fonts/alpha/NotoEmoji-Regular.ttf')
install=$pkgname.install

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/NotoEmoji-Regular.ttf" "$pkgdir/usr/share/fonts/TTF/"
}

md5sums=('7e95ad5934d900bc13b364eb5f1fe318')
