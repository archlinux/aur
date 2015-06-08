# Maintainer: Stephen Smith <stephen304@gmail.com>
pkgname=ttf-jenna-sue
pkgver=1.0
pkgrel=1
pkgdesc="The free TTF desktop version of the Jenna Sue font"
arch=(any)
url="http://www.dafont.com/jenna-sue.font"
depends=(fontconfig xorg-font-utils)
source=("http://dl.dafont.com/dl/?f=jenna_sue")
md5sums=("95e36cde53d7b94ee2435ce62a7f49e1")
install=$pkgname.install

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
}
