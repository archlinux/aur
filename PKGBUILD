# Maintainer: Javier Fernández <WyRe12[at]gmail[dot]com>

pkgname=ttf-pixeled
pkgver=1.0
pkgrel=2
pkgdesc="Pixeled font from http://www.dafont.com"
arch=(any)
url="http://www.dafont.com/es/pixeled.font"
license=('unknown')
depends=('fontconfig')
provides=('ttf-pixeled')
source=("$pkgname.zip::http://dl.dafont.com/dl/?f=pixeled")
md5sums=('b8cea9e08d98d07d6225168037258d36')


package() {
  
  # Installing font
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 "$srcdir"/*.ttf "$pkgdir/usr/share/fonts/TTF/"

}
