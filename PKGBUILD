# Maintainer: Yigit Dallilar  <yigit.dallilar@gmail.com>

pkgname=jskycalc
pkgver=1.2
pkgrel=2
pkgdesc="A tool for observing preparation in java"
arch=('any')
url="https://caligari.dartmouth.edu/public/downloads/skycalc/"
depends=('java-environment' 'sh')
license=('custom')
noextract=('JSkyCalc.jar')
source=("https://caligari.dartmouth.edu/public/downloads/skycalc/JSkyCalc.jar"
        "jskycalc" "jskycalc.desktop" "jskycalc.png")
sha1sums=('09f00cb1925f7b62a0237694007f18670857b32b'
	'126b4cd9b01821f5d735c29b0bef5703bfc411de'
	'e7313755d61916d81415ff5adedf76d3f5385c1c'
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
