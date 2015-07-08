# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=otf-eb-garamond
pkgver=0.016
pkgrel=2
pkgdesc="Digitization of the Garamond shown on the Egenolff-Berner specimen."
arch=('any')
url="http://www.georgduffner.at/ebgaramond/"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=(https://bitbucket.org/georgd/eb-garamond/downloads/EBGaramond-$pkgver.zip)
sha1sums=('c88ce0551eca9d03954d1cbce54a83d4a4d2b1e2')

package() {
  cd "$srcdir/EBGaramond-$pkgver"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 otf/*.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
