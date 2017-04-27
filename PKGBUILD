# Maintainer: Yigit Dallilar  <yigit.dallilar@gmail.com>

pkgname=jskycalc
pkgver=1.2
pkgrel=1
pkgdesc="A tool for observing preparation in java"
arch=('any')
url="http://www.dartmouth.edu/~physics/labs/skycalc/flyer.html"
depends=('java-environment' 'sh')
license=('custom')
noextract=('JSkyCalc.jar')
source=("http://www.dartmouth.edu/~physics/labs/skycalc/JSkyCalc.jar"
        "jskycalc" "jskycalc.desktop" "jskycalc.png")
sha1sums=('09f00cb1925f7b62a0237694007f18670857b32b'
	'126b4cd9b01821f5d735c29b0bef5703bfc411de'
	'1a8c532a74c689fcf7b10ba8ccbde03585899496'
	'8ea495aa3508822a2b939b6ff819e18b9a2d3803')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/java"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  install -m644 "$srcdir"/JSkyCalc.jar "$pkgdir"/usr/share/java
  install -m755 "$srcdir"/jskycalc "$pkgdir"/usr/bin/jskycalc
  install -m755 "$srcdir"/jskycalc.desktop "$pkgdir"/usr/share/applications
  install -m755 "$srcdir"/jskycalc.png "$pkgdir"/usr/share/pixmaps
}