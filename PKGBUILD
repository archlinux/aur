# Maintainer: jpate <jkpate@jkpate.net>
pkgname=praat
pkgver=6.0.04
pkgrel=2
pkgdesc="A tool for 'Doing Phonetics by computer'"
arch=('x86_64' 'i686')
url="http://www.fon.hum.uva.nl/praat/"
license=('GPL')
depends=( 'alsa-lib' 'gtk2' )
optdepends=( 'ttf-sil-fonts' )

source_i686=("http://www.fon.hum.uva.nl/praat/praat6004_linux32.tar.gz")
source_x86_64=("http://www.fon.hum.uva.nl/praat/praat6004_linux64.tar.gz")

md5sums_i686=('1f9fa085d79dca94401055dd1e570393')
md5sums_x86_64=('b0e05ff03b0e1e340cc2f178f69c8534')

package() {
  install -Dm755  "$srcdir/praat" "$pkgdir/usr/bin/praat"
}

