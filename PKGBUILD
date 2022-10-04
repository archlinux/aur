# Maintainer: Patrick Mischke

pkgname=ttf-alone_in_the_dark
pkgver=1.0
pkgrel=1
pkgdesc="Alone in the Dark font from http://www.dafont.com"
arch=(any)
url="https://www.dafont.com/alone-in-the-dark.font"
license=('custom:personal use')
depends=('fontconfig')
source=("$pkgname.zip::https://dl.dafont.com/dl/?f=alone_in_the_dark")
sha256sums=('3f94a20719484366e2e7c2c0ac8e0d89afd34ec2f2d1e0ac55fdde8e457d6454')


package() {

  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 "$srcdir/"*.txt "$pkgdir/usr/share/licenses/$pkgname"

}

