# Maintainer: andy21m <dev@ashtech.io>
pkgname=ttf-blankenburg
pkgver=0.1
pkgrel=1
pkgdesc="Modern blackletter font: a free, depoliticised semi-condensed Tannenberg variant by Peter Wiegel"
arch=('any')
url="http://www.peter-wiegel.de/Blankenburg.html"
license=('OFL-1.1')
depends=('fontconfig')
source=("fonts-blankenburg-$pkgver.tar.gz::https://deb.debian.org/debian/pool/main/f/fonts-blankenburg/fonts-blankenburg_$pkgver.orig.tar.gz")
sha256sums=('f83c895294a9796a8c55c5376a591d6cf832039768c2460ec57253478e1f7699')

package() {
  cd "$srcdir/fonts-blankenburg-$pkgver"
  install -Dm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 "Open Font License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
