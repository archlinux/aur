# Maintainer: Brandon 'Inco' Little <drinco@posteo.net>

pkgname=otf-daggersquare
pkgver=1
pkgrel=1
pkgdesc='Geometrical display sans font with a techno style'
arch=(any)
license=(custom:FFC)
url='https://www.1001fonts.com/daggersquare-font.html'
provides=(DAGGERSQUARE)
source=('https://www.1001fonts.com/download/daggersquare.zip')
sha256sums=('6136a835e22816221034bf07edd05d4a91e9133da4158e4cdf34e32688640fa2')

package() {
  # install fonts
  install -Dt "$pkgdir/usr/share/fonts/$pkgname/" -m644 *.otf

  # install license
  cp 1001fonts-daggersquare-eula.txt LICENSE
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}
