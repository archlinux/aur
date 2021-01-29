# Maintainer: David P. <megver83@parabola.nu>

pkgname=ttf-linkinpark
pkgver=1
pkgrel=1
pkgdesc='Linkin Park fonts'
url='https://www.dafont.com/linkin-park.font'
license=('custom')
arch=('any')
source=("linkin_park.zip::https://dl.dafont.com/dl/?f=linkin_park")
sha256sums=('6b481fa1bcbe0cda90f6dd37dbd032489fe64dba353e66be3434cfa4fda6fb88')

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 LinkinPark.ttf "$pkgdir/usr/share/fonts/TTF/LinkinPark.ttf"
  install -m644 linkin.ttf "$pkgdir/usr/share/fonts/TTF/linkin.ttf"
}
