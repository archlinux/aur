# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=pragmatapro-fonts
pkgver=0.830
pkgrel=1
pkgdesc="A condensed monospaced font optimized for screen, designed by Fabrizio Schiavi to be the ideal font for coding, math and engineering"
url="https://fsd.it/shop/fonts/pragmatapro/"
arch=(any)
license=(custom)
# Note: you need to buy the font at $url and place the zip file in the current or $SRCDEST directory.
source=('local://PPR-zpw12.zip')
sha256sums=('c3f9684c882fc31ef791253960bd97be01da08076968f951b8ac1b8c9a49d98e')

options=("!strip")

package() {
  cd "PragmataPro-Regular${pkgver}"
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *.ttf
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYRIGHT+EULA.txt
}
