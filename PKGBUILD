# Maintainer: jpate <jkpate@jkpate.net>
pkgname=praat
pkgver=6.0.05
pkgrel=1
pkgdesc="A tool for 'Doing Phonetics by computer'"
arch=('x86_64' 'i686')
url="http://www.fon.hum.uva.nl/praat/"
license=('GPL')
depends=( 'alsa-lib' 'gtk2' )
optdepends=( 'ttf-sil-fonts' )

source_i686=("http://www.fon.hum.uva.nl/praat/praat6005_linux32.tar.gz")
source_x86_64=("http://www.fon.hum.uva.nl/praat/praat6005_linux64.tar.gz")

md5sums_x86_64=('9906a68882a98ecda1b25bfd897971ee')
md5sums_i686=('27a7decd067fd215fe425c68d39ee373')

package() {
  install -Dm755  "$srcdir/praat" "$pkgdir/usr/bin/praat"
}

