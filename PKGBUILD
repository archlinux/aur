# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=otf-eb-garamond
pkgver=0.016
pkgrel=2
pkgdesc="Digitization of the Garamond font shown on the Egenolff-Berner specimen."
arch=('any')
url="http://www.georgduffner.at/ebgaramond/"
license=(OFL)
source=(https://bitbucket.org/georgd/eb-garamond/downloads/EBGaramond-$pkgver.zip)
sha256sums=('a0b77b405f55c10cff078787ef9d2389a9638e7604d53aa80207fe62e104c378')

package() {
  cd "EBGaramond-$pkgver"
  install -Dm644 otf/*.otf -t "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
