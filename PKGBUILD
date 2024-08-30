# Maintainer: Dhruva Sambrani <dhruvasambrani19 at gmail dot com>
pkgname=nithya-ranjana-otf-bin
pkgver=1.000
_pkgname=NithyaRanjana-Regular
pkgrel=1
pkgdesc='A typeface based on the calligraphic Ranjana script, based on the Devanagari (DU) and Newa (NU) Unicodes, used to write Sanskrit and Nepal Bhasa'
arch=('any')
url='https://github.com/EkType/Nithya-Ranjana'
license=('OFL')
source=("${url}/releases/download/${pkgver}/NithyaRanjana-Regular.zip")
sha256sums=('c6abe96d281103e815d64d266091d13a1300abf7cdb37aa88e88d72967ae0cbf')

package() {
  cd $srcdir
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -Dm644 *.otf -t "$pkgdir/usr/share/fonts/$_pkgname-otf/"
}

