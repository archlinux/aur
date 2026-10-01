# Maintainer: Nia Schlegel <nia@3nt3.de>

pkgname=ttf-instrument-serif
pkgver=1.0
pkgrel=1
pkgdesc='Instrument Serif, a condensed display serif typeface by Instrument'
arch=('any')
url='https://github.com/Instrument/instrument-serif'
license=('OFL-1.1')
_commit='65c0ef225f386a3c7e87570a4aa9cc0262c2fd81'
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('2b487180fe5a0146008919b2e5d17f08c1f1bc38ded5ace45fcb9834cde6c051')

package() {
  cd "instrument-serif-$_commit"

  # Install font files
  install -Dm644 fonts/ttf/*.ttf -t "$pkgdir/usr/share/fonts/TTF/"

  # Install license
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
