# Maintainer: Javier Fernández <WyRe12[at]gmail[dot]com>

pkgname=ttf-minecrafter
pkgver=1.0
pkgrel=2
pkgdesc="Minecrafter fonts from http://www.dafont.com"
arch=(any)
url="https://www.dafont.com/es/minecrafter.font"
license=('CCPL')
depends=('fontconfig')
source=("$pkgname.zip::https://dl.dafont.com/dl/?f=minecrafter")
md5sums=('7b2874b4e67f6a018bba648031cfa6bc')


package() {

  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF/"

}
