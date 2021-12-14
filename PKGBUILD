# Maintainer: jesuschroist <chris@qlab.pro>

pkgname=ttf-pirata-one
pkgver=1.0
pkgrel=3
pkgdesc="A gothic textura font, simplified and optimized to work well on screen and pixel displays."
arch=('any')
url="http://www.rfuenzalida.com/"
license=('custom:OFL')
source=(https://dl.dafont.com/dl/?f=pirata_one)
md5sums=('617351f4869aa1dffb82e7a23cf7559e')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 PirataOne-Regular.ttf "$pkgdir/usr/share/fonts/TTF"
}
