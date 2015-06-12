# Contributor:Xemertix <arch88(at)katamail(dot)com>

pkgname=plascolin
pkgver=2.02
pkgrel=1
depends=('gtk2' 'cairo')
pkgdesc="A tool to create and to view anaglyph stereo images and to display the left and right image on output devices"
url="http://www.schrammel.org/stereo-plascolin.php"
arch=("i686" "x86_64")
license=('GPL')
#source=(http://www.schrammel.org/download/plascolin_$pkgver.tgz)
source=(http://home.p5n.pp.ru/~sergej/dl/2014/plascolin_$pkgver.tgz)
md5sums=('56e741d7cae3993d49fc0ee3588e9349')

build() {
  cd ${srcdir}/${pkgname}_${pkgver}
  make
  install -Dm0755 plascolin $pkgdir/usr/bin/plascolin
  install -Dm0644 plascolin.ui $pkgdir/usr/share/plascolin/plascolin.ui
}
