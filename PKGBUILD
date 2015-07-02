# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=itg3theme
pkgver=pre1a
pkgrel=1
pkgdesc="A port of Lightning's ITG3 theme to StepMania 5"
arch=("any")
url="http://ssc.ajworld.net/?p=itg3"
license=('unknown')
depends=('stepmania>=5')
source=("http://ssc.ajworld.net/itg3/itg3sm5-theme_$pkgver.zip")
md5sums=('a4aa48a5224892da7a7e7ed167e2a259')

package() {
  cd "$srcdir"
  install -d "$pkgdir/opt/stepmania"
  cp -r Themes "$pkgdir/opt/stepmania"
}

# vim:set ts=2 sw=2 et:
